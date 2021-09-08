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

        // GET: Login
        public ActionResult Index()
        {
            if (Session["user"] != null) {
                return Redirect("./Home");
            }

            return View();
        }

        public ActionResult Login(string username, string password) {
            User loggedUser;
            loggedUser = userBl.login(new User { username = username, password = password });
            if (loggedUser == null) {
                return Json(new { type = "danger", description = "El nombre de usuario o contraseña no son correctos." }, JsonRequestBehavior.AllowGet);
            }
            Session["user"] = loggedUser;

            new LanguageBl().load(loggedUser.language);
            Session["texts"] = loggedUser.language.texts;

            return Json(new { type = "success" }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult Logout() {
            new UserBl().logout((User)Session["user"]);
            Session["user"] = null;
            return Redirect("/Login");
        }

        public ActionResult Signup() {
            return View();
        }

        [HttpPost]
        public ActionResult CreateUser(string username, string password, string name, string lastname, string mail) {
            if (userBl.exists(username, mail)) {
				return Json(new { type = "danger", description = "El nombre o mail del usuario ya esta registrado." }, JsonRequestBehavior.AllowGet);
			}

			User newUser = userBl.create(new User {
				username = username,
				password = password,
				name = name,
				lastname = lastname,
				mail = mail
			});

			if (newUser.id == 0) {
				return Json(new { type = "danger", description = "Hubo un problema creando el usuario." }, JsonRequestBehavior.AllowGet);
			}

			return Json(new { type = "success", description = "Usuario creado correctamente." }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult ForgotPassword() {
            return View();
        }

        public ActionResult Reset(string email) {
            if (new UserBl().resetPassword(email)) {
                return Json(new { type = "success", description = "Se ha enviado un correo con la nueva contraseña." }, JsonRequestBehavior.AllowGet);
            } else {
                return Json(new { type = "danger", description = "Hubo un problema generando la nueva contraseña." }, JsonRequestBehavior.AllowGet);
            }
        }
    }
}