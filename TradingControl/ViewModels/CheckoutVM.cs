using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TradingControl.ViewModels
{
    /// <summary>
    /// Модель представления расчета чека.
    /// </summary>
    public class CheckoutVM : ViewModelBase
    {
        private double _checkoutValue;
        private double _changeValue;
        private double _cashValue;

        public CheckoutVM(double checkout_value)
        {
            CheckoutValue = checkout_value;
        }

        #region Props
        public double CheckoutValue
        {
            get { return _checkoutValue; }
            set
            {
                _checkoutValue = value;
                OnPropertyChanged();
            }
        }

        public double ChangeValue
        {
            get { return _changeValue; }
            set
            {
                _changeValue = value;
                OnPropertyChanged();
            }
        }

        public double CashValue
        {
            get { return _cashValue; }
            set
            {
                _cashValue = value;
                OnPropertyChanged();

                RefreshChangeValue();
            }
        }
        #endregion

        /// <summary>
        /// Обновить информацию о сумме сдачи.
        /// </summary>
        public void RefreshChangeValue()
        {
            ChangeValue = CashValue - CheckoutValue;
        }
    }
}
