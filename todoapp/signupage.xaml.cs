using Microsoft.Maui.Controls;
using todoapp.viewmodel;
namespace todoapp;

public partial class signupage : ContentPage
{
    public signupage()
    {
        InitializeComponent();
        BindingContext = new MainViewModel("Host=localhost;Port=54324;Username=edasa001;Password=hello;Database=todoapp;");
    }
}