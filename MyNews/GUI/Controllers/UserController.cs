using Security;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MyNews.Controllers
{
    public class UserController : Controller
    {
        UserBl bl = new UserBl();

        // GET: User
        public ActionResult Index()
        {
            return View(bl.get());
        }
    }
}