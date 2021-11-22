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
	public class EmployeeController : Controller
	{
		EmployeeBl bl = new EmployeeBl();

		public ActionResult Index(string text, bool showOld = false) {
			if (!new PolicyBl().hasPermission((User)Session["user"], "admin_employees")) {
				return HttpNotFound();
			}

			return View(new ListModel<Employee>(bl.get(text, showOld)));
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

		public ActionResult UpdateEmployee(int id, int user_id, DateTime start_day, DateTime? end_day, string id_number, DateTime birthday) {
			Employee employee = new Employee {
				id = user_id,
				employeeId = id,
				startDay = start_day,
				endDay = end_day,
				document = id_number,
				birthday = birthday
			};

			bl.update(employee);
			return Json(new { type = "success", description = ((Dictionary<string, string>)Session["texts"])["success"] }, JsonRequestBehavior.AllowGet);
		}

		public ActionResult CreateEmployee(int user_id, DateTime start_day, DateTime? end_day, string id_number, DateTime birthday) {
			Employee employee = new Employee {
					id = user_id,
					startDay = start_day,
					endDay = end_day,
					document = id_number,
					birthday = birthday
				};

			bl.create(employee);
			return Json(new { type = "success", description = ((Dictionary<string, string>)Session["texts"])["success"] }, JsonRequestBehavior.AllowGet);
		}

		public ActionResult GetUsersByName(string name) {
			List<User> users = bl.getUsersNotEmployed(name);
			return Json(new { data = users }, JsonRequestBehavior.AllowGet);
		}

		public ActionResult GetEmployees(string name) {
			List<Employee> users = bl.get(name);
			return Json(new { data = users }, JsonRequestBehavior.AllowGet);
		}
	}
}