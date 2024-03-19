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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Signup_Click(object sender, EventArgs e)
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
                    using (SqlCommand cmd = new SqlCommand("SELECT * FROM eLearning WHERE Email = @Email AND Password = @Password", con))
                    {
                        cmd.Parameters.AddWithValue("@Email", Email);
                        cmd.Parameters.AddWithValue("@Password", Password);

                        SqlDataAdapter sda = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        if(dt.Rows.Count > 0) {
                            Response.Redirect("");
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