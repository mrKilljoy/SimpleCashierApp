using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace TradingDAL.Models
{
    public class Bill
    {
        [Key]
        public long Id { get; set; }

        public DateTime Date { get; set; }

        public double Checkout { get; set; }

        public int Quantity { get; set; } // ?

        public double Cash { get; set; }

        public bool IsCreditCard { get; set; }

        public double Change { get; set; }

        public long EmployeeId { get; set; }

        [ForeignKey("EmployeeId")]
        public virtual EmployeeAccount Employee { get; set; }

        public virtual ICollection<Sale> SalePositions { get; set; }
    }
}
