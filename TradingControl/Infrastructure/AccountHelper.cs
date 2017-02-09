using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TradingDAL;
using TradingDAL.Models;

namespace TradingControl.Infrastructure
{
    class AccountHelper
    {
        private static EmployeeAccount _emp;

        public static bool IsAuthorized
        {
            get { return _emp == null ? false : true; }
        }

        public static string EmployeeName
        {
            get
            {
                if (_emp == null)
                    return null;
                else
                    return string.Format("{0} {1}", _emp.LastName, _emp.FirstName);
            }
        }

        public static EmployeeAccount CurrentEmployee
        {
            get { return _emp; }
        }


        public static AuthResult LogIn(string empLogin, string empPassword)
        {
            using (AccountRepo repo = new AccountRepo(new StoreContext()))
            {
                try
                {
                    if (repo.ValidateAuthData(empLogin, empPassword))
                        _emp = repo.Get(empLogin);

                    return _emp == null ? AuthResult.Fail : AuthResult.Success;
                }
                catch (Exception)
                {
                    return AuthResult.Error;
                }
            }
        }

        public static void LogOut()
        {
            if (!IsAuthorized)
                return;

            _emp = null;
        }
    }

    public enum AuthResult
    {
        Fail = 0,
        Success = 1,
        Error = 2
    }
}
