using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace TradingDAL.Models
{
    public class Sale
    {
        [Key]
        public long Id { get; set; }

        public DateTime SaleDate { get; set; }

        public long ItemId { get; set; }

        [ForeignKey("ItemId")]
        public virtual StoreItem Item { get; set; }

        public long BillId { get; set; }

        [ForeignKey("BillId")]
        public virtual Bill Bill { get; set; }

        public int ItemAmount { get; set; }

        public double TotalPrice { get; set; }
        
    }

    public enum SalePeriod
    {
        Week = 1,
        Month = 2,
        Quarter = 3,
        Year = 4
    }
}
