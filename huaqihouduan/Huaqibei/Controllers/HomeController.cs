using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Huaqibei.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        public ActionResult Index()
        {
            return Json("OK");
        }

        public ActionResult Test()
        {
            return Json("OK");
        }
    }
}