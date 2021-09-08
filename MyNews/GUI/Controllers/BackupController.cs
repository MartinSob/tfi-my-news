using BusinessEntity;
using MyNews.Models;
using Newtonsoft.Json;
using Security;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MyNews.Controllers
{
    public class BackupController : Controller
    {
        // GET: Backup
        public ActionResult Index()
        {
            if (!new PolicyBl().hasPermission((User)Session["user"], "admin_copy")) {
                return HttpNotFound();
            }

            return View(new ListModel<Backup>(new BackupBl().get()));
        }

        public ActionResult CreateBackup() {
            if (!new PolicyBl().hasPermission((User)Session["user"], "backup_manage")) {
                return HttpNotFound();
            }

            List<string> errors = new DvBl().verifyDv((User)Session["user"]);
            if (errors.Count != 0) {
                return Json(new { type = "danger", description = ((Dictionary<string, string>)Session["texts"])["vd_problems"], data = "DV"}, JsonRequestBehavior.AllowGet);
            }

            if (new BackupBl().backup(Server.MapPath("/"))) {
                return Json(new { type = "success", description = ((Dictionary<string, string>)Session["texts"])["backup_success"] }, JsonRequestBehavior.AllowGet);
            } else {
                return Json(new { type = "danger", description = ((Dictionary<string, string>)Session["texts"])["backup_error"] }, JsonRequestBehavior.AllowGet);
            }
        }

        public ActionResult CreateRestore(string name) {
            if (!new PolicyBl().hasPermission((User)Session["user"], "restore_manage")) {
                return HttpNotFound();
            }

            if (new BackupBl().restore(new Backup {
                name = name,
            }, Server.MapPath("/"))) {
                return Json(new { type = "success", description = ((Dictionary<string, string>)Session["texts"])["restore_success"] }, JsonRequestBehavior.AllowGet);
            } else {
                return Json(new { type = "danger", description = ((Dictionary<string, string>)Session["texts"])["restore_error"] }, JsonRequestBehavior.AllowGet);
            }
        }

        public ActionResult UpdateDv() {
            if (!new PolicyBl().hasPermission((User)Session["user"], "dv_update")) {
                return HttpNotFound();
            }

            if (new DvBl().updateDv((User)Session["user"])) {
                return Json(new { type = "success", description = ((Dictionary<string, string>)Session["texts"])["vd_valid_update_success"] }, JsonRequestBehavior.AllowGet);
            } else {
                return Json(new { type = "danger", description = ((Dictionary<string, string>)Session["texts"])["vd_valid_update_error"] }, JsonRequestBehavior.AllowGet);
            }
        }

        public ActionResult ValidateDv() {
            List<string> errors = new DvBl().verifyDv((User)Session["user"]);
            if (errors.Count == 0) {
                return Json(new { type = "success", description = ((Dictionary<string, string>)Session["texts"])["vd_valid"] }, JsonRequestBehavior.AllowGet);
            } else {
                string json = JsonConvert.SerializeObject(errors);
                return Json(new { type = "danger", description = ((Dictionary<string, string>)Session["texts"])["vd_problems"], data = json }, JsonRequestBehavior.AllowGet);
            }
        }
    }
}