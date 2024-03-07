using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;


namespace todoapp.viewmodel;

public partial class MainViewModel: ObservableObject
{
    public MainViewModel()
    {
        items = new ObservableCollection<string>();
    }
    [ObservableProperty]
      ObservableCollection<string> items;
     [ObservableProperty]
     string text;
     [RelayCommand]
     void Add()
     {
         if (string.IsNullOrWhiteSpace(text))
             return;
         items.Add(text);
          text = string.Empty;
     }

     [RelayCommand]
     void delete(string s)
     {
         if (items.Contains(s))
         {
             items.Remove(s);
         }
         {
             
         }
     }
}