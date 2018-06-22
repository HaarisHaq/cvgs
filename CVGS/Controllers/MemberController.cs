using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using CVGS.Models;

namespace CVGS.Controllers
{
    public class MemberController : Controller
    {
        private ConestogaVideogameStoreDbContext db = new ConestogaVideogameStoreDbContext();

        // GET: Member
        public ActionResult Index()
        {
            var member = db.Member.Include(u=>u.UserStatus);
            return View(member.ToList());
        }

        // GET: Member/Details/5
        public ActionResult Details(int? id)
        {
            if (!id.HasValue)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            User user = db.Member.Find(id);
            if (user == null)
            {
                return HttpNotFound();
            }
            return View(user);
        }

        public ActionResult RelativeList(int? id)
        {
            if (!id.HasValue)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            User user = db.Member.Find(id);
            if (user == null)
            {
                return HttpNotFound();
            }
            var relatives =
                db.RelativeList
                .Where(r => r.Member.id == id)
                .Include(r => r.Relative);
            return View(relatives.ToList());
        }

        public ActionResult AddRelative(int? user1_id, int? user2_id)
        {
            if ((!user1_id.HasValue || !user2_id.HasValue) || (user1_id == user2_id))
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            if (user1_id == user2_id)
            {
                return RedirectToAction("RelativeList", new { id = user1_id });
            }
            if (db.RelativeList.Any(rl => rl.user1_id == user1_id && rl.user2_id == user2_id))
            {
                //TODO: add error message
                return RedirectToAction("RelativeList", new { id = user1_id });
            }
            User user1 = db.Member.Find(user1_id);
            User user2 = db.Member.Find(user2_id);
            if (user1 == null || user2 == null)
            {
                return HttpNotFound();
            }
            return View(new List<User> { user1, user2 });
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AddRelative([Bind(Include = "id,user1_id,user2_id")] RelativeList relativeList)
        {
            if (ModelState.IsValid)
            {
                db.RelativeList.Add(relativeList);
                db.RelativeList.Add(new RelativeList { user1_id = relativeList.user2_id, user2_id = relativeList.user1_id });
                db.SaveChanges();

                return RedirectToAction("RelativeList", new { id = relativeList.user1_id });
            }
            return View(new List<User> { db.Member.Find(relativeList.user1_id), db.Member.Find(relativeList.user2_id) });
        }

        // GET: Member/Create
        [HttpGet]
        public ActionResult Create()
        {
            ViewBag.userStatusId = new SelectList(db.UserRank, "id", "status");
            User u = db.Member.ToList().LastOrDefault();
            ViewBag.id = u.id + 1 + "";
            return View();
        }

        // POST: Member/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,userStatusId,username,password,givenName,surname,email,phone,address,postalCode,mobile,fax,extension,preferences")] User user)
        {
            if (ModelState.IsValid)
            {
                if (db.Member.Any(u => u.username == user.username))
                {
                    ViewBag.DuplicateUser = "Username taken";
                    return View("Create", user);
                }
                db.Member.Add(user);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.userStatusId = new SelectList(db.UserRank, "id", "status", user.userStatusId);
            return View(user);
        }

        // GET: Member/Edit/5
        public ActionResult Edit(int? id)
        {
            if (!id.HasValue)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            User user = db.Member.Find(id);
            if (user == null)
            {
                return HttpNotFound();
            }
            ViewBag.userStatusId = new SelectList(db.UserRank, "id", "status", user.userStatusId);
            return View(user);
        }

        // POST: Member/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,userStatusId,username,password,givenName,surname,email,phone,address,postalCode,mobile,fax,extension")] User user)
        {
            if (ModelState.IsValid)
            {
                db.Entry(user).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.userStatusId = new SelectList(db.UserRank, "id", "status", user.userStatusId);
            return View(user);
        }

        // GET: Member/Delete/5
        public ActionResult Delete(int? id)
        {
            if (!id.HasValue)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            User user = db.Member.Find(id);
            if (user == null)
            {
                return HttpNotFound();
            }
            return View(user);
        }

        // POST: Member/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            User user = db.Member.Find(id);
            db.Member.Remove(user);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult EditPreferences(int? id)
        {
            if (!id.HasValue)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            User user = db.Member.Find(id);
            if (user == null)
            {
                return HttpNotFound();
            }
            return View(user);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditPreferences([Bind(Include = "id,preferences")] User miduser)
        {
            if (ModelState.IsValid)
            {
                User user = db.Member.Find(miduser.id);
                user.preferences = miduser.preferences;
                db.Entry(user).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View();
        }

        public ActionResult SeeWishList(int? id)
        {
            return RedirectToAction("Index", "WishList", new { userId = id });
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
