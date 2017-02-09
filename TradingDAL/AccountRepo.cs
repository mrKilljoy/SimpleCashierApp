using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TradingDAL.Models;

namespace TradingDAL
{
    public class AccountRepo : IDisposable
    {
        private StoreContext _cnt;

        public AccountRepo(StoreContext context)
        {
            _cnt = context;
        }

        public void Dispose()
        {
            ((IDisposable)_cnt).Dispose();
        }

        #region Methods
        public void Create(EmployeeAccount emp)
        {
            _cnt.Employees.Add(emp);
            _cnt.SaveChanges();
        }

        public void Create(string empLogin, string empPassword, string empLastName, string empFirstName)
        {
            EmployeeAccount emp = new EmployeeAccount
            {
                LastName = empLastName,
                FirstName = empFirstName,
                Login = empLogin,
                Password = empPassword
            };

            _cnt.Employees.Add(emp);
            _cnt.SaveChanges();
        }

        public EmployeeAccount Get(long id)
        {
            return _cnt.Employees.FirstOrDefault(e => e.Id == id);
        }

        public EmployeeAccount Get(string empLogin)
        {
            return _cnt.Employees.FirstOrDefault(e => e.Login == empLogin);
        }

        public bool ValidateAuthData(string empLogin, string empPassword)
        {
            var found = _cnt.Employees.FirstOrDefault(e => e.Login.Equals(empLogin, StringComparison.CurrentCulture)
            && e.Password.Equals(empPassword, StringComparison.CurrentCulture));
            
            if (found == null)
                return false;
            else
                return true;
        }
        #endregion
    }
}
