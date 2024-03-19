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
    public partial class AdminRegistration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.BindGridView();
            }
        }
        private void BindGridView()
        {
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("sp_elearning", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Action", "Select");
                    con.Open();
                    gveLearning.DataSource = cmd.ExecuteReader();
                    gveLearning.DataBind();
                    con.Close();
                }
            }
        }
        protected void OnSubmit(object sender, EventArgs e)
        {
            string Email = txtEmail.Text.Trim();
            string Pan = txtPan.Text.Trim();
            string Uid = txtUid.Text.Trim();

            if (IsEmailexist(Email))
            {
                Response.Write("<script>alert('Email is already exist')</script>");
                return;
            }
            else if (IsPanexist(Pan))
            {
                Response.Write("<script>alert('Pan number is already exist')</script>");
                return;
            }
            else if (IsUidexist(Uid))
            {
                Response.Write("<script>alert('UID number is already exist')</script>");
                return;
            }

            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                if (!string.IsNullOrEmpty(txtFname.Text) || !string.IsNullOrEmpty(txtMname.Text) || !string.IsNullOrEmpty(txtLname.Text) || !string.IsNullOrEmpty(txtEmail.Text) || !string.IsNullOrEmpty(txtMobile.Text) || !string.IsNullOrEmpty(txtDateOfBirth.Text) || !string.IsNullOrEmpty(txtDate.Text) || !string.IsNullOrEmpty(txtCourses.Text) || !string.IsNullOrEmpty(txtZipCode.Text) || !string.IsNullOrEmpty(txtAddress.Text))
                {
                    using (SqlCommand cmd = new SqlCommand("sp_elearning", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@Action", "Registration");
                        cmd.Parameters.AddWithValue("@FirstName", txtFname.Text);
                        cmd.Parameters.AddWithValue("@MiddleName", txtMname.Text);
                        cmd.Parameters.AddWithValue("@LastName", txtLname.Text);
                        cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                        cmd.Parameters.AddWithValue("@Uid", txtUid.Text);
                        cmd.Parameters.AddWithValue("@Pan", txtPan.Text);
                        cmd.Parameters.AddWithValue("@Mobile", txtMobile.Text);
                        cmd.Parameters.AddWithValue("@DateOfBirth", txtDateOfBirth.Text);
                        cmd.Parameters.AddWithValue("@RegistrationDate", txtDate.Text);
                        cmd.Parameters.AddWithValue("@Courses", txtCourses.Text);
                        cmd.Parameters.AddWithValue("@ZipCode", txtZipCode.Text);
                        cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
                        cmd.Parameters.AddWithValue("@UserType", ddlUserType.Text);
                        cmd.Parameters.AddWithValue("@Gender", ddlGender.Text);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }
            }


            //string script = @"alert('Registration Successful!');";
            //ClientScript.RegisterStartupScript(this.GetType(), "registrationAlert", script, true);
            string script = @"alert('Registration Successful!');
                    setTimeout(function() {
                        window.location.href = 'Login1.aspx';
                    }, 1000);";
            ClientScript.RegisterStartupScript(this.GetType(), "redirect", script, true);
            this.BindGridView();
            txtFname.Text = "";
            txtMname.Text = "";
            txtLname.Text = "";
            txtEmail.Text = "";
            txtUid.Text = "";
            txtPan.Text = "";
            txtMobile.Text = "";
            txtDateOfBirth.Text = "";
            txtDate.Text = "";
            txtCourses.Text = "";
            txtZipCode.Text = "";
            txtAddress.Text = "";

        }

        public bool IsEmailexist(string Email)
        {
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            con.Open();
            SqlCommand cmd = new SqlCommand("select count(*) from eLearning", con);
            cmd.Parameters.AddWithValue("@Email", Email);
            int count = Convert.ToInt32(cmd.ExecuteScalar());
            con.Close();
            return count > 0;
        }
        public bool IsPanexist(string Pan)
        {
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            con.Open();
            SqlCommand cmd = new SqlCommand("select count(*) from eLearning", con);
            cmd.Parameters.AddWithValue("@Pan", Pan);
            int count = Convert.ToInt32(cmd.ExecuteScalar());
            con.Close();
            return count > 0;
        }
        public bool IsUidexist(string Uid)
        {
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            con.Open();
            SqlCommand cmd = new SqlCommand("select count(*) from eLearning", con);
            cmd.Parameters.AddWithValue("@Uid", Uid);
            int count = Convert.ToInt32(cmd.ExecuteScalar());
            con.Close();
            return count > 0;
        }
    }
}
