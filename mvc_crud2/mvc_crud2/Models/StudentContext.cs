using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace mvc_crud2.Models
{
    public class StudentContext :DbContext
    {
        public DbSet<Student> Students { get; set; }
    }
}