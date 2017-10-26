using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Rosly.Dtos
{
    public class CourseDto
    {
        [MaxLength(10)]
        public String CourseName { get; set; }
        public String Description { get; set; }
    }
}