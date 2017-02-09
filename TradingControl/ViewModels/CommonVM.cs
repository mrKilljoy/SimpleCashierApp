using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using System.Threading;
using System.Windows.Threading;
using System.Windows;
using TradingControl.Infrastructure;

namespace TradingControl.ViewModels
{
    /// <summary>
    /// Модель для общего представления.
    /// </summary>
    class CommonVM : ViewModelBase
    {
        #region Fields
        private bool _isFullscreen;
        private bool _isUnauth = true;
        private bool _isActive = false;
        private bool _authPassing;

        private string _currentDate = DateTime.Now.ToString("dd.MM.yyyy HH:mm");
        private System.Timers.Timer _timer;
        private string _accLogin;
        private string _empName;

        private ICommand _fullscreenCmd;
        private ICommand _loginCmd;
        private ICommand _logoutCmd;
        #endregion

        public CommonVM()
        {
            TimerInitialization();
        }

        #region Props
        public string CurrentDate
        {
            get { return _currentDate; }
            set
            {
                _currentDate = value;
                OnPropertyChanged();
            }
        }

        public string AccountLogin
        {
            get { return _accLogin; }
            set
            {
                _accLogin = value;
                OnPropertyChanged();
            }
        }

        public bool IsUnauthorized
        {
            get { return _isUnauth; }
            set
            {
                _isUnauth = value;
                OnPropertyChanged();
            }
        }

        public bool IsActive
        {
            get { return _isActive; }
            set
            {
                _isActive = value;
                OnPropertyChanged();
            }
        }

        public bool IsAuthPassing
        {
            get { return _authPassing; }
            set
            {
                _authPassing = value;
                OnPropertyChanged();
            }
        }

        public string EmployeeName
        {
            get { return _empName; }
            set
            {
                _empName = value;
                OnPropertyChanged();
            }
        }
        #endregion

        #region Methods

        /// <summary>
        /// Инициализировать таймер для отображения актуального времени.
        /// </summary>
        private void TimerInitialization()
        {
            _timer = new System.Timers.Timer(10000);
            _timer.Elapsed += (obj, arg) =>
            {
                CurrentDate = DateTime.Now.ToString("dd.MM.yyyy HH:mm");
            };
            _timer.Start();
        }

        /// <summary>
        /// Переключиться между полноэкранным и оконным режимами.
        /// </summary>
        /// <param name="obj"></param>
        private void ToggleFullscreenMode(object obj)
        {
            var wnd = obj as MainWindow;
            
            if (_isFullscreen)
            {
                wnd.WindowState = System.Windows.WindowState.Normal;
                wnd.WindowStyle = System.Windows.WindowStyle.SingleBorderWindow;
                wnd.ResizeMode = System.Windows.ResizeMode.CanResize;
                wnd.Topmost = false;

                _isFullscreen = false;
            }
            else
            {
                wnd.WindowState = System.Windows.WindowState.Maximized;
                wnd.WindowState = System.Windows.WindowState.Normal;
                wnd.WindowStyle = System.Windows.WindowStyle.None;
                wnd.WindowState = System.Windows.WindowState.Maximized;
                wnd.ResizeMode = System.Windows.ResizeMode.NoResize;
                wnd.Topmost = true;

                _isFullscreen = true;
            }
        }

        /// <summary>
        /// Выполнить вход под указанными данными.
        /// </summary>
        /// <param name="obj"></param>
        public void Login(object obj)
        {
            if (IsAuthPassing)
                return;

            Task.Run(() =>
            {
                IsAuthPassing = true;

                var pwd_box = obj as Xceed.Wpf.Toolkit.WatermarkPasswordBox;
                if (pwd_box == null)
                {
                    Application.Current.Dispatcher.Invoke(delegate
                    {
                        Xceed.Wpf.Toolkit.MessageBox.Show("Ошибка в ходе инициализации программы.", "Ошибка", System.Windows.MessageBoxButton.OK, System.Windows.MessageBoxImage.Error);
                        return;
                    });
                }

                var login = AccountLogin;
                var pwd = pwd_box.Password;

                var result = AccountHelper.LogIn(login, pwd);

                IsUnauthorized = AccountHelper.IsAuthorized ? false : true;
                IsActive = !IsUnauthorized;

                if (IsActive)
                    EmployeeName = AccountHelper.EmployeeName;

                IsAuthPassing = false;

                switch (result)
                {
                    case AuthResult.Fail:
                        {
                            Application.Current.Dispatcher.Invoke(delegate
                            {
                                Xceed.Wpf.Toolkit.MessageBox.Show("Неверно введен логин / пароль.", "Ошибка", System.Windows.MessageBoxButton.OK, System.Windows.MessageBoxImage.Error);
                            });
                            break;
                        }
                    case AuthResult.Success:
                        {
                            AccountLogin = null;
                            Application.Current.Dispatcher.Invoke(delegate
                            {
                                pwd_box.Password = null;
                            });
                            break;
                        }
                    case AuthResult.Error:
                        {
                            Application.Current.Dispatcher.Invoke(delegate
                            {
                                Xceed.Wpf.Toolkit.MessageBox.Show("Ошибка в ходе процедуры авторизации.", "Ошибка", System.Windows.MessageBoxButton.OK, System.Windows.MessageBoxImage.Error);
                            });
                            break;
                        }
                }
                //if(result == AuthResult.Success)
                //{
                //    AccountLogin = null;
                //    Application.Current.Dispatcher.Invoke(delegate
                //    {
                //        pwd_box.Password = null;
                //    });
                //}
                //else
                //{
                //    Application.Current.Dispatcher.Invoke(delegate
                //    {
                //        Xceed.Wpf.Toolkit.MessageBox.Show("Неверно введен логин / пароль.", "Ошибка", System.Windows.MessageBoxButton.OK, System.Windows.MessageBoxImage.Error);
                //    });
                //}
            });
        }

        /// <summary>
        /// Выйти из учетной записи.
        /// </summary>
        /// <param name="obj"></param>
        public void Logout(object obj)
        {
            if (IsAuthPassing)
                return;

            Task.Run(() =>
            {
                IsAuthPassing = true;

                AccountHelper.LogOut();

                IsUnauthorized = true;
                IsActive = !IsUnauthorized;

                IsAuthPassing = false;
            });
        }
        #endregion

        #region Commands
        public ICommand FullscreenCommand
        {
            get { return _fullscreenCmd ?? (_fullscreenCmd = new Commands.RelayCommand(ToggleFullscreenMode)); }
        }

        public ICommand LoginCommand
        {
            get { return _loginCmd ?? (_loginCmd = new Commands.RelayCommand(Login)); }
        }

        public ICommand LogoutCommand
        {
            get
            {
                return _logoutCmd ?? (_logoutCmd = new Commands.RelayCommand(Logout));
            }
        }
        #endregion

    }
}
