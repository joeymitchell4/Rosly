using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Rosly.Models;

namespace Rosly.Repositories
{
    public class LocationRepository
    {
        private readonly RoslyDbEntities _db;

        public LocationRepository()
        {
            
        }

        public LocationRepository(RoslyDbEntities db)
        {
            _db = db;
        }

        public IEnumerable<Location> GetLocations()
        {
            return _db.Location.ToList();
        }
    }
}
