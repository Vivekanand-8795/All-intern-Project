using addMigration.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace addMigration.DataBaseHelper
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext() : base("constr")
        {
           
        }
        public DbSet<Employee> Employees { get; set; }
    }
}