using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;
using TradingDAL.Models;

namespace TradingDAL
{
    public class StorageRepo : IDisposable
    {
        private StoreContext _cnt;

        public StorageRepo(StoreContext context)
        {
            _cnt = context;
        }

        #region Methods

        public StorageItem Get(long id)
        {
            return _cnt.StorageItems.FirstOrDefault(i => i.Id == id);
        }
        
        public IEnumerable<StorageItem> Get(string name)
        {
            return _cnt.StorageItems.Where(i => i.Item.Title.Contains(name)).ToArray();
        }

        public IEnumerable<StoragePlace> GetStorages()
        {
            return _cnt.Storages.ToArray();
        }

        public IEnumerable<StoreItemCategory> GetCategories()
        {
            return _cnt.Categories.ToArray();
        }

        public IEnumerable<StorageItem> Search(long code, string name, long storageId, long categoryId)
        {
            var items = _cnt.StorageItems.Include(s => s.Item).Include(s => s.Storage);

            if (categoryId > 0)
                items = items.Where(c => c.Item.CategoryId == categoryId);

            if (storageId > 0)
                items = items.Where(c => c.StorageId == storageId);

            if (!string.IsNullOrWhiteSpace(name))
                items = items.Where(c => c.Item.Title.Contains(name));

            if (code > 0)
                items = items.Where(c => c.Item.Code == code);
            
            return items.ToArray();
        }

        public void Add(StorageItem item)
        {
            _cnt.StorageItems.Add(item);

            _cnt.SaveChanges();
        }

        #endregion

        public void Dispose()
        {
            ((IDisposable)_cnt).Dispose();
        }
    }
}
