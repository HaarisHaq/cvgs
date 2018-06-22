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
    public class CartController : Controller
    {
        private ConestogaVideogameStoreDbContext db = new ConestogaVideogameStoreDbContext();

        // GET: Cart
        public ActionResult Index(int? userId)
        {
            if (!userId.HasValue)
            {
                return RedirectToAction("Index", "Member", null);
            }
            if (!db.Member.Any(u => u.id == userId))
            {
                return RedirectToAction("Index", "Member", null);
            }
            var cart = db.Cart.Include(c => c.Game).Include(c => c.Owner);
            return View(cart.ToList());
        }

        // GET: Cart/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Cart cart = db.Cart.Find(id);
            if (cart == null)
            {
                return HttpNotFound();
            }
            return View(cart);
        }

        // GET: Cart/Create
        public ActionResult Create(int? gameId, int? userId)
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
            Cart cart = new Cart
            {
                gameId = gameId.Value,
                userId = userId.Value,
                Game = db.Game.Find(gameId)
            };
            return View(cart);
        }

        // POST: Cart/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "userId,gameId")] Cart cart)
        {
            if (ModelState.IsValid)
            {
                db.Cart.Add(cart);
                db.SaveChanges();
                return RedirectToAction("Index", new { userId = cart.userId });
            }

            return View(cart);
        }

        public ActionResult SendToOrder(int? userId)
        {
            if (!userId.HasValue)
            {
                return RedirectToAction("Index", "Game", null);
            }
            if (!db.Member.Any(u => u.id == userId))
            {
                return RedirectToAction("Index", "Member", null);
            }

            return RedirectToAction("Create", "Order", new { userId = userId });
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
