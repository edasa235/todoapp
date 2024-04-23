using Microsoft.Maui.Controls;
using todoapp.viewmodel;

namespace todoapp
{
    public partial class MainPage : ContentPage
    {
        public MainPage(string connectionString, int userId)
        {
            InitializeComponent();
            BindingContext = new MainViewModel(connectionString, userId);
        }
    }
}