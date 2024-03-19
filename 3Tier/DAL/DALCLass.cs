using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using BoNamespace;

namespace DAL
{
    public class DalClass
    {
        public void Insert(BoClass objBo) 
        {
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("INSERT INTO Reg (Name, Password, UserType) VALUES (@Name, @Password, @UserType)", con))
                {
                    cmd.Parameters.AddWithValue("@Name", objBo.Name);
                    cmd.Parameters.AddWithValue("@Password", objBo.Password);
                    cmd.Parameters.AddWithValue("@UserType", objBo.UserType);

                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }
    }
}

