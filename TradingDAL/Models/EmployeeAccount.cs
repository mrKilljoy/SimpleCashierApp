using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace TradingDAL.Models
{
    public class EmployeeAccount
    {
        [Key]
        public long Id { get; set; }

        [Required]
        public string LastName { get; set; }

        public string FirstName { get; set; }

        public string Patronym { get; set; }

        [Required]
        public string Login { get; set; }

        [Required, MinLength(6)]
        public string Password { get; set; }
    }
}
