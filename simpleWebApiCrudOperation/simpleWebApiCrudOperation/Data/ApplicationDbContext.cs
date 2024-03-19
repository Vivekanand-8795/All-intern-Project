using simpleWebApiCrudOperation.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace simpleWebApiCrudOperation.Data
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext() : base("constr") { }
        public DbSet<StudentDetails> Student { get; set; }
    }
}