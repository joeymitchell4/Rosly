using System;
using Rosly.Models;

namespace Rosly.Dtos
{
    public class ScheduleDto
    {
        public int id { get; set; }
        public System.DateTime start_date { get; set; }
        public System.DateTime end_date { get; set; }
        public string area { get; set; }
        public int max_capacity { get; set; }
        public int num_of_students { get; set; }
        public bool? is_canceled { get; set; }
        public int course_id { get; set; }
        public int instructor_id { get; set; }
    }
}