using AuthenticationFlow.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace AuthenticationFlow.Controllers
{
    public class EmployeeController : ApiController
    {

        ApplicationDbContext dbContext = new ApplicationDbContext();

        //[Authorize(Roles = "User")]
        [Authorize]
        public HttpResponseMessage GetEmployeeById(int id)
        {
            var user = dbContext.Employees.FirstOrDefault(e => e.id == id);

            if (user != null)
            {
                return Request.CreateResponse(HttpStatusCode.OK, user);
            }
            else
            {
                return Request.CreateResponse(HttpStatusCode.NotFound, "Employee not found");
            }
        }
    }
}
