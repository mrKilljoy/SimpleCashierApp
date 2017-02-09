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
    /// Окно для итогового расчета.
    /// </summary>
    public partial class CheckoutWindow : Window
    {
        private ViewModels.CheckoutVM _vm;

        /// <summary>
        /// Диалоговое окно для проведения расчета.
        /// </summary>
        /// <param name="checkoutValue">Общая сумма к оплате.</param>
        public CheckoutWindow(double checkoutValue)
        {
            InitializeComponent();

            _vm = new ViewModels.CheckoutVM(checkoutValue);
            this.DataContext = _vm;
        }

        public double CashInput
        {
            get { return _vm.CashValue; }
        }

        /// <summary>
        /// Принять команду на расчет и закрыть окно.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void Accept(object sender, RoutedEventArgs e)
        {
            DialogResult = true;
            this.Close();
        }
    }
}
