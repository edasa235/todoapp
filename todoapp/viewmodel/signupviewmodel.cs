using System;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Npgsql;
using BCrypt;
using Microsoft.Maui.Controls;

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
            connString = "Host=localhost;Port=54324;Username=edasa001;Password=hello;Database=todoapp;";
            SignupCommand = new RelayCommand(Signup);
        }

        private async void Signup()
        {
            if (string.IsNullOrWhiteSpace(Username) || string.IsNullOrWhiteSpace(Password))
            {
                await Application.Current.MainPage.DisplayAlert("Error", "Please enter both username and password.", "OK");
                return;
            }

            try
            {
                // Hash the password before storing it
                string hashedPassword = BCrypt.Net.BCrypt.EnhancedHashPassword(Password, 13);

                using (var conn = new NpgsqlConnection(connString))
                {
                    conn.Open();

                    var sql = "INSERT INTO users (username, password_hash) VALUES (@Username, @Password)";
                    using (var cmd = new NpgsqlCommand(sql, conn))
                    {
                        cmd.Parameters.AddWithValue("Username", Username);
                        cmd.Parameters.AddWithValue("Password", hashedPassword);
                        cmd.ExecuteNonQuery();
                    }
                }

                // After successful sign-up, show a success notification
                await Application.Current.MainPage.DisplayAlert("Success", "You have successfully signed up!", "OK");

                // Navigate to the main page
                await Application.Current.MainPage.Navigation.PushAsync(new MainPage());
            }
            catch (NpgsqlException ex)
            {
                // Log Npgsql exceptions
                Console.WriteLine($"Npgsql Error: {ex}");

                // Show an error notification
                await Application.Current.MainPage.DisplayAlert("Error", "An error occurred during signup. Please check the logs for more details.", "OK");
            }
            catch (Exception ex)
            {
                // Log other exceptions
                Console.WriteLine($"Error: {ex}");

                // Show an error notification
                await Application.Current.MainPage.DisplayAlert("Error", "An unexpected error occurred during signup. Please check the logs for more details.", "OK");
            }
        }



        private string HashPassword(string password)
        {
            return password; // Placeholder, replace with actual hashing logic
        }
        
    }
}
