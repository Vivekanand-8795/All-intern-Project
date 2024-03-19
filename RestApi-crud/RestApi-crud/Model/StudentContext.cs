using Microsoft.EntityFrameworkCore;

namespace RestApi_crud.Model
{
    public class StudentContext : DbContext
    {
        public StudentContext(DbContextOptions<StudentContext> options) : base(options)
        {

        }
        public DbSet<Student> Studentss { get; set;}
    }
}
