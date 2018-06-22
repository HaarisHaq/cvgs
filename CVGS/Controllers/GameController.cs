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
    public class GameController : Controller
    {
        private ConestogaVideogameStoreDbContext db = new ConestogaVideogameStoreDbContext();

        // GET: Game
        public ActionResult Index() {
            return View(db.Game.ToList());
        }

        // GET: Game/Details/5
        public ActionResult Details(int? id) {
            if (id == null) {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Game game = db.Game.Find(id);
            if (game == null) {
                return HttpNotFound();
            }
            return View(game);
        }

        // GET: Game/Create
        public ActionResult Create()
        {
            Game g = db.Game.ToList().Last();
            ViewBag.id = g.id + 1 + "";
            return View();
        }

        // POST: Game/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,title,genre,releaseDate,developer,esrbRating,details,plot")] Game game) {
            if (ModelState.IsValid) {
                db.Game.Add(game);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(game);
        }

        // GET: Game/Edit/5
        public ActionResult Edit(int? id) {
            if (id == null) {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Game game = db.Game.Find(id);
            if (game == null) {
                return HttpNotFound();
            }
            return View(game);
        }

        // POST: Game/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,title,genre,releaseDate,developer,esrbRating,details,plot")] Game game) {
            if (ModelState.IsValid) {
                db.Entry(game).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(game);
        }

        // GET: Game/Delete/5
        public ActionResult Delete(int? id) {
            if (id == null) {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Game game = db.Game.Find(id);
            if (game == null) {
                return HttpNotFound();
            }
            return View(game);
        }

        // POST: Game/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id) {
            Game game = db.Game.Find(id);
            db.Game.Remove(game);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult AddReview(int? gameId, int? userId) {
            return RedirectToAction("Create", "GameReview", new { gameId = gameId, userId = userId });
        }

        public ActionResult ViewGameReviews(int? gameId) {
            if (!gameId.HasValue) {
                //all reviews of all applicable
                return RedirectToAction("Index", "GameReview");
            }
            if (!db.Game.Any(g => g.id == gameId)) {
                //id does not exist
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            //all reviews of 1 game
            return RedirectToAction("GameAllReviews", "GameReview", new { gameId = gameId });
        }

        public ActionResult AddToWishList(int? gameId, int? userId) {
            if (!gameId.HasValue || !userId.HasValue) {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            if (!db.Game.Any(g => g.id == gameId) || !db.Member.Any(u => u.id == userId)) {
                //either id does not exist
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            return RedirectToAction("Create", "WishList", new { gameId = gameId, userId = userId });
        }

        public ActionResult AddToCart(int? gameId, int? userId)
        {
            if (!gameId.HasValue || !userId.HasValue)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            if (!db.Game.Any(g => g.id == gameId) || !db.Member.Any(u => u.id == userId))
            {
                //either id does not exist
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            return RedirectToAction("Create", "Cart", new { gameId = gameId, userId = userId });
        }

        protected override void Dispose(bool disposing) {
            if (disposing) {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
