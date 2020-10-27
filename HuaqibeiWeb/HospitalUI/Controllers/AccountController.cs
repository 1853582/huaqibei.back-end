using HuaqibeiDTO;
using HuaqibeiService;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HuaqibeiUI.Controllers
{
    public class AccountController : Controller
    {
        // GET: Account
        public ActionResult Index()
        {
            userService us = new userService();
            us.AddNew("0000000000000000005", "老张", "2001", 1);
            return View();
        }

    }
}