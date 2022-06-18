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
using PP05Gapeev.DataFolder;
using PP05Gapeev.ClassFolder;

namespace PP05Gapeev.WindowFolder
{
    /// <summary>
    /// Логика взаимодействия для OperationsEditWindow.xaml
    /// </summary>
    public partial class OperationsEditWindow : Window
    {
        public OperationsEditWindow(Operations operations)
        {
            InitializeComponent();
            DataContext = operations;
        }
        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            int Pur = Convert.ToInt32(PurchasedOperationsTB.Text);
        }

        private void PlBtn_Click(object sender, RoutedEventArgs e)
        {
            int PurPl = Convert.ToInt32(PurchasedOperationsTB.Text);
            PurPl++;
            PurchasedOperationsTB.Text = Convert.ToString(PurPl);
        }

        private void MinBtn_Click(object sender, RoutedEventArgs e)
        {
            int PurMn = Convert.ToInt32(PurchasedOperationsTB.Text);
            PurMn--;
            PurchasedOperationsTB.Text = Convert.ToString(PurMn);
        }

        private void SMinBtn_Click(object sender, RoutedEventArgs e)
        {
            int SalPl = Convert.ToInt32(SalesOperationsTB.Text);
            SalPl--;
            SalesOperationsTB.Text = Convert.ToString(SalPl);
        }

        private void SPlBtn_Click(object sender, RoutedEventArgs e)
        {
            int SalMn = Convert.ToInt32(SalesOperationsTB.Text);
            SalMn++;
            SalesOperationsTB.Text = Convert.ToString(SalMn);
        }

        private void SaveBtn_Click_1(object sender, RoutedEventArgs e)
        {
            int Pur = Convert.ToInt32(PurchasedOperationsTB.Text);
            int Sal = Convert.ToInt32(SalesOperationsTB.Text);

            if (Sal > Pur)
            {
                MBClass.MBError("Количество проданных не может быть больше купленных");
                SalesOperationsTB.Focus();
                PurchasedOperationsTB.Focus();
            }
            else if (Sal < 0)
            {
                MBClass.MBError("Количество проданных не может быть отрицательным числом");
                SalesOperationsTB.Focus();
            }
            else if (Pur < 0)
            {
                MBClass.MBError("Количество купленных не может быть отрицательным числом");
                PurchasedOperationsTB.Focus();
            }
            else
            {
                Operations operations = DBEntities.GetContext().Operations
                    .FirstOrDefault(o => o.IdOperations == VariableClass.IdOperations);
                operations.PurchasedOperations = Convert.ToInt32(PurchasedOperationsTB.Text);
                operations.SalesOperations = Convert.ToInt32(SalesOperationsTB.Text);
               
                DBEntities.GetContext().SaveChanges();
                ListWindow listWindow = new ListWindow();
                listWindow.Show();
                this.Close();
            }

        }

        private void ClosedBtn_Click_1(object sender, RoutedEventArgs e)
        {
            ListWindow listWindow = new ListWindow();
            listWindow.Show();
            this.Close();
        }
    }
}
