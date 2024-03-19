using Bol;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dal
{
    public class DalClass
    {
        public void Insert(BolClass objBol)
        {
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("INSERT INTO Reg (Name, Password, UserType) VALUES (@Name, @Password, @UserType)", con))
                {
                    cmd.Parameters.AddWithValue("@Name", objBol.Name);
                    cmd.Parameters.AddWithValue("@Password", objBol.Password);
                    cmd.Parameters.AddWithValue("@UserType", objBol.UserType);
                    con.Open();     
                    cmd.ExecuteNonQuery();
                }
            }
        }
        public void Update(BolClass objBol)
        {
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Update Reg set Name=@Name, Password=@Password, UserType=@UserType where Id=@Id", con))
                {
                    cmd.Parameters.AddWithValue("@Id", objBol.Id);
                    cmd.Parameters.AddWithValue("@Name", objBol.Name);
                    cmd.Parameters.AddWithValue("@Password", objBol.Password);
                    cmd.Parameters.AddWithValue("@UserType", objBol.UserType);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }

    }
}
