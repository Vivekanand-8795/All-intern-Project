using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using RestApi_crud.Model;

namespace RestApi_crud.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class StudentController : ControllerBase
    {
        private readonly StudentContext _dbContext;

        public StudentController(StudentContext dbContext)
        {
            _dbContext = dbContext;
        }
        [HttpGet]
        public async Task<ActionResult> GetStudents()
        {
            var std = await _dbContext.Studentss.ToListAsync();
            if (std == null)
            {
                return NotFound();
            }
            return Ok(std);
        }
        // GET: api/Student/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Student>> GetStudent(int id)
        {
            var student = await _dbContext.Studentss.FindAsync(id);

            if (student == null)
            {
                return NotFound();
            }

            return Ok(student);
        }

        // POST: api/Student
        [HttpPost]
        public async Task<ActionResult<Student>> PostStudent([FromBody] Student student)
        {
            if (student == null)
            {
                return BadRequest("Student data is null");
            }

            _dbContext.Studentss.Add(student);
            await _dbContext.SaveChangesAsync();

            return Created($"/id/{student.id}", student);
        }

        // PUT: api/Student/5
        [HttpPut]
        public async Task<IActionResult> PutStudent( Student student)
        {
            _dbContext.Studentss.Update(student);
            await _dbContext.SaveChangesAsync();
            return NoContent();
        }

        // DELETE: api/Student/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteStudent(int id)
        {
            var student = await _dbContext.Studentss.FindAsync(id);
            if (student == null)
            {
                return NotFound();
            }

            _dbContext.Studentss.Remove(student);
            await _dbContext.SaveChangesAsync();

            return NoContent();
        }

       

    }
}
