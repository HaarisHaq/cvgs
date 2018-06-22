using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace CVGS.Models {
    [Table("Event")]
    public partial class Event {
        [Key, DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int id { get; set; }
        [Display(Name = "Event Type")]
        [Required]
        public int eventTypeId { get; set; }
        [Display(Name = "Organiser")]
        [Required]
        public int userId { get; set; }
        [DataType(DataType.Date), Display(Name = "Date")]
        [Required]
        public DateTime date { get; set; }
        [DataType(DataType.Time), Display(Name = "Time")]
        [Required]
        public DateTime time { get; set; }
        [Display(Name = "Location")]
        [Required]
        public string location { get; set; }
        [Display(Name = "Name")]
        public string name { get; set; }
        [Display(Name = "Description")]
        public string description { get; set; }

        [ForeignKey(nameof(eventTypeId))]
        public virtual EventType EventType { get; set; }
        [ForeignKey(nameof(userId))]
        public virtual User Author { get; set; }
        public virtual ICollection<EventAttendee> EventAttendee { get; set; }
    }
    [Table("EventType")]
    public partial class EventType {
        [Key, DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int id { get; set; }
        [Display(Name = "Type")]
        public string type { get; set; }
    }

    [Table("EventAttendee")]
    public partial class EventAttendee {
        public EventAttendee() { }

        [Key, ForeignKey(nameof(Event)), Column(Order = 1), Required]
        public int eventId { get; set; }
        [Key, ForeignKey(nameof(User)), Column(Order = 2), Required]
        public int userId { get; set; }
        [Display(Name = "Personal Comments")]
        public string notes { get; set; }

        public virtual Event Event { get; set; }
        public virtual User User { get; set; }
    }
}