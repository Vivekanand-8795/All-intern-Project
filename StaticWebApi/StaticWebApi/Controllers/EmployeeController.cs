using StaticWebApi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace StaticWebApi.Controllers
{
    public class EmployeeController : ApiController
    {
        public static List<Employee> Employees = new List<Employee>
        {
             new Employee{ id=1,Name="Nitesh" , Email="Nitesh123@gmail.com", City="Gorakhpur"},
             new Employee{ id=2,Name="Ramesh" , Email="Ramesh123@gmail.com", City="Jaunpur"},
             new Employee{ id=3,Name="Sumit" , Email="Sumit123@gmail.com", City="Khalilabad"},
             new Employee{ id=4,Name="Prashik" , Email="Prashik123@gmail.com", City="Mumbai"},
             new Employee{ id=5,Name="Chandresh" , Email="Chandresh123@gmail.com", City="Varanshi"},
        };
        //get:api/Employee
        public List<Employee> GetEmployees()
        {
            return Employees;
        }
        //get:api/Employee/id
        public Employee GetEmployees(int id)
        {
            return Employees.FirstOrDefault(e =>e.id == id);
        }
    }
}
