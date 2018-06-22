using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CVGS.Models;

namespace CVGS.Controllers
{
    public class LoginController : Controller
    {
        private static ConestogaVideogameStoreDbContext db = new ConestogaVideogameStoreDbContext();
        // GET: Login
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Authorize([Bind(Include = "username,password")]User user)
        {
            //Used from entity database model
                var userDetails = db.Member
                        .Where(x =>
                        x.username == user.username &&
                        x.password == user.password)
                        .FirstOrDefault();
                if (userDetails == null)
                {
                    user.LoginErrorMessage = "Username or password don't match";
                    return View("Index", user);
                }
                else
                {
                    Session.Add("userid", userDetails.id);
                    return RedirectToAction("Index", "Home");
                }
        }
        public ActionResult logOut()
        {
            Session.Abandon();
            return RedirectToAction("Index", "Login");
        }
    }
}