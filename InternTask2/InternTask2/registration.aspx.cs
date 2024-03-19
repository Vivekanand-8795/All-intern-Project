using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace InternTask2
{
    public partial class registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void OnSubmit(object sender, EventArgs e)
        {
            string name = txtName.Text;
            string email = txtEmail.Text;

            // Check if the user with the same name and email already exists in the database
            if (!UserExists(name, email))
            {
                string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("INSERT INTO RegistrationF (name, email, password, UserType, Gender) VALUES (@Name, @Email, @Password, @UserType, @Gender)", con))
                    {
                        cmd.Parameters.AddWithValue("@Name", name);
                        cmd.Parameters.AddWithValue("@Email", email);
                        cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
                        cmd.Parameters.AddWithValue("@UserType", ddlUserType.Text);
                        cmd.Parameters.AddWithValue("@Gender", ddlGender.Text);
                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }
                Response.Write("<script language='javascript'>window.alert('Your Registration SucessFully');</script>");
                string redirectScript = "setTimeout(function() { window.location.href = 'login.aspx'; }, 1000);";
                ClientScript.RegisterStartupScript(this.GetType(), "redirect", redirectScript, true);
            }
            else
            {
                // Display an alert indicating the user already exists
                string alertScript = "alert('User with the same name and email already exists. Please use different data.');";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", alertScript, true);
            }
        }

        private bool UserExists(string name, string email)
        {
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM RegistrationF WHERE name = @Name AND email = @Email", con))
                {
                    cmd.Parameters.AddWithValue("@Name", name);
                    cmd.Parameters.AddWithValue("@Email", email);
                    con.Open();
                    int count = (int)cmd.ExecuteScalar();
                    // If count is greater than 0, it means a user with the same name and email already exists
                    return count > 0;
                }
            }
        }

    }
}




//// Display an alert message using JavaScript
//string alertScript = "alert('Your Registration Successfully');";
//ClientScript.RegisterStartupScript(this.GetType(), "alert", alertScript, true);
////Response.Redirect("login.aspx");

//// Delay the redirection using JavaScript
//string redirectScript = "setTimeout(function() { window.location.href = 'login.aspx'; }, 1000);"; // Redirect after 1 seconds
//ClientScript.RegisterStartupScript(this.GetType(), "redirect", redirectScript, true);