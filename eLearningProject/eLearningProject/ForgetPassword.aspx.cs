using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Net;
using System.Net.Mail;
using System.Text;

namespace eLearningProject
{
    public partial class ForgetPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void OnPassword(object sender, EventArgs e)
        {
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            string newPassword = "";
            string oldPassword = "";
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("sp_elearning", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Action", "ForgateOnPassword");
                    cmd.Parameters.AddWithValue("@OldPwd", oldPassword);
                    cmd.Parameters.AddWithValue("@NewPassword", newPassword);
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                    con.Open();
                    SqlDataReader sdr = cmd.ExecuteReader();

                    if (sdr.Read())
                    {
                        string Email = sdr["Email"].ToString();
                        string Password = sdr["Password"].ToString();

                        // Generate a random password
                        string randomPassword = GenerateRandomPassword();
                        //save password in database
                        UpdatePassword(Email, randomPassword);

                        using (MailMessage mm = new MailMessage())
                        {
                            mm.From = new MailAddress("gvivekanand629@gmail.com");
                            mm.To.Add(txtEmail.Text);
                            mm.Subject = "Password Reset";
                            mm.Body = string.Format("Hello:<h1>{0}</h1> is your Email id <br /> Your New Password is <h1>{1}</h1>", Email, randomPassword);
                            mm.IsBodyHtml = true;

                            using (SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587))
                            {
                                smtp.Credentials = new NetworkCredential("gvivekanand629@gmail.com", "tzgd liur voap acey");
                                smtp.EnableSsl = true;

                                try
                                {
                                    smtp.Send(mm);
                                    lbl.Text = "Your password has been reset and sent to " + txtEmail.Text;
                                    lbl.ForeColor = Color.Green;
                                }
                                catch (Exception ex)
                                {
                                    lbl.Text = "Error sending email: " + ex.Message;
                                    lbl.ForeColor = Color.Red;

                                    if (ex.InnerException != null)
                                    {
                                        lbl.Text += "<br />Inner Exception: " + ex.InnerException.Message;
                                    }
                                }
                            }
                        }
                    }
                    else
                    {
                        lbl.Text = txtEmail.Text + " This email id does not exist in our database";
                        lbl.ForeColor = Color.Red;
                    }
                }
            } 
        }
        private void UpdatePassword(string email, string newPassword)
        {
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            string oldPassword = "";
            using (SqlConnection con = new SqlConnection(constr))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand("sp_elearning", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Action", "ForgateUpdate");
                    cmd.Parameters.AddWithValue("@NewPassword", newPassword);
                    cmd.Parameters.AddWithValue("@OldPwd", oldPassword);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.ExecuteNonQuery();
                }
            }
        }

        private string GenerateRandomPassword(int length = 8)
        {
            const string validChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
            StringBuilder password = new StringBuilder();
            Random random = new Random();

            while (0 < length--)
            {
                password.Append(validChars[random.Next(validChars.Length)]);
            }
            return password.ToString();
        }
    }
}
