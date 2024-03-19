using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using RestApi_Crud_Demo.Model;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

[Route("api/[controller]")]
[ApiController]
public class EmpController : ControllerBase
{
    private readonly EmpDBContext _context;

    public EmpController(EmpDBContext context)
    {
        this._context = context;
    }

    // GET: api/Emp
    [HttpGet]
    public async Task<ActionResult> GetEmployees()
    {
        var employees = await _context.Empsdetails.ToListAsync();
        return Ok(employees);
    }


    // GET: api/Emp/5
    [HttpGet("{id}")]
    public async Task<ActionResult> GetEmployee(int id)
    {
        var employee = await _context.Empsdetails.FindAsync(id);

        if (employee == null)
        {
            return NotFound();
        }

        return Ok(employee);
    }

    // POST: api/Emp
    [HttpPost]
    public async Task<ActionResult<Emp>> PostEmployee(Emp employee)
    {
        _context.Empsdetails.Add(employee);
        await _context.SaveChangesAsync();

        return CreatedAtAction(nameof(GetEmployee), new { id = employee.Id }, employee);
    }

    // PUT: api/Emp/5
    [HttpPut("{id}")]
    public async Task<IActionResult> PutEmployee(int id, Emp employee)
    {
        if (id != employee.Id)
        {
            return BadRequest();
        }

        _context.Entry(employee).State = EntityState.Modified;

        try
        {
            await _context.SaveChangesAsync();
        }
        catch (DbUpdateConcurrencyException)
        {
            if (!EmployeeExists(id))
            {
                return NotFound();
            }
            else
            {
                throw;
            }
        }

        return NoContent();
    }

    // DELETE: api/Emp/5
    [HttpDelete("{id}")]
    public async Task<IActionResult> DeleteEmployee(int id)
    {
        var employee = await _context.Empsdetails.FindAsync(id);
        if (employee == null)
        {
            return NotFound();
        }

        _context.Empsdetails.Remove(employee);
        await _context.SaveChangesAsync();

        return NoContent();
    }

    private bool EmployeeExists(int id)
    {
        return _context. Empsdetails.Any(e => e.Id == id);
    }
}
