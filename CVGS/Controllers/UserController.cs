using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CVGS.Models;

namespace CVGS.Controllers
{
    public class UserController : Controller
    {
        private ConestogaVideogameStoreDbContext db = new ConestogaVideogameStoreDbContext();
        [HttpGet]
        // GET: User
        public ActionResult RegisterEditUser(int id = 0)
        {
            User userModel = new User();
            return View(userModel);
        }
        [HttpPost]
        public ActionResult RegisterEditUser(User userModel)
        {
            //Check if the user already exists has to find the entity name from entity database model
                if (db.Member.Any(x => x.username == userModel.username))
                {
                    ViewBag.DuplicateUser = "username already exist!";
                    return View("AddOrEdit", userModel);
                }

                db.Member.Add(userModel);
                db.SaveChanges();
            
            ModelState.Clear();
            ViewBag.SuccessMessage = "Registration Successful!";
            return View("RegisterEditUser", new User());
        }
    }
}