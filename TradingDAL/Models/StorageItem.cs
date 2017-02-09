using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace TradingDAL.Models
{
    public class StorageItem
    {
        [Key]
        public long Id { get; set; }

        public long ItemId { get; set; }

        [ForeignKey("ItemId")]
        public virtual StoreItem Item { get; set; }

        public int Quantity { get; set; }

        public long StorageId { get; set; }

        [ForeignKey("StorageId")]
        public virtual StoragePlace Storage { get; set; }

        //public virtual ICollection<StoragePlace> Storages { get; set; }
    }
}
