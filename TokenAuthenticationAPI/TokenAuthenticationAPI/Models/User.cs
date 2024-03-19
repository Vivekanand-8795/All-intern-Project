using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TokenAuthenticationAPI.Models
{
    public class User
    {
        public int id { get; set; }
        public string Name { get; set; }
        public string City { get; set; }
        public string Gender { get; set; }
        public string Password { get; set; }
    }
}