using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace StaticWebApi.Models
{
    public class Employee
    {
        public int id { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string City { get; set; }
    }
}