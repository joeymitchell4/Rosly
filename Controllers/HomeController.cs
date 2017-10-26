using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
﻿using Rosly.Models;
using System.Data;



namespace Rosly.Controllers
{
    public class HomeController : Controller
    {
        private RoslyDbEntities db = new RoslyDbEntities();
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult Help()
        {
            ViewBag.Message = "FAQ";

            return View();
        }

        public ActionResult Export()
        {
            return View();
        }

    }
}
