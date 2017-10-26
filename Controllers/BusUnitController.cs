using System.Linq;
using System.Web.Mvc;
using Rosly.Models;
using Rosly.ViewModels;

namespace Rosly.Controllers
{
    public class BusUnitController : Controller
    {
        private static RoslyDbEntities _db;
        public BusUnitController()
        {
            _db = new RoslyDbEntities();
        }
        // GET: BusUnit
        public ActionResult Index()
        {
            return View();
        }

        [Authorize]
        public ActionResult Create()
        {
            var viewModel = new BusUnitViewModel();
            return View(viewModel);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize]
        public ActionResult Create(BusUnitViewModel viewModel)
        {
            if (!ModelState.IsValid)
            {
                return View(viewModel);
            }

            if (_db.BusUnit.Any(l => l.name == viewModel.Name))
                return HttpNotFound("This location already exists");

            var location = new Location
            {
                area = viewModel.Name
            };

            _db.Location.Add(location);
            _db.SaveChanges();

            return RedirectToAction("Index", "Courses");
        }
    }
}