using System;
using Npgsql;
using System.Collections.ObjectModel;
using System.Threading.Tasks;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;

namespace todoapp.viewmodel
{
    public class DatabaseHandler
    {
        private string connString;

        public DatabaseHandler(string connectionString)
        {
            connString = connectionString;
        }

        public void AddTask(string task, int priority, int userId)
        {
            using (var conn = new NpgsqlConnection(connString))
            {
                conn.Open();

                var getMaxIdSql = "SELECT COALESCE(MAX(task_id), 0) FROM todo";
                int maxId;

                using (var getMaxIdCmd = new NpgsqlCommand(getMaxIdSql, conn))
                {
                    maxId = Convert.ToInt32(getMaxIdCmd.ExecuteScalar());
                }

                var newTaskId = maxId + 1;

                var sql =
                    "INSERT INTO todo (task, completed, priority, user_id) VALUES (@task, @completed, @priority, @user_id)";
                using (var cmd = new NpgsqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("task", task);
                    cmd.Parameters.AddWithValue("completed", false);
                    cmd.Parameters.AddWithValue("priority", priority);
                    cmd.Parameters.AddWithValue("user_id", userId); // Include userId parameter
                    cmd.ExecuteNonQuery();
                }
            }
        }


        public ObservableCollection<string> GetTasksForUser(int userId)
        {
            ObservableCollection<string> tasks = new ObservableCollection<string>();

            using (var conn = new NpgsqlConnection(connString))
            {
                conn.Open();

                var sql = "SELECT * FROM todo WHERE user_id = @user_id ORDER BY priority DESC";
                using (var cmd = new NpgsqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("user_id", userId); // Pass userId as parameter
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            string priorityString = new string('*', reader.GetInt32(3)); // Convert priority to asterisks
                            tasks.Add(
                                $"ID: {reader.GetInt32(0)}, Task: {reader.GetString(1)}, Completed: {reader.GetBoolean(2)}, Priority: {priorityString}");
                        }
                    }
                }
            }

            return tasks;
        }
        public void IncreasePriority(int taskId)
        {
            using (var conn = new NpgsqlConnection(connString))
            {
                conn.Open();

                var sql = "UPDATE todo SET priority = priority + 1 WHERE task_id = @id";
                using (var cmd = new NpgsqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("id", taskId);
                    int rowsAffected = cmd.ExecuteNonQuery();
                }
            }
        }

        public void DecreasePriority(int taskId)
        {
            using (var conn = new NpgsqlConnection(connString))
            {
                conn.Open();

                var sql =
                    "UPDATE todo SET priority = CASE WHEN priority > 0 THEN priority - 1 ELSE 0 END WHERE task_id = @id";
                using (var cmd = new NpgsqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("id", taskId);
                    int rowsAffected = cmd.ExecuteNonQuery();
                }
            }
        }

        public void UpdateTask(int taskId)
        {
            using (var conn = new NpgsqlConnection(connString))
            {
                conn.Open();

                var sql = "UPDATE todo SET completed = true WHERE task_id = @id";
                using (var cmd = new NpgsqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("id", taskId);
                    int rowsAffected = cmd.ExecuteNonQuery();
                }
            }
        }

        public void UpdateTaskName(int taskId, string newTaskName)
        {
            using (var conn = new NpgsqlConnection(connString))
            {
                conn.Open();

                var sql = "UPDATE todo SET task = @task WHERE task_id = @id";
                using (var cmd = new NpgsqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("id", taskId);
                    cmd.Parameters.AddWithValue("task", newTaskName);
                    int rowsAffected = cmd.ExecuteNonQuery();
                }
            }
        }

        public void DeleteTask(int taskId)
        {
            using (var conn = new NpgsqlConnection(connString))
            {
                conn.Open();

                var sql = "DELETE FROM todo WHERE task_id = @id";
                using (var cmd = new NpgsqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("id", taskId);
                    int rowsAffected = cmd.ExecuteNonQuery();
                }
            }
        }
    }

    public partial class MainViewModel : ObservableObject
    {
        private DatabaseHandler databaseHandler;
        private readonly string _connectionString;
        private int _userId; // Define userId field
        public int UserId
        {
            get => _userId;
            set => SetProperty(ref _userId, value);
        }

        public MainViewModel(string connectionString, int userId) // Accept userId as parameter
        {
            _connectionString = connectionString;
            _userId = userId;
            databaseHandler = new DatabaseHandler(_connectionString);
            items = new ObservableCollection<string>(); // Initialize empty collection initially
            text = string.Empty; // Initialize 'text' to a non-null value

            // Call LoadTasks method here
            LoadTasks();
        }

        private void LoadTasks()
        {
            // Query tasks for the logged-in user based on user_id
            items = databaseHandler.GetTasksForUser(_userId);
        }

        [ObservableProperty] ObservableCollection<string> items;

        [ObservableProperty] string text;

        [RelayCommand]
        void AddCommand()
        {
            if (string.IsNullOrWhiteSpace(Text))
                return;

            databaseHandler.AddTask(Text, 0, _userId); // Pass userId to AddTask method
            Items = databaseHandler.GetTasksForUser(_userId); // Refresh the tasks after adding
            Text = string.Empty;
        }

        [RelayCommand]
        void Delete(string s)
        {
            if (Items.Contains(s))
            {
                var taskId = GetTaskIdFromDisplayString(s);
                databaseHandler.DeleteTask(taskId);
                Items = databaseHandler.GetTasksForUser(_userId); // Refresh the tasks after deleting
            }
        }

        private async Task<string> PromptUserForNewTaskNameAsync()
        {
            return await App.Current.MainPage.DisplayPromptAsync("Edit Task", "Enter the new task name:", "OK",
                "Cancel", "New Task Name");
        }

        [RelayCommand]
        public async void Edit(string s)
        {
            if (Items.Contains(s))
            {
                var taskId = GetTaskIdFromDisplayString(s);
                var newTaskName = await PromptUserForNewTaskNameAsync();
                databaseHandler.UpdateTaskName(taskId, newTaskName);
                Items = databaseHandler.GetTasksForUser(_userId); // Refresh the tasks after editing
            }
        }

        [RelayCommand]
        public void Complete(string s)
        {
            if (Items.Contains(s))
            {
                var taskId = GetTaskIdFromDisplayString(s);
                databaseHandler.UpdateTask(taskId);
                Items = databaseHandler.GetTasksForUser(_userId); // Refresh the tasks after marking as completed
            }
        }

        [RelayCommand]
        public void IncreasePriorityCommand(string s)
        {
            if (Items.Contains(s))
            {
                var taskId = GetTaskIdFromDisplayString(s);
                databaseHandler.IncreasePriority(taskId);
                Items = databaseHandler.GetTasksForUser(_userId); // Refresh the tasks after increasing priority
            }
        }

        [RelayCommand]
        public void DecreasePriorityCommand(string s)
        {
            if (Items.Contains(s))
            {
                var taskId = GetTaskIdFromDisplayString(s);
                databaseHandler.DecreasePriority(taskId);
                Items = databaseHandler.GetTasksForUser(_userId); // Refresh the tasks after decreasing priority
            }
        }

        // Helper method to extract Task ID from display string (assuming the format is "ID: {id}, Task: {task}, Completed: {completed}")
        private int GetTaskIdFromDisplayString(string displayString)
        {
            var idStartIndex = displayString.IndexOf(":") + 1;
            var idEndIndex = displayString.IndexOf(",");
            var idSubstring = displayString.Substring(idStartIndex, idEndIndex - idStartIndex).Trim();
            return int.Parse(idSubstring);
        }
    }
}