using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Text.RegularExpressions;
using System.Data.Entity;
using TradingDAL.Models;

namespace TradingDAL
{
    public class SalesRepo : IDisposable
    {
        private StoreContext _cnt;
        private Regex rx_codes;

        public SalesRepo(StoreContext context)
        {
            _cnt = new StoreContext();

            rx_codes = new Regex("^([0-9]){1,}$");
        }

        public void Dispose()
        {
            ((IDisposable)_cnt).Dispose();
        }

        #region Methods
        public IEnumerable<Sale> Get(string name)
        {
            return _cnt.Sales.Where(s => s.Item.Title.Contains(name)).Include(s => s.Item).ToArray();
        }

        public Sale Get(long code)
        {
            var found = _cnt.Sales.Include(s => s.Item).FirstOrDefault(s => s.Item.Code == code);

            if (found == null)
                return null;

            _cnt.Entry(found).Reference(s => s.Item).Load();
            return found;
        }

        public IEnumerable<Sale> GetForPeriod(SalePeriod period)
        {
            Sale[] sales = null;

            switch (period)
            {
                case SalePeriod.Week:
                    {
                        sales = _cnt.Sales.Where(s => s.SaleDate.Date <= DateTime.Today && s.SaleDate.Date > DateTime.Today.AddDays(-7)).Include(x => x.Item).ToArray();
                        break;
                    }
                case SalePeriod.Month:
                    {
                        sales = _cnt.Sales.Where(s => s.SaleDate.Date <= DateTime.Today && s.SaleDate.Date > DateTime.Today.AddMonths(-1)).Include(x => x.Item).ToArray();
                        break;
                    }
                case SalePeriod.Quarter:
                    {
                        sales = _cnt.Sales.Where(s => s.SaleDate.Date <= DateTime.Today && s.SaleDate.Date > DateTime.Today.AddMonths(-3)).Include(x => x.Item).ToArray();
                        break;
                    }
                case SalePeriod.Year:
                    {
                        sales = _cnt.Sales.Where(s => s.SaleDate.Date <= DateTime.Today && s.SaleDate.Date > DateTime.Today.AddYears(-1)).Include(x => x.Item).ToArray();
                        break;
                    }
            }

            return sales;
        }

        public IEnumerable<Sale> GetForPeriod(DateTime dateFrom, DateTime dateTo)
        {
            Sale[] sales = _cnt.Sales.Where(s => s.SaleDate >= dateFrom && s.SaleDate <= dateTo).Include(x => x.Item).ToArray();

            return sales;
        }

        public IEnumerable<StoreItem> GetSuggestedItem(string input)
        {
            if (rx_codes.IsMatch(input))
            {
                long code = long.Parse(input);
                return _cnt.StoreItems.Where(i => i.Code == code).ToArray();
            }
            else
            {
                return _cnt.StoreItems.Where(i => i.Title.Contains(input)).Take(10).ToArray();
            }
        }

        public void AddBill(IEnumerable<Sale> items, double cash, bool isCard, EmployeeAccount cashier)
        {
            using (var tr = _cnt.Database.BeginTransaction())
            {
                try
                {
                    Bill bill = new Bill
                    {
                        Date = DateTime.Now,
                        IsCreditCard = isCard,
                        Quantity = items.Count(),
                        SalePositions = items.ToArray(),
                        Checkout = items.Sum(i=>i.TotalPrice),
                        Cash = cash,
                        Change = cash - items.Sum(i => i.TotalPrice),
                        Employee = cashier
                    };

                    _cnt.Bills.Add(bill);
                    _cnt.SaveChanges();

                    tr.Commit();
                }
                catch (Exception)
                {
                    tr.Rollback();
                    throw;
                }
            }
        }

        public IEnumerable<Sale> Search(long code, string name, SalePeriod timeline)
        {
            var items = _cnt.Sales.Include(s => s.Item);

            if(timeline > 0)
            {
                DateTime border_date;
                DateTime start_date = DateTime.Today.AddDays(1);
                switch (timeline)
                {
                    case SalePeriod.Week:
                        {
                            border_date = DateTime.Today.AddDays(-7);
                            items = _cnt.Sales.Where(s => s.SaleDate < start_date && s.SaleDate >= border_date);
                            break;
                        }
                    case SalePeriod.Month:
                        {
                            border_date = DateTime.Now.AddMonths(-1);
                            items = _cnt.Sales.Where(s => s.SaleDate < start_date && s.SaleDate >= border_date);
                            break;
                        }
                    case SalePeriod.Quarter:
                        {
                            border_date = DateTime.Now.AddMonths(-3);
                            items = _cnt.Sales.Where(s => s.SaleDate < start_date && s.SaleDate >= border_date);
                            break;
                        }
                    case SalePeriod.Year:
                        {
                            border_date = DateTime.Now.AddYears(-1);
                            items = _cnt.Sales.Where(s => s.SaleDate < start_date && s.SaleDate >= border_date);
                            break;
                        }
                }
            }

            if (!string.IsNullOrWhiteSpace(name))
                items = items.Where(c => c.Item.Title.Contains(name));

            if (code > 0)
                items = items.Where(c => c.Item.Code == code);

            return items.Include(x => x.Item).ToArray();
        }

        public IEnumerable<Sale> Search(long code, string name, DateTime dateFrom, DateTime dateTo)
        {
            if (dateFrom > dateTo)
                throw new ArgumentOutOfRangeException("Левая граница диапазона дат больше правой");

            var items = _cnt.Sales.Include(s => s.Item);

            items = _cnt.Sales.Where(s => s.SaleDate >= dateFrom && s.SaleDate <= dateTo);

            if (!string.IsNullOrWhiteSpace(name))
                items = items.Where(c => c.Item.Title.Contains(name));

            if (code > 0)
                items = items.Where(c => c.Item.Code == code);

            return items.Include(x => x.Item).ToArray();
        }
        #endregion
    }
}
