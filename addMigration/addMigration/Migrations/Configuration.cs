namespace addMigration.Migrations
{
    using addMigration.Models;
    using System;
    using System.Collections.Generic;
    using System.Data.Entity;
    using System.Data.Entity.Migrations;
    using System.Linq;

    internal sealed class Configuration : DbMigrationsConfiguration<addMigration.DataBaseHelper.ApplicationDbContext>
    {
        public Configuration()
        {
            AutomaticMigrationsEnabled = false;
        }

        protected override void Seed(addMigration.DataBaseHelper.ApplicationDbContext context)
        {
            //  This method will be called after migrating to the latest version.

            //  You can use the DbSet<T>.AddOrUpdate() helper extension method
            //  to avoid creating duplicate seed data.

            var Employees = new List<Employee>
            {
                new Employee{Name="Rohan",city="Gorakhpur",Gender="Male" },
                 new Employee{Name="Shyam",city="Lucknow",Gender="Male" },
                  new Employee{Name="Ram",city="Ayodhya",Gender="Male" },
                   new Employee{Name="Shailesh",city="Malad",Gender="Male" }
            };
            Employees.ForEach(e => context.Employees.AddOrUpdate(e));
            context.SaveChanges();
        }
    }
}
