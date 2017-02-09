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

namespace TradingControl.Views
{
    /// <summary>
    /// Окно для определения количества товара.
    /// </summary>
    public partial class ItemCountWindow : Window
    {
        private int _itemCounter;

        public ItemCountWindow()
        {
            InitializeComponent();
            InitializeDialog();
        }

        private void InitializeDialog()
        {
            this.DataContext = this;
        }

        public int ItemCounter
        {
            get { return _itemCounter; }
            set
            {
                _itemCounter = value;
            }
        }

        private void SetOk(object sender, RoutedEventArgs e)
        {
            DialogResult = true;
            this.Close();
        }
    }
}
