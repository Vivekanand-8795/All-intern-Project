using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace SoapAPI
{
    /// <summary>
    /// Summary description for WebService1
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class WebService1 : System.Web.Services.WebService
    {

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }
        [WebMethod]
        public DataTable get()
        {
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using(SqlConnection con = new SqlConnection(constr))
            {
                using(SqlCommand cmd=new SqlCommand("Select * from SoapApi", con))
                {
                    using(SqlDataAdapter sda=new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand=cmd;
                        using (DataTable dt = new DataTable())
                        {
                            dt.TableName ="Studentss";
                            sda.Fill(dt);
                            return dt;
                        }
                    }
                }
            }
        }
        [WebMethod]
        public string Insert(string Name, string Address)
        {
            string result = "";
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("INSERT INTO SoapApi (Name, Address) VALUES (@Name, @Address)", con))
                    {
                        cmd.Parameters.AddWithValue("@Name", Name);
                        cmd.Parameters.AddWithValue("@Address", Address);

                        con.Open();
                        cmd.ExecuteNonQuery();
                        result = "Data Inserted Successfully";
                    }
                }
            }
            catch (SqlException ex)
            {
                result = "Error inserting data: " + ex.Message;
            }
            return result;
        }

        [WebMethod]
        public string Update(string Name, string Address, int id)
        {
            string result = "";
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("Update SoapApi set Name=@Name, Address=@Address where id=@id", con))
                    {
                        cmd.Parameters.AddWithValue("@id", id);
                        cmd.Parameters.AddWithValue("@Name", Name);
                        cmd.Parameters.AddWithValue("@Address", Address);

                        con.Open();
                        cmd.ExecuteNonQuery();
                        result = "Data Updated Successfully";
                    }
                }
            }
            catch (SqlException ex)
            {
                result = "Error updating data: " + ex.Message;
            }
            return result;
        }
        [WebMethod]
        public string Delete(int id)
        {
            string result = "";
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("Delete from SoapApi where id=@id", con))
                    {
                        cmd.Parameters.AddWithValue("@id", id);

                        con.Open();
                        cmd.ExecuteNonQuery();
                        result = "Data Deleted Successfully";
                    }
                }
            }
            catch (SqlException ex)
            {
                result = "Error deleting data: " + ex.Message;
            }
            return result;
        }

    }
}
