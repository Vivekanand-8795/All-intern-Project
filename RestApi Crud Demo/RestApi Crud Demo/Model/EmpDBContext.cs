using Microsoft.EntityFrameworkCore;

namespace RestApi_Crud_Demo.Model
{
    public class EmpDBContext : DbContext
    {
        public EmpDBContext(DbContextOptions<EmpDBContext> options) : base(options)
        {

        }
       public DbSet<Emp> Empsdetails { get; set;}
    }
}
