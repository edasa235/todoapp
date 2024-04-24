using System;
using System.ComponentModel;
using System.Threading.Tasks;
using System.Windows.Input;
using CommunityToolkit.Mvvm.Input;
using Microsoft.Maui.Controls;
using todoapp;

namespace todoapp.viewmodel
{
    public partial class signupviewmodel : INotifyPropertyChanged
    {
        public event PropertyChangedEventHandler PropertyChanged;

        public string Username { get; set; }
        public string Password { get; set; }

        public ICommand SignUpCommand => new Command(async () => await SignUp());

        public async Task SignUp()
        {
            try
            {
                if (string.IsNullOrEmpty(Username) || string.IsNullOrEmpty(Password))
                {
                    // Display error message for empty username or password
                    return;
                }

                // Generate salt and hash password
                string salt = BCrypt.Net.BCrypt.GenerateSalt();
                string hashedPassword = BCrypt.Net.BCrypt.HashPassword(Password, salt);

                // Establish connection to PostgreSQL database
                using (var connection =
                       new Npgsql.NpgsqlConnection(
                           "Host=localhost;Port=54324;Username=edasa001;Password=hello;Database=todoapp"))
                {
                    await connection.OpenAsync();

                    // Construct SQL query
                    var command = new Npgsql.NpgsqlCommand(
                        "INSERT INTO users (username, password) VALUES (@Username, @Password) RETURNING user_id",
                        connection);
                    command.Parameters.AddWithValue("Username", Username);
                    command.Parameters.AddWithValue("Password", hashedPassword);

                    // Execute SQL query
                    var userId = await command.ExecuteScalarAsync();

                    // Convert the user_id returned by the database to an integer
                    int userIdInt = Convert.ToInt32(userId);

                    // Display success message
                    await Application.Current.MainPage.DisplayAlert("Success", "Sign up successful!", "OK");

                    // Navigate to login page
                    NavigateToLogin();
                }
            }
            catch (Npgsql.PostgresException ex)
            {
                // Handle specific PostgreSQL exceptions (e.g., unique constraint violations)
                string errorMessage = ex.SqlState switch
                {
                    "23505" => "Username already exists.",
                    _ => "An error occurred during sign up."
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
                await Application.Current.MainPage.DisplayAlert("Error", "An error occurred during sign up.", "OK");
            }
        }

        [RelayCommand]
        public void GoToLoginPage()
        {
            try
            {
                if (Application.Current.MainPage is NavigationPage navigationPage)
                {
                    navigationPage.PushAsync(new LoginPage());
                    // Display success message
                    Application.Current.MainPage.DisplayAlert("Success", "Navigated to login page.", "OK");
                }
                else
                {
                    // Display error message if the current page is not a NavigationPage
                    Application.Current.MainPage.DisplayAlert("Error", "Unable to navigate to login page.", "OK");
                }
            }
            catch (Exception ex)
            {
                // Log error message
                Console.WriteLine(ex.Message);

                // Display error message
                Application.Current.MainPage.DisplayAlert("Error", "An error occurred during navigation.", "OK");
            }
        }

        public void NavigateToLogin()
        {
            try
            {
                if (Application.Current.MainPage is NavigationPage navigationPage)
                {
                    navigationPage.PushAsync(new LoginPage());
                    // Display success message
                    Application.Current.MainPage.DisplayAlert("Success", "Navigated to login page.", "OK");
                }
                else
                {
                    // Display error message if the current page is not a NavigationPage
                    Application.Current.MainPage.DisplayAlert("Error", "Unable to navigate to login page.", "OK");
                }
            }
            catch (Exception ex)
            {
                // Log error message
                Console.WriteLine(ex.Message);

                // Display error message
                Application.Current.MainPage.DisplayAlert("Error", "An error occurred during navigation.", "OK");
            }
        }
    }
}