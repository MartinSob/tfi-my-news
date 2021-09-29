﻿using BusinessEntity;
using MyNews.Models;
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

        public ActionResult Index(string name = null)
        {
			if (!new PolicyBl().hasPermission((User)Session["user"], "admin_users")) {
				return HttpNotFound();
			}

			return View(new ListModel<User>(bl.get(name)));
        }

        public ActionResult Update(int id) {
			if (!new PolicyBl().hasPermission((User)Session["user"], "admin_users") && id != ((User)Session["user"]).id) {
				return HttpNotFound();
			}

			return View(bl.get(id));
        }

        public ActionResult View(int id) {
			if (!new PolicyBl().hasPermission((User)Session["user"], "admin_users") && id != ((User)Session["user"]).id) {
				return HttpNotFound();
			}

			return View(bl.get(id));
		}

		public ActionResult Password(int id) {
			if (id != ((User)Session["user"]).id) {
				return HttpNotFound();
			}

			return View(bl.get(id));
		}

		public ActionResult ChangePassword(int id, string newPassword) {
			if (id != ((User)Session["user"]).id) {
				return Json(new { type = "danger", description = ((Dictionary<string, string>)Session["texts"])["error"] }, JsonRequestBehavior.AllowGet);
			}

			if (bl.updatePassword(id, newPassword)) { 
				return Json(new { type = "success", description = ((Dictionary<string, string>)Session["texts"])["success"] }, JsonRequestBehavior.AllowGet);
			}

			return Json(new { type = "danger", description = ((Dictionary<string, string>)Session["texts"])["error"] }, JsonRequestBehavior.AllowGet);
		}

		public ActionResult Delete(int id) {
			if (id == ((User)Session["user"]).id) {
				return Json(new { type = "danger", description = ((Dictionary<string, string>)Session["texts"])["delete_myself"] }, JsonRequestBehavior.AllowGet);
			}

			if (bl.delete(id)) {
				return Json(new { type = "success", description = ((Dictionary<string, string>)Session["texts"])["success"] }, JsonRequestBehavior.AllowGet);
			} else {
				return Json(new { type = "danger", description = ((Dictionary<string, string>)Session["texts"])["error"] }, JsonRequestBehavior.AllowGet);
			}
		}

		public ActionResult UpdateUser(int id, string name, string lastname, string mail, string[] roles) {
			try {
				User user = new User {
					id = id,
					name = name,
					lastname = lastname,
					mail = mail
				};

				foreach (string role in roles) {
					user.roles.Add(new Role { id = int.Parse(role) });
				}

				bl.update(user);
				return Json(new { type = "success", description = ((Dictionary<string, string>)Session["texts"])["success"] }, JsonRequestBehavior.AllowGet);
			} catch (Exception e) {
				Console.WriteLine(e);
				return Json(new { type = "danger", description = ((Dictionary<string, string>)Session["texts"])["error"] }, JsonRequestBehavior.AllowGet);
			}
		}
	}
}