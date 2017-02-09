using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace TradingDAL.Models
{
    public class StoreItem
    {
        [Key]
        public long Id { get; set; }

        public long Code { get; set; }

        public string Title { get; set; }

        public string Manufacturer { get; set; }

        public long CategoryId { get; set; }

        //[ForeignKey("CategoryId")]
        //public StoreItemCategories Category { get; set; }

        [ForeignKey("CategoryId")]
        public StoreItemCategory Category { get; set; }

        public bool Apiece { get; set; } = true;

        public double Price { get; set; }

        public virtual ICollection<Sale> ItemSales { get; set; }
    }

    public enum StoreItemCategories
    {
        Food = 1,
        Alcohol = 2,
        HomeTools = 3,
        KitchenTools = 4,
        HealthAndCosmetics = 5
    }
}
