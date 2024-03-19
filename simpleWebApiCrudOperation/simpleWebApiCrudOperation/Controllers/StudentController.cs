using simpleWebApiCrudOperation.Data;
using simpleWebApiCrudOperation.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace simpleWebApiCrudOperation.Controllers
{
    public class StudentController : ApiController
    {
        //get:api/Student
        public HttpResponseMessage GetStudent()
        {
            using (ApplicationDbContext dbContext = new ApplicationDbContext())
            {
                return Request.CreateResponse(HttpStatusCode.OK, dbContext.Student.ToList());
            }
        }
        //get:api/Student/id
        public HttpResponseMessage GetStudent(int id)
        {
            using (ApplicationDbContext dbContext = new ApplicationDbContext())
            {
                var student=dbContext .Student.FirstOrDefault(s=>s.Id == id);
                if (student != null)
                {
                    return Request.CreateResponse(HttpStatusCode.OK,student);
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.NotFound);
                } 
            }
        }
        //post:api/Student/id
        public HttpResponseMessage post(StudentDetails student)
        {
            using (ApplicationDbContext dbContext = new ApplicationDbContext())
            {
                if (student != null)
                {
                    dbContext.Student.Add(student);
                    dbContext.SaveChanges();
                    return Request.CreateResponse(HttpStatusCode.Created, student);
                }
                else
                {
                    return Request.CreateErrorResponse(HttpStatusCode.BadRequest, "Please provide proper input data to create in student");
                }
            }
        }
        public HttpResponseMessage put(int id, StudentDetails student)
        {
            using (ApplicationDbContext dbContext = new ApplicationDbContext())
            {
                var students = dbContext.Student.FirstOrDefault(e => e.Id == id);
                if (student != null)
                {
                    students.Name = student.Name;
                    students.City = student.City;
                    students.Email = student.Email;
                    dbContext.SaveChanges();
                    return Request.CreateResponse(HttpStatusCode.OK, students);
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.NotFound);
                }

            }
        }
        public HttpResponseMessage delete(int id)
        {
            using (ApplicationDbContext dbContext = new ApplicationDbContext())
            {
                var students = dbContext.Student.FirstOrDefault(e => e.Id == id);
                if (students != null)
                {
                    dbContext.Student.Remove(students);
                    dbContext.SaveChanges();
                    return Request.CreateResponse(HttpStatusCode.OK, students);
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.NotFound);
                }
            }
        }
    }
}
