using Microsoft.Maui;
using Microsoft.Maui.Controls;

namespace todoapp
{
    public partial class App : Application
    {
        public App()
        {
            InitializeComponent();

            // Set the main page to your SignupPage
            MainPage = new SignupPage();
        }
    }
}