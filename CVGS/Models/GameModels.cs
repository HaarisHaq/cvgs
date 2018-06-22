using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace CVGS.Models {
    [Table("Game")]
    public partial class Game {
        [Key, DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int id { get; set; }
        [Display(Name = "Title")]
        [Required]
        public string title { get; set; }
        [Display(Name = "Genre")]
        [Required]
        public string genre { get; set; }
        [DataType(DataType.Date)]
        [Display(Name = "Release Date")]
        public DateTime releaseDate { get; set; }
        [Display(Name = "Developer")]
        public string developer { get; set; }
        [Display(Name = "ESRB Rating")]
        public string esrbRating { get; set; }
        [Display(Name = "Details")]
        public string details { get; set; }
        [Display(Name = "Plot")]
        public string plot { get; set; }

        public virtual ICollection<ProductInformation> ProductInformation { get; set; }
        public virtual ICollection<WishList> WishList { get; set; }
        public virtual ICollection<GameReview> GameReview { get; set; }
        public virtual ICollection<Cart> Cart { get; set; }
    }

    [Table("ProductInformation")]
    public partial class ProductInformation {
        [Key, DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int id { get; set; }
        [Required]
        public int gameId { get; set; }
        [DataType(DataType.Currency)]
        [Display(Name = "Price")]
        [Required]
        public string price { get; set; }
        [Display(Name = "Console")]
        [Required]
        public string console { get; set; }
        [Display(Name = "Download")]
        public string fileLocation { get; set; }
        [Display(Name = "Cover")]
        public string coverFileLocation { get; set; }

        [ForeignKey(nameof(gameId))]
        public virtual Game Game { get; set; }
    }
}