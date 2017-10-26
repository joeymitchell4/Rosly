using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Mvc;
using AutoMapper;
using Rosly.Dtos;
using Rosly.Models;

namespace Rosly.Controllers.Api
{
    public class DashboardController : ApiController
    {
        private RoslyDbEntities db;

        public DashboardController()
        {
            db = new RoslyDbEntities();
        }

        
        public IEnumerable<ScheduleDto> GetScheduledCourses()
        {
            var schedule = db.Schedule.ToList();

            return schedule.Select(Mapper.Map<Schedule, ScheduleDto>);
        }

    }
}
