using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Validation;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Mime;
using System.Web.Http;
using Rosly.Dtos;
using Rosly.Models;
using Rosly.Repositories;
using Rosly.Services;
using Outlook =  Microsoft.Office.Interop.Outlook;

namespace Rosly.Controllers.Api
{
    public class CourseController : ApiController
    {
        private RoslyDbEntities _db;
        private CourseRepository _courseRepository;

        public CourseController()
        {
            _db = new RoslyDbEntities();
            _courseRepository = new CourseRepository(_db);
        }

        [HttpDelete]
        public IHttpActionResult Cancel(int id)
        {
            var course = _db.Schedule
                .Include(c => c.Enrollments.Select(e => e.Employee))
                .Single(c => c.id == id);

            if (course.is_canceled != null && course.is_canceled.Value)
                return NotFound();

            var scheduleService = new ScheduleService(course, _db);
            scheduleService.Cancel();

            _db.SaveChanges();

            return Ok();
        }

        [HttpPost]
        public IHttpActionResult Create(CourseDto dto)
        {
            var isExistingCourse = _courseRepository.DoesCourseExist(dto.CourseName);
            if (isExistingCourse)
                return NotFound();

            var course = new Course()
            {
                course_name = dto.CourseName,
                description = dto.Description
            };

            _db.Course.Add(course);

            _db.SaveChanges();

            return Ok();
        }
    }
}
