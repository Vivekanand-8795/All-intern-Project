using AuthenticationFlow.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace AuthenticationFlow.Data
{
    public class ApplicationDbContext : DbContext
    {
        
        public ApplicationDbContext() : base("constr") {  }
        public DbSet<User> Users { get; set; }
        public DbSet<Employee> Employees { get; set; }
        public DbSet<ErrorLog> ErrorLogs { get; set; }
    }
}