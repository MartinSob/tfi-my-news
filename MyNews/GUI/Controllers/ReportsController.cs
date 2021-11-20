using BusinessLogic;
using System.Web.Mvc;

namespace MyNews.Controllers
{
	public class ReportsController : Controller
    {
        // GET: Reports
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult popularTags() {
            return Json(new { type = "success", data = new ReportTagBl().getResult() }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult totalReads() {
            return Json(new { type = "success", data = new ReportReadsBl().getResult() }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult popularPosts() {
            return Json(new { type = "success", data = new ReportPostBl().getResult() }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult unpopularPosts() {
            return Json(new { type = "success", data = new ReportPostBl().getResult() }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult popularEmployees() {
            return Json(new { type = "success", data = new ReportEmployeeBl().getResult() }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult unpopularEmployees() {
            return Json(new { type = "success", data = new ReportEmployeeBl().getResult() }, JsonRequestBehavior.AllowGet);
        }
    }
}