using PP05Gapeev.DataFolder;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using PP05Gapeev.WindowFolder;
using PP05Gapeev.ClassFolder;

namespace PP05Gapeev.WindowFolder
{
    /// <summary>
    /// Логика взаимодействия для ListWindow.xaml
    /// </summary>
    public partial class ListWindow : Window
    {
        public ListWindow()
        {
            InitializeComponent();
            ListDG.ItemsSource = DBEntities.GetContext().Operations.ToList().
                OrderBy(c => c.IdFirmOperations);
            CompanyCB.ItemsSource = DBEntities.GetContext()
                .Firm.ToList();
            MonthCB.ItemsSource = DBEntities.GetContext()
                .Month.ToList();
        }

        private void DelDtn_Click(object sender, RoutedEventArgs e)
        {
            Operations operations = ListDG.SelectedItem as Operations;
            DBEntities.GetContext().Operations.Remove(operations);
            DBEntities.GetContext().SaveChanges();
            ListDG.ItemsSource = DBEntities.GetContext().Operations.ToList().
                OrderBy(c => c.IdFirmOperations);

        }

        private void CreatorDtn_Click(object sender, RoutedEventArgs e)
        {
            AdminWindow adminWindow = new AdminWindow();
            adminWindow.Show();
        }

        private void ListDG_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            if (ListDG.SelectedItem == null)
            {
                // MBClass.MBError("Не выбран матч для ставки");
            }
            else
            {
                Operations operations = ListDG.SelectedItem as Operations;
                VariableClass.IdOperations = operations.IdOperations;
                new OperationsEditWindow(ListDG.SelectedItem as Operations).Show();
                ListDG.ItemsSource = DBEntities.GetContext().Operations.ToList().OrderBy(c => c.IdOperations);

                ListDG.ItemsSource = DBEntities.GetContext().Operations.ToList().
                    OrderBy(c => c.IdOperations);
                ListDG.ItemsSource = DBEntities.GetContext().Operations.ToList().
               OrderBy(c => c.IdFirmOperations);
                this.Close();
            }
        }
    }
}
