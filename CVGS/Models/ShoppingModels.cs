using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace CVGS.Models
{
    [Table("Cart")]
    public class Cart
    {
        [Key, DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int id { get; set; }
        [Required]
        public int userId { get; set; }
        [Required]
        public int gameId { get; set; }

        public virtual User Owner { get; set; }
        public virtual Game Game { get; set; }
    }

    [Table("Order")]
    public class Order
    {
        [Key, DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int id { get; set; }
        [Required]
        public int userId { get; set; }
        [Range(0, 1)]
        [Display(Name = "Is Processed?")]
        public int processed { get; set; }

        public virtual User Customer { get; set; }
        public virtual ICollection<OrderItem> OrderItems { get; set; }
    }

    public class OrderItem
    {
        [Key, DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int id { get; set; }
        public int orderId { get; set; }
        [ForeignKey("Game")]
        public int gameId { get; set; }
        public virtual Game Game { get; set; }
    }
}