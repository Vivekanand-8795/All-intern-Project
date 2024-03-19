using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace eLearningProject
{
    public partial class ChangePwd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void OnSet(object sender, EventArgs e)
        {
            string oldPassword = txtOldPwd.Text;
            string newPassword = txtNewPwd.Text;
            string confirmPassword = txtCnfPwd.Text;
            if (newPassword != confirmPassword)
            {
                ShowAlert("New password and confirm password do not match.");
                return;
            }

            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                 using (SqlCommand cmd = new SqlCommand("sp_elearning", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Action", "ChangePassword");
                    cmd.Parameters.AddWithValue("@OldPwd", oldPassword);
                    cmd.Parameters.AddWithValue("@NewPassword", newPassword);

                    try
                    {
                        con.Open();
                        int rowsAffected = cmd.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            ShowAlert("Password changed successfully.");
                            //javaScript redirect nextPage
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "redirectScript", "setTimeout(function() { window.location.href = 'login1.aspx'; }, 1000);", true);
                        }
                        else
                        {
                            ShowAlert("Old password incorrect. Password not changed.");
                        }
                    }
                    // catch (Exception ex) thisfirst use ;
                    catch (Exception)
                    {
                        ShowAlert("An error occurred while changing the password. Please try again later.");
                    }
                }
            }
        }

        private void ShowAlert(string message)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", $"alert('{message}');", true);
        }

    }
}