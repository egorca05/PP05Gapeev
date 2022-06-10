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

        }

        private void CreatorDtn_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
