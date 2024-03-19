using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace eLearningProject
{
    public partial class Rough : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if the user is logged in
                if (UserIsLoggedIn())
                {
                    // Get user information (you would replace this with your logic to fetch user data)
                    string userName = GetUserName(); // Replace with your method to get user name
                    string userEmail = GetUserEmail(); // Replace with your method to get user email
                    string imageUrl = GetImageUrl(); // Replace with your method to get user image URL

                    // Set user name, email, and image
                    SetUserInfo(userName, userEmail, imageUrl);
                }
            }
        }
        protected void OnLogout(object sender, EventArgs e)
        {
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;

            using(SqlConnection con = new SqlConnection(constr))
            {
                using(SqlCommand cmd= new SqlCommand("Select * from eLearning", con))
                {
                    con.Open();
                    gveLearning.DataSource = cmd.ExecuteReader();
                    gveLearning.DataBind();
                    con.Close();
                }
            }
            Response.Redirect("Login1.aspx");
        }
        private bool UserIsLoggedIn()
        {
            // Implement your logic to check if the user is logged in
            // For example, you might check if a session variable or authentication cookie exists
            return true; // Replace with your actual logic
        }

        private string GetUserName()
        {
            string userName = "";

            // Replace "YourConnectionString" with your actual connection string
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT FirstName FROM eLearning WHERE Id = @UserId", con))
                {
                    // Replace "@UserId" with the actual parameter name and retrieve the user's ID
                    cmd.Parameters.AddWithValue("@UserId", "");

                    con.Open();
                    gveLearning.DataSource = cmd.ExecuteReader();
                    gveLearning.DataBind();
                    con.Close();
                }
            }

            return userName;
        }

        private string GetUserEmail()
        {
            string userEmail = "";

            // Replace "YourConnectionString" with your actual connection string
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT Email FROM eLearning WHERE Id = @UserId", con))
                {
                    // Replace "@UserId" with the actual parameter name and retrieve the user's ID
                    cmd.Parameters.AddWithValue("@UserId", "");

                    con.Open();
                    gveLearning.DataSource = cmd.ExecuteReader();
                    gveLearning.DataBind();
                    con.Close();
                }
            }

            return userEmail;
        }


        private string GetImageUrl()
        {
            // Implement your logic to get the user's image URL
            return "path/to/user/image.jpg"; // Replace with your actual logic
        }

        private void SetUserInfo(string userName, string userEmail, string imageUrl)
        {
            if (!string.IsNullOrEmpty(imageUrl))
            {
                // If the image URL is available, display the image
                img.ImageUrl = imageUrl;
            }
            else
            {
                // If the image URL is not available, display the first letter of the user's name
                char firstLetter = userName.FirstOrDefault();
                img.AlternateText = firstLetter.ToString(); // Set alt text for accessibility
                img.ImageUrl = $"https://via.placeholder.com/50?text={firstLetter}"; // Placeholder image with the first letter
            }

            // Display the user's name and email (you can customize this based on your layout)
            lblUserName.Text = userName;
            lblUserEmail.Text = userEmail;
        }


    }
}