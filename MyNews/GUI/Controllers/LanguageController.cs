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
        // GET: Language
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult LoadLanguage(int id) {
            Language lang = new LanguageBl().load(new Language {
                id = id
            });
            Session["texts"] = lang.texts;
            return Json(new { type = "success" }, JsonRequestBehavior.AllowGet);
        }
    }
}