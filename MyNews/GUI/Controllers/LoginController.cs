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
        UserBl userBl = new UserBl();

        public ActionResult Index()
        {
            if (Session["user"] != null) {
                return Redirect("./Home");
            }

            Session["texts"] = new LanguageBl().loadDefault().texts;

            return View();
        }

        public ActionResult Login(string username, string password) {
            User loggedUser;

            if (new DvBl().verifyDv().Count != 0) {
                loggedUser = userBl.basicLogin(new User { username = username, password = password });
                if (!new PolicyBl().hasPermission(loggedUser, "admin_copy")) {
                    return Json(new { type = "danger", description = ((Dictionary<string, string>)Session["texts"])["error_try_again"] }, JsonRequestBehavior.AllowGet);
                }

                Session["user"] = loggedUser;
                new LanguageBl().load(loggedUser.language);
                Session["texts"] = loggedUser.language.texts;

                return Json(new { type = "danger", description = ((Dictionary<string, string>)Session["texts"])["vd_problems"], data = "vd_problems" }, JsonRequestBehavior.AllowGet);
            }

            loggedUser = userBl.login(new User { username = username, password = password });
            if (loggedUser == null) {
                return Json(new { type = "danger", description = ((Dictionary<string, string>)Session["texts"])["login_failed"] }, JsonRequestBehavior.AllowGet);
            }

            Session["user"] = loggedUser;
            new LanguageBl().load(loggedUser.language);
            Session["texts"] = loggedUser.language.texts;

            return Json(new { type = "success" }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult Logout() {
            userBl.logout((User)Session["user"]);
            Session["user"] = null;
            return Redirect("/Login");
        }

        public ActionResult Signup() {
            Session["texts"] = new LanguageBl().loadDefault().texts;
            return View();
        }

        [HttpPost]
        public ActionResult CreateUser(string username, string password, string name, string lastname, string mail) {
            if (new DvBl().verifyDv().Count != 0) {
                return Json(new { type = "danger", description = ((Dictionary<string, string>)Session["texts"])["error_try_again"] }, JsonRequestBehavior.AllowGet);
            }

            if (userBl.exists(username, mail)) {
				return Json(new { type = "danger", description = ((Dictionary<string, string>)Session["texts"])["already_registered"] }, JsonRequestBehavior.AllowGet);
			}

			User newUser = userBl.create(new User {
				username = username,
				password = password,
				name = name,
				lastname = lastname,
				mail = mail
			});

			if (newUser.id == 0) {
				return Json(new { type = "danger", description = ((Dictionary<string, string>)Session["texts"])["user_create_error"] }, JsonRequestBehavior.AllowGet);
			}

			return Json(new { type = "success", description = ((Dictionary<string, string>)Session["texts"])["user_create_success"] }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult ForgotPassword() {
            Session["texts"] = new LanguageBl().loadDefault().texts;
            return View();
        }

        public ActionResult Reset(string email) {
            if (new DvBl().verifyDv().Count != 0) {
                return Json(new { type = "danger", description = ((Dictionary<string, string>)Session["texts"])["error_try_again"] }, JsonRequestBehavior.AllowGet);
            }

            if (userBl.resetPassword(email)) {
                return Json(new { type = "success", description = ((Dictionary<string, string>)Session["texts"])["password_reset_success"] }, JsonRequestBehavior.AllowGet);
            } else {
                return Json(new { type = "danger", description = ((Dictionary<string, string>)Session["texts"])["password_reset_error"] }, JsonRequestBehavior.AllowGet);
            }
        }
    }
}