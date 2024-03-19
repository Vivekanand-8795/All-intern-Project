using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using TokenAuthenticationAPI.Data;
using TokenAuthenticationAPI.Models;

namespace TokenAuthenticationAPI.Controllers
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

        //[Authorize(Roles = "Admin,SuperAdmin")]
        //[Route("api/Employee/GetSomeEmployees")]
        //public HttpResponseMessage GetSomeEmployees(int id)
        //{
        //    var User = dbContext.Employees.FirstOrDefault(e => e.id <= 10);
        //    return Request.CreateResponse(HttpStatusCode.OK, User);
        //}
        //[Authorize(Roles = "Admin")]
        //[Route("api/Employee/GetEmployees")]
        //public HttpResponseMessage GetEmployees(int id)
        //{
        //    var User = dbContext.Employees.ToList();
        //    return Request.CreateResponse(HttpStatusCode.OK, User);
        //}

    }
}


//using System.Linq;
//using System.Net;
//using System.Net.Http;
//using System.Web.Http;
//using TokenAuthenticationAPI.Data;
//using TokenAuthenticationAPI.Models;

//namespace TokenAuthenticationAPI.Controllers
//{
//    public class EmployeeController : ApiController
//    {
//        ApplicationDbContext dbContext = new ApplicationDbContext();

//        [Authorize(Roles = "User")]
//        public HttpResponseMessage GetEmployeeById(int id)
//        {
//            var user = dbContext.Employees.FirstOrDefault(e => e.id == id);

//            if (user != null)
//            {
//                return Request.CreateResponse(HttpStatusCode.OK, user);
//            }
//            else
//            {
//                return Request.CreateResponse(HttpStatusCode.NotFound, "Employee not found");
//            }
//        }

//        [Authorize(Roles = "Admin,SuperAdmin")]
//        [Route("api/Employee/GetSomeEmployees")]
//        public HttpResponseMessage GetSomeEmployees(int id)
//        {
//            var users = dbContext.Employees.Where(e => e.id <= id).ToList();

//            return Request.CreateResponse(HttpStatusCode.OK, users);
//        }

//        [Authorize(Roles = "Admin")]
//        [Route("api/Employee/GetEmployees")]
//        public HttpResponseMessage GetEmployees()
//        {
//            var users = dbContext.Employees.ToList();
//            return Request.CreateResponse(HttpStatusCode.OK, users);
//        }
//    }
//}
