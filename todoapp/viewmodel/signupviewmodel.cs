using System;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Npgsql;
using BCrypt;

namespace todoapp.viewmodel
{
    public partial class signupviewmodel : ObservableRecipient
    {
        private string username;
        private string password;
        private string connString; 

        public string Username
        {
            get => username;
            set => SetProperty(ref username, value);
        }

        public string Password
        {
            get => password;
            set => SetProperty(ref password, value);
        }

        public RelayCommand SignupCommand { get; }

        public signupviewmodel()
        {
            SignupCommand = new RelayCommand(Signup);
        }

        private void Signup()
        {
            if (string.IsNullOrWhiteSpace(Username) || string.IsNullOrWhiteSpace(Password))
            {
                return;
            }

            try
            {
                using (var conn = new NpgsqlConnection(connString))
                {
                    conn.Open();

                   
                    string hashedPassword = BCrypt.Net.BCrypt.EnhancedHashPassword(Password, 13);

                    var sql = "INSERT INTO users (username, password_hash) VALUES (@Username, @Password)";
                    using (var cmd = new NpgsqlCommand(sql, conn))
                    {
                        cmd.Parameters.AddWithValue("Username", Username);
                        cmd.Parameters.AddWithValue("Password", hashedPassword);
                        cmd.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle specific exceptions or log the error
                Console.WriteLine($"An error occurred: {ex.Message}");
                // You may want to throw the exception here or handle it accordingly
            }
        }
        private string HashPassword(string password)
        {
            return password; // Placeholder, replace with actual hashing logic
        }
       
    }
}
