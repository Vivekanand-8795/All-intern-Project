using AuthenticationFlow.Data;
using AuthenticationFlow.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AuthenticationFlow.Repositry
{
    public class UserRepo : IDisposable
    {
        ApplicationDbContext dbContext = new ApplicationDbContext();
        public User ValidateUser(string name, string Password)
        {
            return dbContext.Users.FirstOrDefault(user => user.Name.Equals(name, StringComparison.OrdinalIgnoreCase) && user.Password == Password);
        }
        public void Dispose()
        {
            dbContext.Dispose();
        }
    }
}