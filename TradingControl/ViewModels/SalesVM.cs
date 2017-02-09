using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using TradingDAL;
using TradingDAL.Models;

namespace TradingControl.ViewModels
{
    /// <summary>
    /// Модель представления аналитики (список продаж).
    /// </summary>
    class SalesVM : ViewModelBase
    {
        #region Fields
        private Sale[] _soldItems;
        private string _itemName;
        private string _itemCode;
        private SalePeriod _selectedTimeline;
        private DateTime? _dateRangeFrom;
        private DateTime? _dateRangeTo;
        private bool _isTimeline = true;
        private bool _isSearching;

        private ICommand _salesSearchCmd;
        private ICommand _salesClearCmd;
        #endregion


        #region Props
        
        public SalePeriod SelectedTimeline
        {
            get { return _selectedTimeline; }
            set
            {
                _selectedTimeline = value;
                OnPropertyChanged();
            }
        }

        public bool IsTimelinePicked
        {
            get { return _isTimeline; }
            set
            {
                _isTimeline = value;
                OnPropertyChanged();
            }
        }

        public Sale[] SoldItems
        {
            get { return _soldItems; }
            set
            {
                _soldItems = value;
                OnPropertyChanged();
            }
        }

        public string ItemName
        {
            get { return _itemName; }
            set
            {
                _itemName = value;
                OnPropertyChanged();
            }
        }

        public string ItemCode
        {
            get { return _itemCode; }
            set
            {
                _itemCode = value;
                OnPropertyChanged();
            }
        }

        public DateTime? DateRangeFrom
        {
            get { return _dateRangeFrom; }
            set
            {
                _dateRangeFrom = value;
                OnPropertyChanged();
            }
        }

        public DateTime? DateRangeTo
        {
            get { return _dateRangeTo; }
            set
            {
                _dateRangeTo = value;
                OnPropertyChanged();
            }
        }

        public bool IsSearching
        {
            get { return _isSearching; }
            set
            {
                _isSearching = value;
                OnPropertyChanged();
            }
        }
        #endregion

        #region Methods
        private bool IsSearchParamsEmpty()
        {
            if (IsTimelinePicked)
                return (string.IsNullOrWhiteSpace(ItemCode) && string.IsNullOrWhiteSpace(ItemName) && SelectedTimeline == 0);
            else
                return (string.IsNullOrWhiteSpace(ItemCode) && string.IsNullOrWhiteSpace(ItemName) && (DateRangeFrom == null || DateRangeTo == null));
        }

        private void SearchItems(object obj)
        {
            if (IsSearching)
                return;

            if (IsSearchParamsEmpty())
            {
                Xceed.Wpf.Toolkit.MessageBox.Show("Параметры поиска не заданы!", "Внимание", System.Windows.MessageBoxButton.OK, System.Windows.MessageBoxImage.Warning);
                return;
            }

            Task.Run(() =>
            {
                IsSearching = true;

                // выбрать тип поиска
                if (IsTimelinePicked)
                    SearchOnTimeline();
                else
                    SearchOnDateRange();

                IsSearching = false;
            });
        }

        private void SearchOnTimeline()
        {
            using (SalesRepo repo = new SalesRepo(new StoreContext()))
            {
                long code;
                long.TryParse(ItemCode, out code);
                string name = ItemName;
                SalePeriod timeline = SelectedTimeline;

                try
                {
                    SoldItems = repo.Search(code, name, timeline).ToArray();
                }
                catch (Exception ex)
                {
                    System.Windows.Application.Current.Dispatcher.Invoke(delegate
                    {
                        Xceed.Wpf.Toolkit.MessageBox.Show("Ошибка в ходе поиска элементов: " + ex.Message, "Ошибка", System.Windows.MessageBoxButton.OK, System.Windows.MessageBoxImage.Error);
                        return;
                    });
                }
            }
        }

        private void SearchOnDateRange()
        {
            using (SalesRepo repo = new SalesRepo(new StoreContext()))
            {
                long code;
                long.TryParse(ItemCode, out code);
                string name = ItemName;
                DateTime date_from = DateRangeFrom ?? DateTime.MinValue;
                DateTime date_to = DateRangeTo ?? DateTime.MinValue;

                if(date_from == DateTime.MinValue || date_to == DateTime.MinValue)
                {
                    System.Windows.Application.Current.Dispatcher.Invoke(delegate
                    {
                        Xceed.Wpf.Toolkit.MessageBox.Show("Одна из дат диапазона не указана!", "Внимание", System.Windows.MessageBoxButton.OK, System.Windows.MessageBoxImage.Warning);
                        return;
                    });
                }

                try
                {
                    SoldItems = repo.Search(code, name, date_from, date_to).ToArray();
                }
                catch (Exception ex)
                {
                    System.Windows.Application.Current.Dispatcher.Invoke(delegate
                    {
                        Xceed.Wpf.Toolkit.MessageBox.Show("Ошибка в ходе поиска элементов: " + ex.Message, "Ошибка", System.Windows.MessageBoxButton.OK, System.Windows.MessageBoxImage.Error);
                        return;
                    });
                }
            }
        }

        private void ClearSearchConditions(object obj)
        {
            ItemCode = null;
            ItemName = null;
            DateRangeFrom = null;
            DateRangeTo = null;
            SoldItems = null;
        }
        #endregion

        #region Commands
        public ICommand SalesSearchCommand
        {
            get
            {
                return _salesSearchCmd ?? (_salesSearchCmd = new Commands.RelayCommand(SearchItems));
            }
        }

        public ICommand SalesSearchClearCommand
        {
            get
            {
                return _salesClearCmd ?? (_salesClearCmd = new Commands.RelayCommand(ClearSearchConditions));
            }
        }
        #endregion
    }
}
