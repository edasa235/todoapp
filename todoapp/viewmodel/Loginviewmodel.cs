

using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Microsoft.Maui.Controls;
using Npgsql;
using BCrypt;
using System;

namespace todoapp.viewmodel
{
    public partial class LoginViewModel : ObservableRecipient
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

        public RelayCommand LoginCommand { get; }

        public LoginViewModel()
        {
            connString = "Host=localhost;Port=54324;Username=edasa001;Password=hello;Database=todoapp;";
            LoginCommand = new RelayCommand(Login);
        }

        public async void Login()
        {
            if (string.IsNullOrWhiteSpace(Username) || string.IsNullOrWhiteSpace(Password))
            {
                await Application.Current.MainPage.DisplayAlert("Error", "Please enter both username and password.", "OK");
                return;
            }

            try
            {
                using (var conn = new NpgsqlConnection(connString))
                {
                    conn.Open();

                    var sql = "SELECT password FROM users WHERE username = @Username";
                    using (var cmd = new NpgsqlCommand(sql, conn))
                    {
                        cmd.Parameters.AddWithValue("Username", Username);
                        var hashedPassword = cmd.ExecuteScalar() as string;

                        if (hashedPassword != null && BCrypt.Net.BCrypt.Verify(Password, hashedPassword))
                        {
                            if (Application.Current.MainPage is NavigationPage navigationPage)
                            {
                                await navigationPage.PushAsync(new MainPage());
                                await Application.Current.MainPage.DisplayAlert("Success", "Navigated to login page successfully.", "OK");
                            }
                        }
                        else
                        {
                            await Application.Current.MainPage.DisplayAlert("Error", "Invalid username or password.", "OK");
                        }
                    }
                }
            }
            catch (NpgsqlException ex)
            {
                Console.WriteLine($"Npgsql Error: {ex}");
                await Application.Current.MainPage.DisplayAlert("Error", "An error occurred during login. Please check the logs for more details.", "OK");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error: {ex}");
                await Application.Current.MainPage.DisplayAlert("Error", "An unexpected error occurred during login. Please check the logs for more details.", "OK");
            }
        }
    }
}
