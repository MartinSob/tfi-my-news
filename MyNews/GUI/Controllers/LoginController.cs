using BusinessEntity;
using Security;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MyNews.Controllers
{
    public class LoginController : Controller
    {
        // GET: Login
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Login(string username, string password) {
            UserBl userBl = new UserBl();
            User loggedUser;
            loggedUser = userBl.login(new User { username = username, password = password });
            Session["user"] = loggedUser;
            return Json(new { id = 1, value = "new" }, JsonRequestBehavior.AllowGet);
        }
    }
}