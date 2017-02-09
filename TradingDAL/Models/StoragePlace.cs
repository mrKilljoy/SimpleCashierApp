using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace TradingDAL.Models
{
    public class StoragePlace
    {
        public long Id { get; set; }

        public string Name { get; set; }

        public virtual ICollection<StorageItem> Items { get; set; }
    }
}
