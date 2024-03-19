using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using RestApiTest.Model;

namespace RestApiTest.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CustomerController : ControllerBase
    {
        private readonly CustomerContext _dbContext;
        public CustomerController(CustomerContext dbContext)
        {
            _dbContext = dbContext;
        }
        [HttpGet]
        public async Task<ActionResult> GetCustomer()
        {
            var Customer = await _dbContext.Customer.ToListAsync();
            return Ok(Customer);
        }
        // GET: api/Student/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Customer>> GetStudent(int id)
        {
            var Customer = await _dbContext.Customer.FindAsync(id);

            if (Customer == null)
            {
                return NotFound();
            }

            return Ok(Customer);
        }

        // POST: api/Student
        [HttpPost]
        public async Task<ActionResult<Customer>> PostStudent([FromBody] Customer Customer)
        {
            if (Customer == null)
            {
                return BadRequest("Student data is null");
            }

            _dbContext.Customer.Add(Customer);
            await _dbContext.SaveChangesAsync();
            return Ok(Customer);
            //return Created($"/id/{Customer.id}", Customer);
        }

        // PUT: api/Student/5
        [HttpPut]
        public async Task<IActionResult> PutStudent(Customer Customer)
        {
            _dbContext.Customer.Update(Customer);
            await _dbContext.SaveChangesAsync();
            return NoContent();
        }

        // DELETE: api/Student/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteCustomer(int id)
        {
            var Customer = await _dbContext.Customer.FindAsync(id);
            if (Customer == null)
            {
                return NotFound();
            }

            _dbContext.Customer.Remove(Customer);
            await _dbContext.SaveChangesAsync();

            return NoContent();
        }
    }
}
