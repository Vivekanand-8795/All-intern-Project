using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace eLearningProject
{
    public partial class Rough1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            TextBox1.Text = DateTime.Now.ToString("dd/MM/yyyy");
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string enteredEmail = txtEmail.Text;
            string enteredPassword = txtPassword.Text;

            string newPassword = "";
            string oldPassword = "";

            // Handle empty email or password
            if (string.IsNullOrEmpty(enteredEmail) || string.IsNullOrEmpty(enteredPassword))
            {
                //lbl.Text = "Please fill in both email and password fields.";
                return;
            }

            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand("sp_elearning", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Action", "Login");
                    cmd.Parameters.AddWithValue("@Email", enteredEmail);
                    cmd.Parameters.AddWithValue("@Password", enteredPassword);
                    cmd.Parameters.AddWithValue("@OldPwd", oldPassword);
                    cmd.Parameters.AddWithValue("@NewPassword", newPassword);

                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        string auth = dr["UserType"].ToString();
                        Session["email"] = dr["email"].ToString();
                        if (auth == "Admin")
                        {
                            Response.Redirect("Admin.aspx");
                        }
                        else if (auth == "Student" || auth == "Employee")
                        {
                            Response.Redirect("Courses.aspx");
                        }
                    }
                    else
                    {
                        //lbl.Text = "Invalid email or password. Please try again.";
                    }
                }
            }

            // Continue with your existing authentication logic
            if (IsValidUser(enteredEmail, enteredPassword))
            {
                SetProfilePicture(enteredEmail);
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Login successful!');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Invalid email or password. Please try again.');", true);
            }
        }

        private bool IsValidUser(string email, string password)
        {
            // Replace this with your actual authentication logic
            // For simplicity, we'll consider any email and password as valid
            return true;
        }

        private void SetProfilePicture(string email)
        {
            // Replace this with logic to set the profile picture based on the email
            // Retrieve the image path from a database or another data source
            string imagePath = GetImagePathByEmail(email);

            // Set the ImageUrl property of the Image control
            imgProfile.ImageUrl = imagePath;
        }

        private string GetImagePathByEmail(string email)
        {
            // Replace this with your logic to get the image path based on the email
            // This can involve querying a database or using any other data source
            // For now, we'll use a placeholder path
            return "path_to_user_specific_image.jpg";
        }
    }
}
