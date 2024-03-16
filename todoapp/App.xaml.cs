

using Microsoft.Maui.Controls;

namespace todoapp;

public partial class App : Application
{
    public App()
    {
        InitializeComponent();

        MainPage = new AppShell();
    }
}