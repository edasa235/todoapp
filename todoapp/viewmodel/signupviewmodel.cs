using Microsoft.Maui.Controls;
using Npgsql;
using BCrypt;
using System;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;

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
        public RelayCommand NavigateToLoginCommand { get; }

        public signupviewmodel()
        {
            connString = "Host=localhost;Port=54324;Username=edasa001;Password=hello;Database=todoapp;";
            SignupCommand = new RelayCommand(Signup);
            NavigateToLoginCommand = new RelayCommand(NavigateToLogin);
        }

        private async void NavigateToLogin()
        {
            try
            {
                if (Application.Current.MainPage is NavigationPage navigationPage)
                {
                    await navigationPage.PushAsync(new LoginPage());
                    await Application.Current.MainPage.DisplayAlert("Success", "Navigated to login page successfully.", "OK");
                }
                else
                {
                    Console.WriteLine("Application.Current.MainPage is not a NavigationPage. Unable to navigate to login page.");
                    await Application.Current.MainPage.DisplayAlert("Error", "Unable to navigate to login page. Current page is not a NavigationPage.", "OK");
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error navigating to login page: {ex}");
                await Application.Current.MainPage.DisplayAlert("Error", $"An error occurred while navigating to login page: {ex.Message}", "OK");
            }
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
                string salt = BCrypt.Net.BCrypt.GenerateSalt(13);
                string hashedPassword = BCrypt.Net.BCrypt.HashPassword(Password, salt);
                using (var conn = new NpgsqlConnection(connString))
                {
                    conn.Open();

                    var sql = "INSERT INTO users (username, password) VALUES (@Username, @Password) RETURNING user_id";
                    using (var cmd = new NpgsqlCommand(sql, conn))
                    {
                        cmd.Parameters.AddWithValue("Username", Username);
                        cmd.Parameters.AddWithValue("Password", hashedPassword);
                        // ExecuteScalar returns the value of the first column of the first row
                        object result = cmd.ExecuteScalar();
                        if (result != null)
                        {
                            int userId = Convert.ToInt32(result);

                            // Now, you can store this userId for further use, like associating with todo items.
                        }
                    }
                }
            }
            catch (Npgsql.PostgresException ex) when (ex.SqlState == "23505") // Unique constraint violation
            {
                Console.WriteLine($"Npgsql Error: {ex}");
                await Application.Current.MainPage.DisplayAlert("Error", "Username already exists. Please choose a different one.", "OK");
            }
            catch (NpgsqlException ex)
            {
                Console.WriteLine($"Npgsql Error: {ex}");
                await Application.Current.MainPage.DisplayAlert("Error", "An error occurred during signup. Please check the logs for more details.", "OK");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error: {ex}");
                await Application.Current.MainPage.DisplayAlert("Error", "An unexpected error occurred during signup. Please check the logs for more details.", "OK");
            }
        }
    }
}
