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
            BitacoreFilter filter = new BitacoreFilter {
                from = DateTime.Now.AddMonths(-1),
                to = DateTime.Now
            };

            try {
                filter.from = from == null ? DateTime.Now.AddMonths(-1) : Convert.ToDateTime(from);
                filter.type = type ?? null;
                filter.to = to == null ? DateTime.Now : Convert.ToDateTime(to);
            } catch (Exception e) { }

            return View(new ListModel<BitacoreMessage>(new BitacoreBl().get(filter)));
        }
    }
}