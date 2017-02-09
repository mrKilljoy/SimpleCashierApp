using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel;
using TradingDAL.Models;

namespace TradingControl.Infrastructure
{
    /// <summary>
    /// Класс-обертка для хранения динамического списка элементов (товары в чеке).
    /// </summary>
    public class SaleItemWrapper : INotifyPropertyChanged
    {
        private DateTime _saleDate;
        private StoreItem _item;
        private Bill _bill;
        private int _itemAmount;
        private double _totalPrice;

        public DateTime SaleDate
        {
            get { return _saleDate; }
            set
            {
                _saleDate = value;
                OnPropertyChanged();
            }
        }

        public virtual StoreItem Item
        {
            get { return _item; }
            set
            {
                _item = value;
                OnPropertyChanged();
            }
        }

        public virtual Bill Bill
        {
            get { return _bill; }
            set
            {
                _bill = value;
                OnPropertyChanged();
            }
        }

        public int ItemAmount
        {
            get { return _itemAmount; }
            set
            {
                _itemAmount = value;
                OnPropertyChanged();
            }
        }

        public double TotalPrice
        {
            get { return _totalPrice; }
            set
            {
                _totalPrice = value;
                OnPropertyChanged();
            }
        }


        #region Interface implementation details
        public event PropertyChangedEventHandler PropertyChanged;

        protected virtual void OnPropertyChanged([System.Runtime.CompilerServices.CallerMemberName] string propertyName = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
        #endregion

        #region Convertation details
        public static explicit operator SaleItemWrapper(Sale oldItem)
        {
            SaleItemWrapper newItem = new SaleItemWrapper
            {
                Bill = oldItem.Bill,
                Item = oldItem.Item,
                SaleDate = oldItem.SaleDate,
                ItemAmount = oldItem.ItemAmount,
                TotalPrice = oldItem.TotalPrice
            };

            return newItem;
        }

        public static explicit operator Sale(SaleItemWrapper oldItem)
        {
            Sale newItem = new Sale
            {
                Bill = oldItem.Bill,
                Item = oldItem.Item,
                SaleDate = oldItem.SaleDate,
                ItemAmount = oldItem.ItemAmount,
                TotalPrice = oldItem.TotalPrice
            };

            return newItem;
        }
        #endregion
    }
}
