using BusinessEntity;
using MyNews.Models;
using Security;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MyNews.Controllers
{
    public class AuthorizationController : Controller
    {
        PolicyBl policyBl = new PolicyBl();

        // GET: Authorization
        public ActionResult Index(string text)
        {
            if (!new PolicyBl().hasPermission((User)Session["user"], "admin_policies")) {
                return HttpNotFound();
            }

            return View(new ListModel<Role>(policyBl.getRoles(text)));
        }

        public ActionResult View(int id) {
            return View(policyBl.getRole(new Role { id = id }));
        }

        public ActionResult Create() {
            return View();
        }

        [HttpPost]
        public ActionResult CreateRole(string name, string[] policies) {
            Role role = new Role {
                name = name
            };

            foreach (string policy in policies) {
                role.policies.Add(new Policy { id = int.Parse(policy) });
            }

            int result = policyBl.create(role);
            return Json(new { type = "success", description = ((Dictionary<string, string>)Session["texts"])["success"], data = result }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult Update(int id) {
            return View(policyBl.getRole(new Role { id = id }));
        }

        public ActionResult Delete(int id) {
            if (id == 14) {
                return Json(new { type = "danger", description = ((Dictionary<string, string>)Session["texts"])["basic_role_delete"] }, JsonRequestBehavior.AllowGet);
            }

            if (policyBl.delete(id)) {
                return Json(new { type = "success", description = ((Dictionary<string, string>)Session["texts"])["success"] }, JsonRequestBehavior.AllowGet);
            } else {
                return Json(new { type = "danger", description = ((Dictionary<string, string>)Session["texts"])["error"] }, JsonRequestBehavior.AllowGet);
            }
        }

        [HttpPost]
        public ActionResult UpdateRole(int id, string name, string[] policies) {
            Role role = new Role {
                id= id,
                name = name
            };

            foreach (string policy in policies) {
                List<Policy> policyPermits = policyBl.getAllPermits(new Role { id = int.Parse(policy) });

                if (policyPermits.Any(p => p.id == role.id)) {
                    return Json(new { type = "danger", description = ((Dictionary<string, string>)Session["texts"])["circular_role"] }, JsonRequestBehavior.AllowGet);
                }
				role.policies.Add(new Policy { id = int.Parse(policy) });
            }

            policyBl.update(role);
            return Json(new { type = "success", description = ((Dictionary<string, string>)Session["texts"])["success"] }, JsonRequestBehavior.AllowGet);
        }
    }
}