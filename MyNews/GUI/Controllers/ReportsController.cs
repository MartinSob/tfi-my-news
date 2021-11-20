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
            ReportTagBl reportBl = new ReportTagBl();
            reportBl.calculateResult();
            return Json(new { type = "success", data = reportBl.getResult() }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult totalReads() {
            ReportReadsBl reportBl = new ReportReadsBl();
            reportBl.calculateResult();
            return Json(new { type = "success", data = reportBl.getResult() }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult popularPosts() {
            ReportPostBl reportBl = new ReportPostBl();
            reportBl.calculateResult();
            return Json(new { type = "success", data = reportBl.getResult() }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult unpopularPosts() {
            ReportPostBl reportBl = new ReportPostBl();
            reportBl.calculateResult();
            return Json(new { type = "success", data = reportBl.getNegativeResult() }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult popularEmployees() {
            ReportEmployeeBl reportBl = new ReportEmployeeBl();
            reportBl.calculateResult();
            return Json(new { type = "success", data = reportBl.getResult() }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult unpopularEmployees() {
            ReportEmployeeBl reportBl = new ReportEmployeeBl();
            reportBl.calculateResult();
            return Json(new { type = "success", data = reportBl.getNegativeResult() }, JsonRequestBehavior.AllowGet);
        }
    }
}