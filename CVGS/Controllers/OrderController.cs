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
    public class OrderController : Controller
    {
        private ConestogaVideogameStoreDbContext db = new ConestogaVideogameStoreDbContext();

        // GET: Orders
        public ActionResult Index()
        {
            var orders = db.Order;
            return View(db.Order.ToList());
        }

        public ActionResult Details(int? id) {
            if (!id.HasValue) {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            if (!db.Order.Any(o => o.id == id)) {
                return RedirectToAction("Index", "Member", null);
            }
            var order = db.Order.Find(id.Value);
            return View(order);
        }

        // GET: Orders/Create
        public ActionResult Create(int? userId)
        {
            if (!userId.HasValue)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            if (!db.Member.Any(u => u.id == userId) || !db.Cart.Any(c => c.userId == userId))
            {
                return RedirectToAction("Index", "Member", null);
            }

            var cart = db.Cart.Where(c => c.userId == userId);
            return View(cart.ToList());
        }

        // POST: Orders/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,userId")] Order order)
        {
            if (ModelState.IsValid)
            {
                var cart = db.Cart.SqlQuery($"SELECT DISTINCT * FROM cart WHERE userId = {order.userId}").ToList();
                if (cart.Count() > 0)
                {
                    order.processed = 0;
                    db.Order.Add(order);
                    foreach (Cart cartItem in cart)
                    {
                        db.OrderItems.Add(new OrderItem
                        {
                            orderId = order.id,
                            gameId = cartItem.gameId
                        });
                    }
                    db.SaveChanges();
                    return RedirectToAction("Index", new { id = order.id });
                }
            }

            return View(order);
        }

        public ActionResult ProcessOrder(int? id)
        {
            if (!id.HasValue)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            if (!db.Order.Any(o => o.id == id))
            {
                return RedirectToAction("Index");
            }
            var order = db.Order.Find(id);
            return View(order);
        }

        [HttpPost]
        public ActionResult ProcessOrder([Bind(Include = "id,userId,processed")]Order order)
        {
            if (!Convert.ToBoolean(order.processed))
            {
                db.Order.SqlQuery($"UPDATE [order] SET processed = 1 WHERE id = {order.id}");
                db.SaveChanges();
            }
            return RedirectToAction("Details", new { id = order.id});
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
