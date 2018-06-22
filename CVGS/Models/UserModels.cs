using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace CVGS.Models
{
    [Table("User")]
    public partial class User
    {
        [Key]
        public int id { get; set; }
        [Required]
        public int userStatusId { get; set; }
        [Display(Name = "Username")]
        [Required, Index(IsUnique = true)]
        public String username { get; set; }
        [DataType(DataType.Password)]
        [Required]
        public String password { get; set; }
        [DataType(DataType.Password)]
        [DisplayName("Confirm Password"), NotMapped]
        [Compare("Password")]
        public string ConfirmPassword { get; set; }
        [Display(Name = "First Name")]
        [Required]
        public String givenName { get; set; }
        [Display(Name = "Last Name")]
        [Required]
        public String surname { get; set; }
        [DataType(DataType.EmailAddress)]
        [Display(Name = "Email Address")]
        [Required]
        public String email { get; set; }
        [DataType(DataType.PhoneNumber)]
        [Display(Name = "Home Phone")]
        [Required]
        public String phone { get; set; }
        [Display(Name = "Home Address")]
        public String address { get; set; }
        [DataType(DataType.PostalCode)]
        [Display(Name = "Postal Code")]
        public String postalCode { get; set; }
        [DataType(DataType.PhoneNumber)]
        [Display(Name = "Cell Phone")]
        public String mobile { get; set; }
        [DataType(DataType.PhoneNumber)]
        [Display(Name = "Fax Number")]
        public String fax { get; set; }
        [Display(Name = "Work Extension")]
        public String extension { get; set; }
        [Display(Name = "Preferences")]
        public String preferences { get; set; }

        [NotMapped]
        public string LoginErrorMessage { get; set; }

        public virtual UserStatus UserStatus { get; set; }
        public virtual ICollection<RelativeList> Relatives { get; set; }
        public virtual ICollection<EventAttendee> EventsAttending { get; set; }
        public virtual ICollection<Event> EventsAuthored { get; set; }
        public virtual ICollection<WishList> WishList { get; set; }
        public virtual ICollection<GameReview> ReviewsAuthored { get; set; }

    }

    [Table("UserStatus")]
    public partial class UserStatus
    {
        [Key, DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int id { get; set; }
        [Display(Name = "Status")]
        public string status { get; set; }
    }

    [Table("RelativeList")]
    public partial class RelativeList
    {
        public RelativeList() { }

        [Key, Column(Order = 2), DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int id { get; set; }
        [Key, ForeignKey(nameof(Member)), Column(Order = 1), Required]
        public int user1_id { get; set; }
        [Display(Name = "Relative")]
        [Key, ForeignKey(nameof(Relative)), Column(Order = 3), Required]
        public int user2_id { get; set; }

        public virtual User Member { get; set; }
        [InverseProperty("Relatives")]
        public virtual User Relative { get; set; }
    }
}