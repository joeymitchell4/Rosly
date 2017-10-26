using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using AutoMapper;
using Rosly.Dtos;
using Rosly.Models;
using Rosly.Services;

namespace Rosly.Controllers.Api
{
    public class ScheduleController : ApiController
    {
        private RoslyDbEntities db;

        public ScheduleController()
        {
            db = new RoslyDbEntities();
        }

        [HttpPost]
        public IEnumerable<ScheduleDto> ScheduledCourses(ScheduleDashboardDto dto)
        {
            var schedule = db.Schedule
                .Include(c => c.Enrollments.Select(e => e.Employee))
                .ToList();

            schedule = GetWhereClause(dto, schedule);

            return schedule.Select(Mapper.Map<Schedule, ScheduleDto>);
        }

        private List<Schedule> GetWhereClause(ScheduleDashboardDto dto, List<Schedule> schedule)
        {
            if (dto.Area == "" && dto.CourseName == "")
                return schedule;

            if (dto.Area != "" && dto.CourseName == "")
                return schedule.Where(s => s.area.Contains(dto.Area)).ToList();

            if (dto.Area != "" && dto.CourseName != "")
                return schedule
                    .Where(s => s.area.Contains(dto.Area)
                                && s.Course.course_name == dto.CourseName)
                                .ToList();
            return schedule
                .Where(s => s.Course.course_name == dto.CourseName)
                .ToList();
        }

        [HttpDelete]
        public IHttpActionResult Cancel(int id)
        {
            var course = db.Schedule
                .Include(c => c.Enrollments.Select(e => e.Employee))
                .Single(c => c.id == id);

            if (course.is_canceled != null && course.is_canceled.Value)
                return NotFound();

            var service = new ScheduleService(course, db);
            service.Cancel();

            db.SaveChanges();

            return Ok();
        }
    }
}
