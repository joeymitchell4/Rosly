using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Rosly.Models;

namespace Rosly.Repositories
{
    public class BusUnitRepository
    {
        private readonly RoslyDbEntities _db;

        public BusUnitRepository()
        {
            
        }

        public BusUnitRepository(RoslyDbEntities db)
        {
            _db = db;
        }

        public IEnumerable<BusUnit> GetBusUnits()
        {
            return _db.BusUnit.ToList();
        }
    }
}