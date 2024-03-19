using Microsoft.EntityFrameworkCore;

namespace CrudOperation.Model
{
    public class EmpContext : DbContext
    {
        public EmpContext(DbContextOptions<EmpContext>Options) : base(Options)
        {

        }
        public DbSet<Emp> EmployeeSS { get; set; }
    }
}
