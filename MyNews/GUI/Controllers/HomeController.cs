using BusinessEntity;
using BusinessLogic;
using MyNews.Models;
using Security;
using System;
using System.Collections.Generic;
using System.Web.Mvc;

namespace MyNews.Controllers
{
	public class HomeController : Controller
	{
		PostBl postBl = new PostBl();
		RecommendationBl recommendationBl = new RecommendationBl();

		public ActionResult Index(string text = null) {
			if (!new PolicyBl().hasPermission((User)Session["user"], "post_read")) {
				return HttpNotFound();
			}

			var posts = new ListModel<PostRecommendation>(recommendationBl.get((User)Session["user"], 10));
			return View(posts);
		}

		public ActionResult View(int id) {
			postBl.addOpen(new Post { id = id }, (User)Session["user"]);
			return View(postBl.getUserView(new Post { id = id}, (User)Session["user"]));
		}

		public ActionResult Search(string text = null, string from = null, string to = null, int tagId = 0, int employeeId = 0) {
			DateTime? fromDate = null;
			DateTime? toDate = null;
			DateTime value;

			if (DateTime.TryParse(from, out value)) {
				fromDate = value;
			}

			if (DateTime.TryParse(to, out value)) {
				toDate = value;
			}

			return View(new ListModel<Post>(postBl.get(text, fromDate, toDate, tagId, employeeId)));
		}

		public ActionResult ReadPost(int id) {
			postBl.addRead(new Post { id = id }, (User)Session["user"]);
			return Json(new { type = "success", description = ((Dictionary<string, string>)Session["texts"])["success"] }, JsonRequestBehavior.AllowGet);
		}

		public ActionResult QualifyPost(int id, int qualification) {
			postBl.addLike(new Post { id = id }, (User)Session["user"], qualification);
			return Json(new { type = "success", description = ((Dictionary<string, string>)Session["texts"])["success"] }, JsonRequestBehavior.AllowGet);
		}
	}
}