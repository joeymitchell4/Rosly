using System.Linq;
using System.Web.Mvc;
using Rosly.Models;

namespace Rosly.ViewModels
{
    public class LocationController : Controller
    {
        private static RoslyDbEntities _db;
        public LocationController()
        {
            _db = new RoslyDbEntities();
        }
        // GET: Location
        public ActionResult Index()
        {
            return View();
        }

        [Authorize]
        public ActionResult Create()
        {
            var viewModel = new LocationViewModel();
            return View(viewModel);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize]
        public ActionResult Create(LocationViewModel viewModel)
        {
            if (!ModelState.IsValid)
            {
                return View(viewModel);
            }

            if (_db.Location.Any(l => l.area == viewModel.Area))
                return HttpNotFound("This location already exists");

            var location = new Location
            {
                area = viewModel.Area
            };

            _db.Location.Add(location);
            _db.SaveChanges();

            return RedirectToAction("Index", "Courses");
        }
    }
}