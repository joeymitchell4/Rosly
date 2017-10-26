using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Rosly.Models;
using Rosly.Repositories;
using Rosly.ViewModels;

namespace Rosly.Controllers
{
    public class InstructorController : Controller
    {
        private readonly RoslyDbEntities _db;
        private readonly InstructorRepository _instructorRepository;

        public InstructorController()
        {
            _db = new RoslyDbEntities();
            _instructorRepository = new InstructorRepository(_db);
        }

        // GET: Instructor
        public ActionResult Index()
        {
            var instructors = _instructorRepository.GetInstructors();

            return View("Index", instructors);
        }

        [Authorize]
        public ActionResult Create()
        {
            var viewModel = new InstructorFormViewModel()
            {

            };

            return PartialView("CreateModalView", viewModel);
        }


    }
}