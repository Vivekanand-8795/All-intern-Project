using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace eLearningProject
{
    public partial class login1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string Email = txtLoginEmail.Text;
            string Password = txtLoginPassword.Text;
            if (string.IsNullOrEmpty(Email) || string.IsNullOrEmpty(Password))
            {
                lbl.Text = "Please fill in both email and password fields.";
            }
            else
            {
                string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constr))
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand("sp_elearning", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@Action", "Login");
                        cmd.Parameters.AddWithValue("@Email", Email);
                        cmd.Parameters.AddWithValue("@Password", Password);
                        SqlDataReader dr = cmd.ExecuteReader();
                        if (dr.Read())
                        {
                            string auth = dr["UserType"].ToString();
                            Session["email"] = dr["email"].ToString();
                            if (auth == "Admin")
                            {
                                Response.Redirect("Admin.aspx");
                            }
                            else if (auth == "Student")
                            {
                                Response.Redirect("Courses.aspx");
                            }
                            else if (auth == "Employee")
                            {
                                Response.Redirect("Courses.aspx");
                            }
                        }
                        else
                        {
                            lbl.Text = "Invalid email or password. Please try again.";
                        }
                    }
                }
            }
        }
    }
}