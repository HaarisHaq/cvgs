using CVGS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using System.Data;
using System.Data.Entity;

namespace CVGS.Controllers {
    public class WishListController : Controller
    {
        private ConestogaVideogameStoreDbContext db = new ConestogaVideogameStoreDbContext();

        // GET: WishList
        public ActionResult Index(int? userId) {
            if (!userId.HasValue) {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            if (!db.Member.Any(u => u.id == userId.Value)) {
                return HttpNotFound();
            }
            return View(db.WishList.Include(wl => wl.Game).Where(wl => wl.userId == userId).ToList());
        }

        public ActionResult Create(int? gameId, int? userId) {
            if (!gameId.HasValue || !userId.HasValue) {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            if (!db.Game.Any(g => g.id == gameId) || !db.Member.Any(u => u.id == userId)) {
                //either id does not exist
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            WishList list = new WishList {
                gameId = gameId.Value,
                userId = userId.Value,
                date = System.DateTime.Now.Date
            };
            return View(list);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "gameId,userId,date")] WishList wishList) {
            if (ModelState.IsValid) {
                db.WishList.Add(wishList);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(wishList);
        }

    }
}