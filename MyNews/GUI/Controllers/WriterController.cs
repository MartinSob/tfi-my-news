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
    public class WriterController : Controller
    {
        PostBl pbl = new PostBl();
        EmployeeBl ebl = new EmployeeBl();

        public ActionResult Index(string text = null)
        {
			if (!new PolicyBl().hasPermission((User)Session["user"], "admin_tags")) {
				return HttpNotFound();
			}

			return View(new ListModel<Post>(pbl.get(text)));
        }

        //public ActionResult UploadImage(string image) {
        //https://stackoverflow.com/questions/5400173/converting-a-base-64-string-to-an-image-and-saving-it
        //}

        public ActionResult DeletePost(int id) {
            if (pbl.delete(id)) {
                return Json(new { type = "success", description = ((Dictionary<string, string>)Session["texts"])["success"] }, JsonRequestBehavior.AllowGet);
            } else {
                return Json(new { type = "danger", description = ((Dictionary<string, string>)Session["texts"])["error"] }, JsonRequestBehavior.AllowGet);
            }
        }

        public ActionResult Update(int id) {
            return View(pbl.get(id));
        }

        public ActionResult Create() {
            return View();
        }

        public ActionResult UpdatePost(int id, string title, string body) {
            Post post = new Post {
                id = id,
                title = title,
                body = body,
                employee = new Employee { employeeId = ebl.getByUser((User)Session["user"]).employeeId }
            };

            pbl.update(post);
            return Json(new { type = "success", description = ((Dictionary<string, string>)Session["texts"])["success"] }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult CreatePost(string title, string body) {
            Post post = new Post {
                title = title,
                body = body,
                employee = new Employee { employeeId = ebl.getByUser((User)Session["user"]).employeeId }
            };

            pbl.create(post);
            return Json(new { type = "success", description = ((Dictionary<string, string>)Session["texts"])["success"] }, JsonRequestBehavior.AllowGet);
        }
    }
}