using AuthenticationFlow.Data;
using AuthenticationFlow.Models;
using AuthenticationFlow.Repositry;
using Microsoft.Owin.Security.OAuth;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using System.Web;

namespace AuthenticationFlow.Provider
{
    public class AuthorizationServerProvider : OAuthAuthorizationServerProvider
    {
        public override async Task ValidateClientAuthentication(OAuthValidateClientAuthenticationContext context)
        {
            context.Validated();
        }
        //public override async Task GrantResourceOwnerCredentials(OAuthGrantResourceOwnerCredentialsContext context)
        //{
        //    using (UserRepo repo = new UserRepo())
        //    {
        //        var user = repo.ValidateUser(context.UserName, context.Password);
        //        if (user == null)
        //        {
        //            context.SetError("Invalid_Grant", "UserName or Password is incorrect");
        //            return;
        //        }
        //        var identity = new ClaimsIdentity(context.Options.AuthenticationType);
        //        identity.AddClaim(new Claim(ClaimTypes.Name, user.Name));
        //        identity.AddClaim(new Claim(ClaimTypes.Email, user.Email));
        //        context.Validated(identity);
        //    }
        //}

        public override async Task GrantResourceOwnerCredentials(OAuthGrantResourceOwnerCredentialsContext context)
        {
            //using (UserRepo repo = new UserRepo())
            //{
            //    var user = repo.ValidateUser(context.UserName, context.Password);
            //    if (user == null)
            //    {
            //        // Log the error in the database
            //        LogErrorInDatabase("Invalid_Grant", "Invalid credentials");

            //        if (string.IsNullOrEmpty(context.UserName))
            //        {
            //            context.SetError("Invalid_Grant", "Username is required");
            //        }
            //        else if (string.IsNullOrEmpty(context.Password))
            //        {
            //            context.SetError("Invalid_Grant", "Password is required");
            //        }
            //        else
            //        {
            //            context.SetError("Invalid_Grant", "Invalid username or password");
            //        }
            //        return;
            //    }

            //    var identity = new ClaimsIdentity(context.Options.AuthenticationType);
            //    identity.AddClaim(new Claim(ClaimTypes.Name, user.Name));
            //    context.Validated(identity);
            //}

            using (ApplicationDbContext dbContext = new ApplicationDbContext())
            {
                var user = dbContext.Users.FirstOrDefault(u => u.Name == context.UserName);

                if (user == null)
                {
                    // Log the error in the database
                    LogErrorInDatabase("Invalid_Grant", "Username is incorrect");
                    context.SetError("Invalid_Grant", "Username is incorrect");
                    return;
                }

                // Check if the password is correct
                if (user.Password != context.Password)
                {
                    // Log the error in the database
                    LogErrorInDatabase("Invalid_Grant", "Password is incorrect");
                    context.SetError("Invalid_Grant", "Password is incorrect");
                    return;
                }

                // Continue with the rest of your authentication logic if the user is found
                var identity = new ClaimsIdentity(context.Options.AuthenticationType);
                identity.AddClaim(new Claim(ClaimTypes.Name, user.Name));
                context.Validated(identity);
            }

        }

        private void LogErrorInDatabase(string errorCode, string errorMessage)
        {
            // You can implement your database logging logic here
            // For example, you might have a 'ErrorLog' table in your database

            //using (var dbContext = new ApplicationDbContext())
            //{
            //    var errorLog = new ErrorLog
            //    {
            //        ErrorCode = errorCode,
            //        ErrorMessage = errorMessage,
            //        Timestamp = DateTime.UtcNow
            //    };

            //    dbContext.ErrorLogs.Add(errorLog);
            //    dbContext.SaveChanges();
            //}

            try
            {
                using (var dbContext = new ApplicationDbContext())
                {
                    var errorLog = new ErrorLog
                    {
                        ErrorCode = errorCode,  
                        ErrorMessage = errorMessage, 
                        Timestamp = DateTime.UtcNow
                    };

                    dbContext.ErrorLogs.Add(errorLog);
                    dbContext.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error logging to database: {ex.Message}");
                Console.WriteLine($"Exception Details: {ex}");
            }

        }

    }
}