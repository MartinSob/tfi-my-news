using BusinessEntity;
using MyNews.Models;
using Security;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MyNews.Controllers
{
    public class AuthorizationController : Controller
    {
        PolicyBl policyBl = new PolicyBl();

        // GET: Authorization
        public ActionResult Index(string text)
        {
            if (!new PolicyBl().hasPermission((User)Session["user"], "admin_policies")) {
                return HttpNotFound();
            }

            return View(new ListModel<Role>(policyBl.getRoles(text)));
        }

        public ActionResult View(int id) {
            return View(policyBl.getRole(new Role { id = id }));
        }

        public ActionResult Create() {
            return View();
        }

        public ActionResult Update(int id) {
            return View();
        }

        public ActionResult Delete(int id) {
            if (new PolicyBl().delete(id)) {
                return Json(new { type = "success", description = ((Dictionary<string, string>)Session["texts"])["success"] }, JsonRequestBehavior.AllowGet);
            } else {
                return Json(new { type = "danger", description = ((Dictionary<string, string>)Session["texts"])["error"] }, JsonRequestBehavior.AllowGet);
            }
        }
    }
}