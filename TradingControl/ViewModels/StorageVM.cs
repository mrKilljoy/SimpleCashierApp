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
    /// Модель представления складского модуля.
    /// </summary>
    class StorageVM : ViewModelBase
    {
        #region Fields
        private StoragePlace[] _storageNames;
        private StoreItemCategory[] _categories;
        private StorageItem[] _items;
        private string _itemName;
        private string _itemCode;
        private StoreItemCategory _itemCat;
        private StoragePlace _itemPlace;
        private bool _isSearching;

        private ICommand _storageSearchCmd;
        private ICommand _storageClearCmd;
        #endregion

        public StorageVM()
        {
            LoadStoragesList();
            LoadCategoriesList();
        }

        #region Props
        public StoragePlace[] StorageNames
        {
            get { return _storageNames; }
            set
            {
                _storageNames = value;
                OnPropertyChanged();
            }
        }

        public StoreItemCategory[] ItemCategories
        {
            get { return _categories; }
            set
            {
                _categories = value;
                OnPropertyChanged();
            }
        }

        public StorageItem[] Items
        {
            get { return _items; }
            set
            {
                _items = value;
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

        public StoreItemCategory ItemCategory
        {
            get { return _itemCat; }
            set
            {
                _itemCat = value;
                OnPropertyChanged();
            }
        }

        public StoragePlace ItemPlace
        {
            get { return _itemPlace; }
            set
            {
                _itemPlace = value;
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
        private void LoadStoragesList()
        {
            using (StorageRepo repo = new StorageRepo(new TradingDAL.Models.StoreContext()))
            {
                _storageNames = repo.GetStorages().ToArray();
            }
        }

        private void LoadCategoriesList()
        {
            using (StorageRepo repo = new StorageRepo(new TradingDAL.Models.StoreContext()))
            {
                _categories = repo.GetCategories().ToArray();
            }
        }

        private bool IsSearchParamsEmpty()
        {
            return (string.IsNullOrWhiteSpace(ItemCode) && string.IsNullOrWhiteSpace(ItemName) && ItemCategory == null && ItemPlace == null);
        }

        private void SearchItems(object obj)
        {
            if (IsSearching)
                return;

            if(IsSearchParamsEmpty())
            {
                Xceed.Wpf.Toolkit.MessageBox.Show("Параметры поиска не заданы!", "Внимание", System.Windows.MessageBoxButton.OK, System.Windows.MessageBoxImage.Warning);
                return;
            }

            Task.Run(() =>
            {
                IsSearching = true;

                using (StorageRepo repo = new StorageRepo(new TradingDAL.Models.StoreContext()))
                {
                    long code;
                    long.TryParse(ItemCode, out code);
                    string name = ItemName;
                    long placeId = ItemPlace?.Id ?? 0;
                    long category = ItemCategory?.Id ?? 0;

                    try
                    {
                        Items = repo.Search(code, name, placeId, category).ToArray();
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

                IsSearching = false;
            });
        }

        private void ClearSearchConditions(object obj)
        {
            ItemCategory = null;
            ItemPlace = null;
            ItemCode = null;
            ItemName = null;
            Items = null;
        }
        #endregion

        #region Commands
        public ICommand StorageSearchCommand
        {
            get
            {
                return _storageSearchCmd ?? (_storageSearchCmd = new Commands.RelayCommand(SearchItems));
            }
        }

        public ICommand StorageSearchClearCommand
        {
            get
            {
                return _storageClearCmd ?? (_storageClearCmd = new Commands.RelayCommand(ClearSearchConditions));
            }
        }
        #endregion
    }
}
