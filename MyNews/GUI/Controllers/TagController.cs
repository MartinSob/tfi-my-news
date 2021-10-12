using BusinessEntity;
using BusinessLogic;
using MyNews.Models;
using Security;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MyNews.Controllers
{
    public class TagController : Controller
    {
        TagBl bl = new TagBl();

        public ActionResult Index(string text)
        {
            if (!new PolicyBl().hasPermission((User)Session["user"], "admin_tags")) {
                return HttpNotFound();
            }

            return View(new ListModel<Tag>(bl.get(text)));
        }

        public ActionResult Delete(int id) {
            if (bl.delete(id)) {
                return Json(new { type = "success", description = ((Dictionary<string, string>)Session["texts"])["success"] }, JsonRequestBehavior.AllowGet);
            } else {
                return Json(new { type = "danger", description = ((Dictionary<string, string>)Session["texts"])["error"] }, JsonRequestBehavior.AllowGet);
            }
        }

        public ActionResult Update(int id) {
            return View(bl.get(id));
        }

        public ActionResult Create() {
            return View();
        }

        public ActionResult UpdateTag(int id, string name) {
            Tag tag = new Tag {
                id = id,
                name = name
            };

            bl.update(tag);
            return Json(new { type = "success", description = ((Dictionary<string, string>)Session["texts"])["success"] }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult CreateTag(string name) {
            Tag tag = new Tag {
                name = name
            };

            bl.create(tag);
            return Json(new { type = "success", description = ((Dictionary<string, string>)Session["texts"])["success"] }, JsonRequestBehavior.AllowGet);
        }
    }
}