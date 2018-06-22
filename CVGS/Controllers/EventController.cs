using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using CVGS.Models;

namespace CVGS.Controllers {
    public class EventController : Controller
    {
        private ConestogaVideogameStoreDbContext db = new ConestogaVideogameStoreDbContext();

        // GET: Events
        public ActionResult Index() {
            var @event = db.Event.Include(e => e.Author).Include(e => e.EventType);
            return View(@event.ToList());
        }

        // GET: Events/Details/5
        public ActionResult Details(int? id) {
            if (id == null) {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Event @event = db.Event.Find(id);
            if (@event == null) {
                return HttpNotFound();
            }
            return View(@event);
        }

        // GET: Events/Create
        public ActionResult Create() {
            ViewBag.eventTypeId = new SelectList(db.EventType, "id", "type");
            Event e = db.Event.ToList().Last();
            ViewBag.id = e.id + 1 + "";
            return View();
        }

        // POST: Events/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,eventTypeId,userId,date,time,location,name,description")] Event @event) {
            if (ModelState.IsValid) {
                db.Event.Add(@event);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.eventTypeId = new SelectList(db.EventType, "id", "type", @event.eventTypeId);
            return View(@event);
        }

        // GET: Events/Edit/5
        public ActionResult Edit(int? id) {
            if (id == null) {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Event @event = db.Event.Find(id);
            if (@event == null) {
                return HttpNotFound();
            }
            ViewBag.eventTypeId = new SelectList(db.EventType, "id", "type", @event.eventTypeId);
            return View(@event);
        }

        // POST: Events/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,eventTypeId,userId,date,time,location,name,description")] Event @event) {
            if (ModelState.IsValid) {
                db.Entry(@event).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.eventTypeId = new SelectList(db.EventType, "id", "type", @event.eventTypeId);
            return View(@event);
        }

        // GET: Events/Delete/5
        public ActionResult Delete(int? id) {
            if (id == null) {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Event @event = db.Event.Find(id);
            if (@event == null) {
                return HttpNotFound();
            }
            return View(@event);
        }

        // POST: Events/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id) {
            Event @event = db.Event.Find(id);
            db.Event.Remove(@event);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult SeeAttending(int? eventId) {
            return RedirectToAction("Index", "EventAttendee", new { eventId = eventId });
        }

        public ActionResult Register(int? eventId, int? userId) {
            return RedirectToAction("Create", "EventAttendee", new { eventId = eventId, userId = userId });
        }

        protected override void Dispose(bool disposing) {
            if (disposing) {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
