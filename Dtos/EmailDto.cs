using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Rosly.Models;

namespace Rosly.Dtos
{
    public class EmailDto
    {
        public string Email { get; set; }
        public string Subject { get; set; }
        public string Body { get; set; }
        public UserNotification UserNotification { get; set; }
    }
}