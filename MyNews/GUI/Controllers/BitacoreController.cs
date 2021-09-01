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
    public class BitacoreController : Controller
    {
        public ActionResult Index(string type = null, string from = null, string to = null)
        {
            if (!new PolicyBl().hasPermission((User)Session["user"], "admin_bitacore")) {
                return HttpNotFound();
            }

            BitacoreFilter filter = new BitacoreFilter {
                from = DateTime.Now.AddMonths(-1),
                type = type ?? null,
                to = DateTime.Now
            };

            DateTime value;
            if (DateTime.TryParse(from, out value)) {
                filter.from = value;
            }

            if (DateTime.TryParse(to, out value)) {
                filter.to = value;
            }

            return View(new ListModel<BitacoreMessage>(new BitacoreBl().get(filter)));
        }
    }
}