using CrudOperation.Model;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace CrudOperation.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EmpController : ControllerBase
    {
        private readonly EmpContext _dbContext;
        public EmpController(EmpContext dbContext)
        {
            _dbContext = dbContext;
        }
        [HttpGet]
        public async Task<ActionResult> GetEmp()
        {
            var Emp = await _dbContext.EmployeeSS.ToListAsync();
            if (Emp == null)
            {
                return NotFound();
            }
            return Ok(Emp);
        }
        [HttpGet("{id}")]
        public async Task<ActionResult> GetEmp(int id)
        {
            var Emp = await _dbContext.EmployeeSS.FindAsync(id);
            if (Emp == null)
            {
                return NotFound();
            }
            return Ok(Emp);
        }
        [HttpPost]
        public async Task<ActionResult<Emp>> PostEmp([FromBody] Emp Emp)
        {
            if (Emp == null)
            {
                return BadRequest("Emp data is null");
            }

            _dbContext.EmployeeSS.Add(Emp);
            await _dbContext.SaveChangesAsync();

            return Created($"/id/{Emp.id}", Emp);
        }

      
        [HttpPut]
        public async Task<IActionResult> PutEmp(Emp Emp)
        {
            _dbContext.EmployeeSS.Update(Emp);
            await _dbContext.SaveChangesAsync();
            return NoContent();
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteStudent(int id)
        {
            var Emp = await _dbContext.EmployeeSS.FindAsync(id);
            if (Emp == null)
            {
                return NotFound();
            }

            _dbContext.EmployeeSS.Remove(Emp);
            await _dbContext.SaveChangesAsync();

            return NoContent();
        }
    }
}
