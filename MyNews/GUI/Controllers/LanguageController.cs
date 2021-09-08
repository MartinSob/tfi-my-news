using BusinessEntity;
using Security;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MyNews.Controllers
{
    public class LanguageController : Controller
    {
        LanguageBl langBl = new LanguageBl();

        // GET: Language
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult LoadLanguage(int id) {
            Language lang = langBl.load(new Language {
                id = id
            });
            Session["texts"] = lang.texts;

            if (Session["user"] != null) {
                langBl.setToUser(lang, (User)Session["user"]);
            }

            return Json(new { type = "success" }, JsonRequestBehavior.AllowGet);
        }
    }
}