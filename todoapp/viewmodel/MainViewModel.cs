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

        public void AddTask(string task)
        {
            using (var conn = new NpgsqlConnection(connString))
            {
                conn.Open();

                // Check the maximum existing ID in the 'todos' table
                var getMaxIdSql = "SELECT COALESCE(MAX(id), 0) FROM todos";
                int maxId;

                using (var getMaxIdCmd = new NpgsqlCommand(getMaxIdSql, conn))
                {
                    maxId = Convert.ToInt32(getMaxIdCmd.ExecuteScalar());
                }

                // Increment the ID for the new task
                var newTaskId = maxId + 1;

                var sql = "INSERT INTO todos (id, task, completed) VALUES (@id, @task, false)";
                using (var cmd = new NpgsqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("id", newTaskId);
                    cmd.Parameters.AddWithValue("task", task);
                    cmd.ExecuteNonQuery();
                }
            }
        }

        public ObservableCollection<string> GetTasks()
        {
            ObservableCollection<string> tasks = new ObservableCollection<string>();

            using (var conn = new NpgsqlConnection(connString))
            {
                conn.Open();

                var sql = "SELECT * FROM todos";
                using (var cmd = new NpgsqlCommand(sql, conn))
                {
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            tasks.Add($"ID: {reader.GetInt32(0)}, Task: {reader.GetString(1)}, Completed: {reader.GetBoolean(2)}");
                        }
                    }
                }
            }

            return tasks;
        }

        public void UpdateTask(int taskId)
        {
            using (var conn = new NpgsqlConnection(connString))
            {
                conn.Open();

                var sql = "UPDATE todos SET completed = true WHERE id = @id";
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

                var sql = "UPDATE todos SET task = @task WHERE id = @id";
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

                var sql = "DELETE FROM todos WHERE id = @id";
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

        public MainViewModel(string connectionString)
        {
            databaseHandler = new DatabaseHandler(connectionString);
            items = databaseHandler.GetTasks();
            text = string.Empty; // Initialize 'text' to a non-null value
        }
        [ObservableProperty]
        ObservableCollection<string> items;

        [ObservableProperty]
        string text;

        [RelayCommand]
    
        void AddCommand()
        {
            if (string.IsNullOrWhiteSpace(Text))
                return;

            databaseHandler.AddTask(Text);
            Items = databaseHandler.GetTasks(); // Refresh the tasks after adding
            Text = string.Empty;
        }

        [RelayCommand]
        void Delete(string s)
        {
            if (Items.Contains(s))
            {
                var taskId = GetTaskIdFromDisplayString(s);
                databaseHandler.DeleteTask(taskId);
                Items = databaseHandler.GetTasks(); // Refresh the tasks after deleting
            }
        }
        
       
        private async Task<string> PromptUserForNewTaskNameAsync()
        {
            return await App.Current.MainPage.DisplayPromptAsync("Edit Task", "Enter the new task name:", "OK", "Cancel", "New Task Name");
        }
        [RelayCommand]
        public async void Edit(string s)
        {
            if (Items.Contains(s))
            {
                var taskId = GetTaskIdFromDisplayString(s);
                var newTaskName = await PromptUserForNewTaskNameAsync(); // Await here
                databaseHandler.UpdateTaskName(taskId, newTaskName);
                Items = databaseHandler.GetTasks(); // Refresh the tasks after editing
            }
        }

        [RelayCommand]
        public void Complete(string s)
        {
            if (Items.Contains(s))
            {
                var taskId = GetTaskIdFromDisplayString(s);
                databaseHandler.UpdateTask(taskId);
                Items = databaseHandler.GetTasks(); // Refresh the tasks after marking as completed
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