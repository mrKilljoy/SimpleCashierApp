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
using System.Windows.Navigation;
using System.Windows.Shapes;
using TradingControl.ViewModels;

namespace TradingControl
{
    /// <summary>
    /// Основное окно.
    /// </summary>
    public partial class MainWindow : Window
    {
        private CashierVM _cashierVm;
        private StorageVM _storageVm;
        private SalesVM _salesVm;
        private CommonVM _commonVm;
        private WpfControls.AutoCompleteTextBox _ctrl;
        private bool _isHandlerInitialized = false;

        public MainWindow()
        {
            InitializeComponent();

            InitializeVMs();
            TestInitialization(); // внос тестовых данных

            //SetFullscreenOnStart();
            InitializeSelectorHandler();
        }
        
        /// <summary>
        /// Инициализировать модели представления.
        /// </summary>
        private void InitializeVMs()
        {
            _cashierVm = new CashierVM();
            _storageVm = new StorageVM();
            _salesVm = new SalesVM();
            _commonVm = new CommonVM();

            this.DataContext = _commonVm;

            var tab_cashier = tabControl.Items.GetItemAt(0) as TabItem;
            var tab_storage = tabControl.Items.GetItemAt(1) as TabItem;
            var tab_sales = tabControl.Items.GetItemAt(2) as TabItem;

            tab_cashier.DataContext = _cashierVm;
            tab_storage.DataContext = _storageVm;
            tab_sales.DataContext = _salesVm;
        }

        /// <summary>
        /// Включить полноэкранный режим при запуске.
        /// </summary>
        private void SetFullscreenOnStart()
        {
            this.WindowState = WindowState.Maximized;
            this.WindowState = WindowState.Normal;
            this.WindowStyle = WindowStyle.None;
            this.WindowState = WindowState.Maximized;
            this.Topmost = true;
        }

        /// <summary>
        /// Очистить результаты работы после выхода из учетной записи.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btn_exit_Click(object sender, RoutedEventArgs e)
        {
            // повторная инициализация моделей представлений
            InitializeVMs();
        }

        /// <summary>
        /// Добавить обработчик для выбора элемента из списка предложенных совпадений.
        /// </summary>
        private void InitializeSelectorHandler()
        {
            _ctrl = txt_cashier_input;

            txt_cashier_input.Loaded += (a, b) =>
            {
                if (!_isHandlerInitialized)
                {
                    _ctrl.SelectionAdapter.Commit += ProcessPickedValue;
                    _isHandlerInitialized = true;
                }
            };
        }

        /// <summary>
        /// Обработать значение, выбранное из предложенного списка.
        /// </summary>
        public void ProcessPickedValue()
        {
            _cashierVm.AddItemCommand.Execute(null);
            
            _ctrl.ItemsSelector.SelectedItem = null;
            _ctrl.Editor.Clear();
        }

        /// <summary>
        /// Закрыть приложение.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void CloseApp(object sender, RoutedEventArgs e)
        {
            Environment.Exit(0);
        }

        /// <summary>
        /// Создать БД с тестовыми записями (в случае, если БД отсутствует)
        /// </summary>
        private void TestInitialization()
        {
            using (var cont = new TradingDAL.Models.StoreContext())
            {

                #region Accounts
                if (cont.Employees.Count() == 0)
                {
                    TradingDAL.Models.EmployeeAccount emp1 = new TradingDAL.Models.EmployeeAccount
                    {
                        LastName = "Иванов",
                        FirstName = "Петр",
                        Login = "ivanov",
                        Password = "123456"
                    };

                    TradingDAL.Models.EmployeeAccount emp2 = new TradingDAL.Models.EmployeeAccount
                    {
                        LastName = "Администратор",
                        FirstName = "",
                        Login = "admin",
                        Password = "123456"
                    };

                    cont.Employees.AddRange(new[] { emp1, emp2 });
                    cont.SaveChanges();
                }
                #endregion

                #region Storage stuff
                if (cont.Storages.Count() == 0)
                {
                    var st1 = new TradingDAL.Models.StoragePlace { Name = "Склад 1" };
                    var st2 = new TradingDAL.Models.StoragePlace { Name = "Склад 2" };
                    var st3 = new TradingDAL.Models.StoragePlace { Name = "Склад 3" };
                    var st4 = new TradingDAL.Models.StoragePlace { Name = "Склад 4" };

                    cont.Storages.AddRange(new[] { st1, st2, st3, st4 });
                    cont.SaveChanges();
                }

                if (cont.Categories.Count() == 0)
                {
                    var c1 = new TradingDAL.Models.StoreItemCategory { Name = "Продукты питания" };
                    var c2 = new TradingDAL.Models.StoreItemCategory { Name = "Алкоголь" };
                    var c3 = new TradingDAL.Models.StoreItemCategory { Name = "Красота и здоровье" };
                    var c4 = new TradingDAL.Models.StoreItemCategory { Name = "Домашняя утварь" };
                    var c5 = new TradingDAL.Models.StoreItemCategory { Name = "Кухня" };

                    cont.Categories.AddRange(new[] { c1, c2, c3, c4, c5 });
                    cont.SaveChanges();
                }

                if (cont.StoreItems.Count() == 0)
                {
                    var si1 = new TradingDAL.Models.StoreItem
                    {
                        Title = "Пельмени 1кг",
                        Code = 112,
                        CategoryId = 1,
                        Manufacturer = "Иваново",
                        Price = 110
                    };

                    var si2 = new TradingDAL.Models.StoreItem
                    {
                        Title = "Хлеб нарезной",
                        Code = 102,
                        CategoryId = 1,
                        Manufacturer = "ХлебПром",
                        Price = 35
                    };

                    var si3 = new TradingDAL.Models.StoreItem
                    {
                        Title = "Яйца 10шт",
                        Code = 108,
                        CategoryId = 1,
                        Manufacturer = "Птицефабрика Петровская",
                        Price = 60
                    };

                    var si4 = new TradingDAL.Models.StoreItem
                    {
                        Title = "Коньяк Армянский 0.75л",
                        Code = 213,
                        CategoryId = 2,
                        Manufacturer = "АрмянКоньяк",
                        Price = 720
                    };

                    var si5 = new TradingDAL.Models.StoreItem
                    {
                        Title = "Водка Столичная 1л",
                        Code = 218,
                        CategoryId = 2,
                        Manufacturer = "Кристалл",
                        Price = 800
                    };

                    var si6 = new TradingDAL.Models.StoreItem
                    {
                        Title = "Ежик, зубная паста 300мл",
                        Code = 453,
                        CategoryId = 3,
                        Manufacturer = "НорХимПром",
                        Price = 50
                    };

                    var si7 = new TradingDAL.Models.StoreItem
                    {
                        Title = "Афоня, шампунь 700 мл",
                        Code = 443,
                        CategoryId = 3,
                        Manufacturer = "Архангельский комбинат",
                        Price = 86
                    };

                    var si8 = new TradingDAL.Models.StoreItem
                    {
                        Title = "Вилка столовая, сталь нерж 1шт",
                        Code = 532,
                        CategoryId = 5,
                        Manufacturer = "Большевик",
                        Price = 110
                    };

                    cont.StoreItems.AddRange(new[] { si1, si2, si3, si4, si5, si6, si7, si8 });
                    cont.SaveChanges();
                }

                if (cont.StorageItems.Count() == 0)
                {
                    var si1 = new TradingDAL.Models.StorageItem { ItemId = 1, Quantity = 30, StorageId = 1 };
                    var si2 = new TradingDAL.Models.StorageItem { ItemId = 2, Quantity = 10, StorageId = 1 };
                    var si3 = new TradingDAL.Models.StorageItem { ItemId = 3, Quantity = 45, StorageId = 2 };
                    var si4 = new TradingDAL.Models.StorageItem { ItemId = 4, Quantity = 21, StorageId = 2 };
                    var si5 = new TradingDAL.Models.StorageItem { ItemId = 5, Quantity = 67, StorageId = 1 };
                    var si6 = new TradingDAL.Models.StorageItem { ItemId = 6, Quantity = 42, StorageId = 3 };
                    var si7 = new TradingDAL.Models.StorageItem { ItemId = 7, Quantity = 24, StorageId = 3 };
                    var si8 = new TradingDAL.Models.StorageItem { ItemId = 8, Quantity = 78, StorageId = 2 };
                    var si9 = new TradingDAL.Models.StorageItem { ItemId = 1, Quantity = 25, StorageId = 2 };
                    var si10 = new TradingDAL.Models.StorageItem { ItemId = 2, Quantity = 48, StorageId = 4 };

                    cont.StorageItems.AddRange(new[] { si1, si2, si3, si4, si5, si6, si7, si8, si9, si10 });
                    cont.SaveChanges();
                }
                #endregion

                #region Sales stuff
                if (cont.Bills.Count() == 0)
                {
                    var s1 = new TradingDAL.Models.Sale
                    {
                        ItemId = 1,
                        ItemAmount = 2,
                        SaleDate = DateTime.Parse("01.01.2017"),
                        TotalPrice = 120
                    };

                    var s2 = new TradingDAL.Models.Sale
                    {
                        ItemId = 2,
                        ItemAmount = 1,
                        SaleDate = DateTime.Parse("01.01.2017"),
                        TotalPrice = 35
                    };

                    var s3 = new TradingDAL.Models.Sale
                    {
                        ItemId = 5,
                        ItemAmount = 1,
                        SaleDate = DateTime.Parse("01.01.2017"),
                        TotalPrice = 800
                    };

                    var b1 = new TradingDAL.Models.Bill
                    {
                        Quantity = 3,
                        IsCreditCard = false,
                        Date = DateTime.Parse("01.01.2017"),
                        Checkout = 0,
                        Cash = 0,
                        Change = 0,
                        EmployeeId = 1,
                        SalePositions = new[] { s1, s2, s3 }
                    };

                    cont.Bills.Add(b1);
                    cont.SaveChanges();
                }
                #endregion
            }
        }

    }
}
