using System;
using System.ComponentModel;
using System.Threading.Tasks;
using System.Windows.Input;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Microsoft.Maui.Controls;
using todoapp;

namespace todoapp.viewmodel
{
    public class LoginViewModel : ObservableRecipient
    {
        private string _username;
        private string _password;
        private readonly string _connectionString = "Host=localhost;Port=54324;Username=edasa001;Password=hello;Database=todoapp";

        public string Username
        {
            get => _username;
            set => SetProperty(ref _username, value);
        }

        public string Password
        {
            get => _password;
            set => SetProperty(ref _password, value);
        }

        public ICommand LoginCommand { get; }

        public LoginViewModel()
        {
            LoginCommand = new RelayCommand(async () => await Login());
        }

        private async Task Login()
        {
            try
            {
                if (string.IsNullOrEmpty(Username) || string.IsNullOrEmpty(Password))
                {
                    // Display error message for empty username or password
                    await Application.Current.MainPage.DisplayAlert("Error", "Please enter username and password.", "OK");
                    return;
                }

                // Establish connection to PostgreSQL database
                using (var connection = new Npgsql.NpgsqlConnection(_connectionString))
                {
                    await connection.OpenAsync();

                    // Construct SQL query
                    var command = new Npgsql.NpgsqlCommand(
                        "SELECT password FROM users WHERE username = @Username", connection);
                    command.Parameters.AddWithValue("Username", Username);

                    // Execute SQL query
                    var hashedPassword = (string)await command.ExecuteScalarAsync();

                    // Verify password
                    if (hashedPassword != null && BCrypt.Net.BCrypt.Verify(Password, hashedPassword))
                    {
                        // Navigate to main page
                        await Application.Current.MainPage.Navigation.PushAsync(new MainPage());
                    }
                    else
                    {
                        // Display error message for incorrect username or password
                        await Application.Current.MainPage.DisplayAlert("Error", "Invalid username or password.", "OK");
                    }
                }
            }
            catch (Npgsql.PostgresException ex)
            {
                // Handle PostgreSQL exceptions
                string errorMessage = ex.SqlState switch
                {
                    // Add specific error messages for different PostgreSQL error codes if needed
                    _ => "An error occurred during login."
                };

                // Log error message
                Console.WriteLine(errorMessage);

                // Display error message
                await Application.Current.MainPage.DisplayAlert("Error", errorMessage, "OK");
            }
            catch (Exception ex)
            {
                // Handle general exceptions
                // Log error message
                Console.WriteLine(ex.Message);

                // Display error message
                await Application.Current.MainPage.DisplayAlert("Error", "An error occurred during login.", "OK");
            }
        }
    }
}
