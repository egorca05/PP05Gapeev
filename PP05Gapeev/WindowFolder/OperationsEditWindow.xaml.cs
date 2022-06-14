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

        private void SaveBtn_Click(object sender, RoutedEventArgs e)
        {

        }

        private void ClosedBtn_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}
