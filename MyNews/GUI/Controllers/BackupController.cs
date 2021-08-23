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
            //new BackupBl().get();
            return View();
        }

        public ActionResult CreateBackup() {
            if (new BackupBl().backup(Server.MapPath("/"))) {
                return Json(new { type = "success", description = "The backup was created successfuly." }, JsonRequestBehavior.AllowGet);
            } else {
                return Json(new { type = "error", description = "There was an error creating the backup." }, JsonRequestBehavior.AllowGet);
            }
        }

        public ActionResult CreateRestore(string name) {
            if (new BackupBl().restore(new BusinessEntity.Backup {
                name = name,
            })) {
                return Json(new { type = "success", description = "The restore was successfuly." }, JsonRequestBehavior.AllowGet);
            } else {
                return Json(new { type = "error", description = "There was an error with the restore." }, JsonRequestBehavior.AllowGet);
            }
        }
    }
}