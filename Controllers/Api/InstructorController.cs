using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Rosly.Dtos;
using Rosly.Models;
using Rosly.Repositories;
using Rosly.ViewModels;

namespace Rosly.Controllers.Api
{
    public class InstructorController : ApiController
    {
        private RoslyDbEntities _db;
        private InstructorRepository _instructorRepository;

        public InstructorController()
        {
            _db = new RoslyDbEntities();
            _instructorRepository = new InstructorRepository(_db);
        }

        [HttpPost]
        public IHttpActionResult Create(InstructorFormViewModel dto)
        {
            var isExistingInstructor = _instructorRepository.DoesInstructorExist(dto.Email);
            if (isExistingInstructor)
                return NotFound();

            var instructor = new Instructor()
            {
                email = dto.Email,
                fname = dto.Fname,
                lname = dto.Lname
            };

            _db.Instructor.Add(instructor);

            _db.SaveChanges();

            return Ok();
        }
    }
}
