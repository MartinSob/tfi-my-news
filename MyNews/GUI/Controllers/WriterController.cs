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
        ProbabilityBl probBl = new ProbabilityBl();

        public ActionResult Index(string text = null)
        {
            User loggedUser = (User)Session["user"];

            if (!new PolicyBl().hasPermission(loggedUser, "admin_tags")) {
				return HttpNotFound();
			}

            bool all = new PolicyBl().hasPermission(loggedUser, "admin_post");

			return View(new ListModel<Post>(pbl.get(ebl.getByUser(loggedUser).employeeId, text, all)));
        }

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

        public ActionResult UpdatePost(int id, string title, string body, string[] tags, string image = null) {
            Post post = new Post {
                id = id,
                title = title,
                body = body,
                image = image,
                employee = new Employee { employeeId = ebl.getByUser((User)Session["user"]).employeeId }
            };

            foreach (string tag in tags) {
                post.tags.Add(new Tag {
                    id = int.Parse(tag)
                });
            }

            pbl.update(post);

            new BitacoreBl().create(new BitacoreMessage {
                title = "Actualización Post",
                type = MessageType.Info,
                description = $"{((User)Session["user"]).username} ha modificado el post {id}",
                user = null
            });

            return Json(new { type = "success", description = ((Dictionary<string, string>)Session["texts"])["success"] }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult CreatePost(string title, string body, string[] tags, string image = null) {
            Post post = new Post {
                title = title,
                body = body,
                image = image,
                employee = new Employee { employeeId = ebl.getByUser((User)Session["user"]).employeeId }
            };

            foreach (string tag in tags) {
                post.tags.Add(new Tag {
                    id = int.Parse(tag)
                });
            }

            pbl.create(post);
            return Json(new { type = "success", description = ((Dictionary<string, string>)Session["texts"])["success"] }, JsonRequestBehavior.AllowGet);
        }

		public ActionResult GetProbability(string title, string body, string[] tags) {
			Post post = new Post {
				title = title,
				body = body,
				employee = new Employee { employeeId = ebl.getByUser((User)Session["user"]).employeeId }
			};

			foreach (string tag in tags) {
				post.tags.Add(new Tag {
					id = int.Parse(tag)
				});
			}

            Probability p = probBl.calculate(post);
			return Json(new { type = "success", description = ((Dictionary<string, string>)Session["texts"])["success"], data = p }, JsonRequestBehavior.AllowGet);
		}
	}
}