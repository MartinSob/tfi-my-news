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
    public class LanguageController : Controller
    {
        LanguageBl langBl = new LanguageBl();

        // GET: Language
        public ActionResult Index(string text)
        {
            if (!new PolicyBl().hasPermission((User)Session["user"], "admin_policies")) {
                return HttpNotFound();
            }

            return View(new ListModel<Language>(langBl.get(text)));
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

        public ActionResult Delete(int id) {
            if (langBl.get().Count == 1) {
				return Json(new { type = "danger", description = ((Dictionary<string, string>)Session["texts"])["last_language"] }, JsonRequestBehavior.AllowGet);
			}

			if (langBl.delete(id)) {
                return Json(new { type = "success", description = ((Dictionary<string, string>)Session["texts"])["success"] }, JsonRequestBehavior.AllowGet);
            } else {
                return Json(new { type = "danger", description = ((Dictionary<string, string>)Session["texts"])["error"] }, JsonRequestBehavior.AllowGet);
            }
        }

        public ActionResult Update(int id) {
            return View(langBl.get(id));
        }

        public ActionResult Create() {
            return View();
        }

        public ActionResult UpdateLanguage(int id, string name, string[] tags, string[] translations) {
            Language l = new Language {
                id = id,
                name = name
            };

            for (int i = 0; i < tags.Length; i++) {
                l.texts.Add(tags[i], translations[i]);
            }

            langBl.update(l);
            return Json(new { type = "success", description = ((Dictionary<string, string>)Session["texts"])["success"] }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult CreateLanguage(string name, string[] tags, string[] translations) {
            Language l = new Language {
                name = name
            };

            for (int i = 0; i < tags.Length; i++) {
                l.texts.Add(tags[i], translations[i]);
            }

            langBl.create(l);
            return Json(new { type = "success", description = ((Dictionary<string, string>)Session["texts"])["success"] }, JsonRequestBehavior.AllowGet);
        }
    }
}