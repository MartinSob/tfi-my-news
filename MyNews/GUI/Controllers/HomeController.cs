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
	public class HomeController : Controller
	{
		PostBl postBl = new PostBl();

		public ActionResult Index(string text = null) {
			if (!new PolicyBl().hasPermission((User)Session["user"], "post_read")) {
				return HttpNotFound();
			}

			return View(new ListModel<Post>(postBl.getRecommendations()));
		}

		public ActionResult View(int id) {
			return View(postBl.get(id));
		}
	}
}