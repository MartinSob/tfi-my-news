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
                return Json(new { type = "danger", description = "There are problems with the DV.", data = "DV"}, JsonRequestBehavior.AllowGet);
            }

            if (new BackupBl().backup(Server.MapPath("/"))) {
                return Json(new { type = "success", description = "The backup was created successfuly." }, JsonRequestBehavior.AllowGet);
            } else {
                return Json(new { type = "danger", description = "There was an error creating the backup." }, JsonRequestBehavior.AllowGet);
            }
        }

        public ActionResult CreateRestore(string name) {
            if (!new PolicyBl().hasPermission((User)Session["user"], "restore_manage")) {
                return HttpNotFound();
            }

            if (new BackupBl().restore(new Backup {
                name = name,
            }, Server.MapPath("/"))) {
                return Json(new { type = "success", description = "The restore was successfuly." }, JsonRequestBehavior.AllowGet);
            } else {
                return Json(new { type = "danger", description = "There was an error with the restore." }, JsonRequestBehavior.AllowGet);
            }
        }

        public ActionResult UpdateDv() {
            if (!new PolicyBl().hasPermission((User)Session["user"], "dv_update")) {
                return HttpNotFound();
            }

            if (new DvBl().updateDv((User)Session["user"])) {
                return Json(new { type = "success", description = "The DV were updated successfuly." }, JsonRequestBehavior.AllowGet);
            } else {
                return Json(new { type = "danger", description = "There was an error updating the DV." }, JsonRequestBehavior.AllowGet);
            }
        }

        public ActionResult ValidateDv() {
            List<string> errors = new DvBl().verifyDv((User)Session["user"]);
            if (errors.Count == 0) {
                return Json(new { type = "success", description = "The DV are valid." }, JsonRequestBehavior.AllowGet);
            } else {
                string json = JsonConvert.SerializeObject(errors);
                return Json(new { type = "danger", description = "There are problems with the DV.", data = json }, JsonRequestBehavior.AllowGet);
            }
        }
    }
}