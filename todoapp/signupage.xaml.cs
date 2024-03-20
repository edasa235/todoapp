using Microsoft.Maui.Controls;
using todoapp;

namespace todoapp
{
    public partial class SignupPage : ContentPage
    {
        public SignupPage()
        {
            InitializeComponent();
            
        }

        private async void NavigateToMainPage()
        {
            await Navigation.PushAsync(new MainPage());
        }
    }
}