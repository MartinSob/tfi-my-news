using BusinessEntity;
using BusinessLogic;
using CsvHelper;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
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

            Dictionary<string, int> result = new Dictionary<string, int>();
            foreach (KeyValuePair<string, int> item in reportBl.getResult()) {
                result.Add(((Dictionary<string, string>)Session["texts"])[item.Key], item.Value);
            }

            return Json(new { type = "success", data = result.ToList() }, JsonRequestBehavior.AllowGet);
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

        public ActionResult createPDF(string htmlFile) {
			try {
                ReportTagBl reportBl = new ReportTagBl();
                reportBl.createPDF(htmlFile, Server.MapPath("/"));
            } catch (Exception e) {
                Console.WriteLine(e);
            }

            return Json(new { type = "success" }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult downloadPDF() {
            ReportTagBl reportBl = new ReportTagBl();
            byte[] fileBytes = reportBl.downloadPDF(Server.MapPath("/"));

            string fileName = "report.pdf";
            return File(fileBytes, System.Net.Mime.MediaTypeNames.Application.Octet, fileName);
        }

        public ActionResult CSV() {
            ReportEmployeeBl reportEmpBl = new ReportEmployeeBl();
            reportEmpBl.calculateResult();

            ReportPostBl reportPostBl = new ReportPostBl();
            reportPostBl.calculateResult();

            ReportTagBl reportTagBl = new ReportTagBl();
            reportTagBl.calculateResult();

            ReportReadsBl reportReadBl = new ReportReadsBl();
            reportReadBl.calculateResult();

            using (var writer = reportTagBl.getCSVStremWriter(Server.MapPath("/")))
            using (var csv = new CsvWriter(writer, CultureInfo.InvariantCulture)) {

                csv.WriteField(" - " + ((Dictionary<string, string>)Session["texts"])["date"]);
                csv.WriteField(DateTime.Now.ToString("yyyy-MM-d"));
                csv.NextRecord();
                csv.NextRecord();
                csv.NextRecord();
                csv.WriteField(" - " + ((Dictionary<string, string>)Session["texts"])["popular_employees"]);
                csv.NextRecord();
                csv.WriteHeader<EmployeeRecommendation>();
                csv.NextRecord();
                foreach (var record in reportEmpBl.getResult()) {
                    csv.WriteRecord(record);
                    csv.NextRecord();
                }

                csv.NextRecord();
                csv.NextRecord();
                csv.WriteField(" - " + ((Dictionary<string, string>)Session["texts"])["unpopular_employees"]);
                csv.NextRecord();
                csv.WriteHeader<EmployeeRecommendation>();
                csv.NextRecord();
                foreach (var record in reportEmpBl.getNegativeResult()) {
                    csv.WriteRecord(record);
                    csv.NextRecord();
                }

                csv.NextRecord();
                csv.NextRecord();
                csv.WriteField(" - " + ((Dictionary<string, string>)Session["texts"])["popular_posts"]);
                csv.NextRecord();
                csv.WriteHeader<PostRecommendation>();
                csv.NextRecord();
                foreach (var record in reportPostBl.getResult()) {
                    csv.WriteRecord(record);
                    csv.NextRecord();
                }

                csv.NextRecord();
                csv.NextRecord();
                csv.WriteField(" - " + ((Dictionary<string, string>)Session["texts"])["unpopular_posts"]);
                csv.NextRecord();
                csv.WriteHeader<PostRecommendation>();
                csv.NextRecord();
                foreach (var record in reportPostBl.getNegativeResult()) {
                    csv.WriteRecord(record);
                    csv.NextRecord();
                }

                csv.NextRecord();
                csv.NextRecord();
                csv.WriteField(" - " + ((Dictionary<string, string>)Session["texts"])["popular_tags"]);
                csv.NextRecord();
                csv.WriteHeader<TagRecommendation>();
                csv.NextRecord();
                foreach (var record in reportTagBl.getResult()) {
                    csv.WriteRecord(record);
                    csv.NextRecord();
                }

                csv.NextRecord();
                csv.NextRecord();
                csv.WriteField(" - " + ((Dictionary<string, string>)Session["texts"])["total_reads"]);
                csv.NextRecord();
                foreach (var record in reportReadBl.getResult()) {
                    csv.WriteRecord(record);
                    csv.NextRecord();
                }
            }

            Response.ContentType = "text/csv";
            Response.AppendHeader("Content-Disposition", "attachment;filename=report.csv");
            Response.TransmitFile(reportTagBl.getCSVPath(Server.MapPath("/")));
            Response.End();

            return Json(new { type = "success" }, JsonRequestBehavior.AllowGet);
        }
    }
}