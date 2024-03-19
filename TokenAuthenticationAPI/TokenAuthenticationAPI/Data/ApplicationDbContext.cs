using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using TokenAuthenticationAPI.Models;

namespace TokenAuthenticationAPI.Data
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext() :base("constr")
        {

        }
        public DbSet<User> Users { get; set; }
        public DbSet<Employee> Employees { get; set; }
    }
}