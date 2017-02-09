using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Threading;
using System.Windows.Threading;
using System.Windows.Input;
using System.Collections.ObjectModel;
using TradingControl.Infrastructure;
using TradingControl.Commands;
using TradingDAL;
using TradingDAL.Models;
using WpfControls;

namespace TradingControl.ViewModels
{
    /// <summary>
    /// Модель представления кассового модуля.
    /// </summary>
    class CashierVM : ViewModelBase
    {
        #region Fields
        private SalesRepo _repo;
        //private string _input;
        private SuggestionProvider _txtSugProvider;
        private StoreItem _storeSelectedItem;
        private SaleItemWrapper _listSelectedItem;
        private ObservableCollection<SaleItemWrapper> _pinnedItems;
        private double _billCheckout;
        private bool _isCheckoutPassing;

        private ICommand _addItemCmd;
        private ICommand _checkoutCmd;
        private ICommand _removeCmd;
        private ICommand _incrementItemAmountCmd;
        private ICommand _decrementItemAmountCmd;
        private ICommand _dropCurrentList;
        #endregion

        public CashierVM()
        {
            TextSuggestionProvider = new SuggestionProvider(ProcessSuggestion);

            _repo = new SalesRepo(new StoreContext());
            _pinnedItems = new ObservableCollection<SaleItemWrapper>();
        }

        #region Props
        //public string Input
        //{
        //    get { return _input; }
        //    set
        //    {
        //        _input = value;
        //        OnPropertyChanged();
        //    }
        //}

        public SuggestionProvider TextSuggestionProvider
        {
            get { return _txtSugProvider; }
            set
            {
                _txtSugProvider = value;
                OnPropertyChanged();
            }
        }

        /// <summary>
        /// Элемент, выбранный из выпадающего списка.
        /// </summary>
        public StoreItem StoreSelectedItem
        {
            get { return _storeSelectedItem; }
            set
            {
                _storeSelectedItem = value;
                OnPropertyChanged();
            }
        }

        /// <summary>
        /// Элемент, выбранный из таблицы с товарами.
        /// </summary>
        public SaleItemWrapper ListSelectedItem
        {
            get { return _listSelectedItem; }
            set
            {
                _listSelectedItem = value;
                OnPropertyChanged();
            }
        }

        public ObservableCollection<SaleItemWrapper> PinnedItems
        {
            get { return _pinnedItems; }
            set
            {
                _pinnedItems = value;
                OnPropertyChanged();
            }
        }

        public double BillCheckout
        {
            set
            {
                _billCheckout = value;
                OnPropertyChanged();
            }
            get { return _billCheckout; }
        }

        public bool IsCheckoutPassing
        {
            get { return _isCheckoutPassing; }
            set
            {
                _isCheckoutPassing = value;
                OnPropertyChanged();
            }
        }
        #endregion

        #region Methods

        /// <summary>
        /// Загрузить список совпадений по введенной строке.
        /// </summary>
        /// <param name="input">Введенная строка.</param>
        /// <returns></returns>
        private IEnumerable<object> ProcessSuggestion(string input)
        {
            return _repo.GetSuggestedItem(input);
        }

        /// <summary>
        /// Добавить новый элемент в список товаров.
        /// </summary>
        /// <param name="obj"></param>
        private void ProcessAttachingOperation(object obj)
        {
            if (StoreSelectedItem == null)
                return;

            int item_count = ProcessCounterDialog();
            if (item_count == 0)
                return;

            var foundItem = PinnedItems.FirstOrDefault(i => i.Item.Code == StoreSelectedItem.Code);

            if(foundItem == null)
            {
                SaleItemWrapper new_item = new SaleItemWrapper()
                {
                    Item = StoreSelectedItem,
                    SaleDate = DateTime.Now,
                    ItemAmount = item_count
                };

                new_item.TotalPrice = StoreSelectedItem.Price * new_item.ItemAmount;

                PinnedItems.Add(new_item);
            }
            else
            {
                foundItem.ItemAmount += item_count;
                foundItem.TotalPrice = foundItem.ItemAmount * foundItem.Item.Price;
            }

            OnPropertyChanged("ListSelectedItem");
            OnPropertyChanged("PinnedItems");
            
            RefreshCheckout();
        }

        /// <summary>
        /// Обновить общую сумму в чеке.
        /// </summary>
        private void RefreshCheckout()
        {
            BillCheckout = PinnedItems.Sum(i => i.TotalPrice);
            OnPropertyChanged("BillCheckout");
        }

        /// <summary>
        /// Вызвать диалог для определения количества выбранного товара.
        /// </summary>
        /// <returns></returns>
        private int ProcessCounterDialog()
        {
            Views.ItemCountWindow wnd = new Views.ItemCountWindow();
            if (wnd.ShowDialog() == true)
                return wnd.ItemCounter;
            else
                return 0;
        }

        /// <summary>
        /// Вызвать диалог для расчета суммы чека.
        /// </summary>
        /// <param name="obj"></param>
        private void ProcessCheckoutDialog(object obj)
        {
            if (BillCheckout < 1)
            {
                Xceed.Wpf.Toolkit.MessageBox.Show("Список товаров пуст!", "Внимание", System.Windows.MessageBoxButton.OK, System.Windows.MessageBoxImage.Warning);
                return;
            }

            if (IsCheckoutPassing)
                return;

            double cash_value = default(double);
            var cashier = AccountHelper.CurrentEmployee;

            Views.CheckoutWindow wnd = new Views.CheckoutWindow(BillCheckout);
            if (wnd.ShowDialog() == true)
            {
                cash_value = wnd.CashInput;

                Task.Run(() =>
                {
                    IsCheckoutPassing = true;

                    try
                    {
                        var items = PinnedItems.Select(i => (Sale)i);
                        _repo.AddBill(items, cash_value, false, cashier);
                    }
                    catch (Exception ex)
                    {
                        System.Windows.Application.Current.Dispatcher.Invoke(delegate
                        {
                            Xceed.Wpf.Toolkit.MessageBox.Show("Ошибка в ходе расчета: " + ex.Message, "Ошибка", System.Windows.MessageBoxButton.OK, System.Windows.MessageBoxImage.Error);
                            return;
                        });
                    }

                    IsCheckoutPassing = false;

                    System.Windows.Application.Current.Dispatcher.Invoke(delegate
                    {
                        Xceed.Wpf.Toolkit.MessageBox.Show("Данные о чеке сохранены!", "Сообщение", System.Windows.MessageBoxButton.OK, System.Windows.MessageBoxImage.Information);
                        DropList(null);
                        return;
                    });
                });
            }
        }

        /// <summary>
        ///  Удалить выбранный элемент из списка товаров.
        /// </summary>
        /// <param name="obj"></param>
        private void RemoveSelectedItem(object obj)
        {
            var selected_item = obj as SaleItemWrapper;

            if (selected_item == null)
                return;

            PinnedItems.Remove(selected_item);

            OnPropertyChanged("PinnedItems");
            RefreshCheckout();
        }

        /// <summary>
        /// Увеличить количество выбранного товара на 1.
        /// </summary>
        /// <param name="obj"></param>
        private void IncrementItemCount(object obj)
        {
            var selected_item = obj as SaleItemWrapper;
            if (selected_item == null)
                return;

            selected_item.ItemAmount++;
            selected_item.TotalPrice = selected_item.ItemAmount * selected_item.Item.Price;

            OnPropertyChanged("ListSelectedItem");
            OnPropertyChanged("PinnedItems");
            RefreshCheckout();
        }

        /// <summary>
        /// Уменьшить количество выбранного товара на 1.
        /// </summary>
        /// <param name="obj"></param>
        private void DecrementItemCount(object obj)
        {
            var selected_item = obj as SaleItemWrapper;
            if (selected_item == null)
                return;

            if (selected_item.ItemAmount > 1)
            {
                selected_item.ItemAmount--;
                selected_item.TotalPrice = selected_item.ItemAmount * selected_item.Item.Price;
            }   

            OnPropertyChanged("ListSelectedItem");
            OnPropertyChanged("PinnedItems");
            RefreshCheckout();
        }

        /// <summary>
        /// Очистить список товаров
        /// </summary>
        /// <param name="obj"></param>
        private void DropList(object obj)
        {
            PinnedItems.Clear();
            RefreshCheckout();
        }
        #endregion


        #region Commands
        public ICommand AddItemCommand
        {
            get { return _addItemCmd ?? (_addItemCmd = new Commands.RelayCommand(ProcessAttachingOperation)); }
        }

        public ICommand CheckoutCommand
        {
            get { return _checkoutCmd ?? (_checkoutCmd = new Commands.RelayCommand(ProcessCheckoutDialog)); }
        }

        public ICommand RemoveItemCommand
        {
            get { return _removeCmd ?? (_removeCmd = new Commands.RelayCommand(RemoveSelectedItem)); }
        }

        public ICommand IncrementItemAmountCommand
        {
            get { return _incrementItemAmountCmd ?? (_incrementItemAmountCmd = new Commands.RelayCommand(IncrementItemCount)); }
        }

        public ICommand DecrementItemAmountCommand
        {
            get { return _decrementItemAmountCmd ?? (_decrementItemAmountCmd = new Commands.RelayCommand(DecrementItemCount)); }
        }

        public ICommand DropCurrentListCommand
        {
            get { return _dropCurrentList ?? (_dropCurrentList = new Commands.RelayCommand(DropList)); }
        }
        #endregion
    }
}
