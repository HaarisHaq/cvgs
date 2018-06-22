using CVGS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.Entity;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace CVGS.Controllers {
    public class EventAttendeeController : Controller
    {
        private ConestogaVideogameStoreDbContext db = new ConestogaVideogameStoreDbContext();

        // GET: EventAttendee
        public ActionResult Index(int? eventId) {
            if (!eventId.HasValue) {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            if (!db.Event.Any(e => e.id == eventId)) {
                return RedirectToAction("Index", "Event");
            }
            var attendees = db.EventAttendee.Include(ea => ea.Event).Include(ea => ea.User).Where(ea => ea.eventId == eventId);
            return View(attendees.ToList());
        }

        public ActionResult Create(int? eventId, int? userId) {
            if (!eventId.HasValue || !userId.HasValue) {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            if (!db.Event.Any(e => e.id == eventId) || !db.Member.Any(u => u.id == userId)) {
                //either id does not exist
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            EventAttendee attendee = new EventAttendee {
                eventId = eventId.Value,
                Event = db.Event.Find(eventId),
                userId = userId.Value
            };
            return View(attendee);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "eventId,userId,notes")] EventAttendee eventAttendee) {
            if (ModelState.IsValid) {
                db.EventAttendee.Add(eventAttendee);
                db.SaveChanges();
                return RedirectToAction("Index", new { eventId = eventAttendee.eventId });
            }

            return View(eventAttendee);
        }
    }
}