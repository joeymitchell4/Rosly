using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Rosly.ViewModels
{
    public class InstructorFormViewModel
    {
        public int Id { get; set; }

        [Required]
        public string Email { get; set; }

        public string Fname { get; set; }

        public string Lname { get; set; }
    }
}