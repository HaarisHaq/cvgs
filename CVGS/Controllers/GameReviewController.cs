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
    public class GameReviewController : Controller
    {
        private ConestogaVideogameStoreDbContext db = new ConestogaVideogameStoreDbContext();

        // GET: GameReview
        public ActionResult Index()
        {
            var gameReview = db.GameReview.Include(g => g.Game).Include(g => g.User);
            return View(gameReview.ToList());
        }

        // GET: GameReview/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            GameReview gameReview = db.GameReview.Find(id);
            if (gameReview == null)
            {
                return HttpNotFound();
            }
            return View(gameReview);
        }

        public ActionResult GameAllReviews(int? gameId)
        {
            if (!gameId.HasValue)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            if (!db.Game.Any(g => g.id == gameId))
            {
                return HttpNotFound();
            }
            return View(db.GameReview.Include(gr => gr.Game).Include(gr => gr.User).Where(gr => gr.gameId == gameId).ToList());
        }

        // GET: GameReview/Create
        public ActionResult Create(int? gameId, int? userId)
        {
            if (!gameId.HasValue || !userId.HasValue)
            {
                //either value is null
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            if (!db.Game.Any(g => g.id == gameId) || !db.Member.Any(u => u.id == userId))
            {
                //either id does not exist
                return HttpNotFound();
            }
            if (db.GameReview.Any(gr => gr.gameId == gameId && gr.userId == userId))
            {
                //review for this game by this user exists
                GameReview gameReview = db.GameReview.FirstOrDefault(gr => gr.gameId == gameId && gr.userId == userId);
                return RedirectToAction("Edit", new { id = gameReview.id });
            }
            GameReview r = db.GameReview.ToList().LastOrDefault();
            GameReview review = new GameReview()
            {
                id = r.id + 1,
                gameId = gameId.Value,
                userId = userId.Value,
                Game = db.Game.Find(gameId)
            };
            return View(review);
        }

        // POST: GameReview/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,gameId,userId,rating,details")] GameReview gameReview)
        {
            if (ModelState.IsValid)
            {
                db.GameReview.Add(gameReview);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(gameReview);
        }

        // GET: GameReview/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            GameReview gameReview = db.GameReview.Find(id);
            if (gameReview == null)
            {
                return HttpNotFound();
            }
            return View(gameReview);
        }

        // POST: GameReview/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,gameId,userId,rating,details")] GameReview gameReview)
        {
            if (ModelState.IsValid)
            {
                db.Entry(gameReview).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(gameReview);
        }

        // GET: GameReview/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            GameReview gameReview = db.GameReview.Find(id);
            if (gameReview == null)
            {
                return HttpNotFound();
            }
            return View(gameReview);
        }

        // POST: GameReview/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            GameReview gameReview = db.GameReview.Find(id);
            db.GameReview.Remove(gameReview);
            db.SaveChanges();
            return RedirectToAction("Index");
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
