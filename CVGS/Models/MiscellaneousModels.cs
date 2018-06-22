using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace CVGS.Models {
    [Table("WishList")]
    public partial class WishList {
        public WishList() { }

        [Key, ForeignKey(nameof(User)), Column(Order = 1), Required]
        public int userId { get; set; }
        [Key, ForeignKey(nameof(Game)), Column(Order = 2), Required]
        public int gameId { get; set; }
        [DataType(DataType.Date)]
        [Display(Name = "Date Added")]
        public DateTime date { get; set; }

        public virtual User User { get; set; }
        public virtual Game Game { get; set; }
    }

    [Table("GameReview")]
    public partial class GameReview {
        public GameReview() { }

        [Key, DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int id { get; set; }
        [Required]
        public int gameId { get; set; }
        [Display(Name = "Author")]
        [Required]
        public int userId { get; set; }
        [Display(Name = "Rating")]
        [Range(1, 5, ErrorMessage = "Please enter a value between 1 and 5")]
        public int? rating { get; set; }
        [Display(Name = "Review")]
        public string details { get; set; }

        [ForeignKey(nameof(userId))]
        public virtual User User { get; set; }
        [ForeignKey(nameof(gameId))]
        public virtual Game Game { get; set; }
    }
}