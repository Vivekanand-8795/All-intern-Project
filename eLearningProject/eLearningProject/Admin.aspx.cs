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
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {

                this.BindGridView();
                //Response.Cache.SetCacheability(HttpCacheability.NoCache);
                //Response.Cache.SetNoStore();
                //if (Session["Admin"] != null && (bool)Session["Admin"])
                //{
                //    Session["Admin"] = null;
                //    System.Threading.Thread.Sleep(1000);
                //    Response.Redirect("Courses.aspx");
                //}
                //else
                //{
                //    Session["Admin"] = true;
                //}


            }

        }


        private void BindGridView()
        {
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("select * from eLearning", con))
                {
                    con.Open();
                    gveLearning.DataSource = cmd.ExecuteReader();
                    gveLearning.DataBind();
                    con.Close();
                }
            }
        }

        protected void OnRowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gveLearning.EditIndex = -1;
            this.BindGridView();
        }
        protected void OnRowEditing(object sender, GridViewEditEventArgs e)
        {
            gveLearning.EditIndex = e.NewEditIndex;
            this.BindGridView();
        }
        protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int Id = Convert.ToInt32(gveLearning.DataKeys[e.RowIndex].Values[0]);
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("sp_elearning", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Action", "Delete");
                    cmd.Parameters.AddWithValue("@Id", Id);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            this.BindGridView();
        }
        protected void OnRowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = gveLearning.Rows[e.RowIndex];
            int id = Convert.ToInt32(gveLearning.DataKeys[e.RowIndex].Values[0]);
            string Fname = (row.FindControl("txtFname") as TextBox).Text;
            string Mname = (row.FindControl("txtMname") as TextBox).Text;
            string Lname = (row.FindControl("txtLname") as TextBox).Text;
            string Email = (row.FindControl("txtEmail") as TextBox).Text;
            string Uid = (row.FindControl("txtUid") as TextBox).Text;
            string Pan = (row.FindControl("txtPan") as TextBox).Text;
            string Mobile = (row.FindControl("txtMobile") as TextBox).Text;
            string DateOfBirth = (row.FindControl("txtDOB") as TextBox).Text;
            string RegistrationDate = (row.FindControl("txtRegistrationDate") as TextBox).Text;
            string Courses = (row.FindControl("txtCourses") as TextBox).Text;
            string ZipCode = (row.FindControl("txtZipCode") as TextBox).Text;
            string Address = (row.FindControl("txtAddress") as TextBox).Text;
            string Password = (row.FindControl("txtPassword") as TextBox).Text;
            string UserType = (row.FindControl("ddlUserType") as DropDownList).Text;
            string Gender = (row.FindControl("ddlGender") as DropDownList).Text;
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("sp_elearning", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Action", "Update");
                    cmd.Parameters.AddWithValue("@Id", id);
                    cmd.Parameters.AddWithValue("@FirstName", Fname);
                    cmd.Parameters.AddWithValue("@MiddleName", Mname);
                    cmd.Parameters.AddWithValue("@LastName", Lname);
                    cmd.Parameters.AddWithValue("@Email", Email);
                    cmd.Parameters.AddWithValue("@Uid", Uid);
                    cmd.Parameters.AddWithValue("@Pan", Pan);
                    cmd.Parameters.AddWithValue("@Mobile", Mobile);
                    cmd.Parameters.AddWithValue("@DateOfBirth", DateTime.Parse(DateOfBirth));
                    cmd.Parameters.AddWithValue("@RegistrationDate", DateTime.Parse(RegistrationDate));
                    cmd.Parameters.AddWithValue("@Courses", Courses);
                    cmd.Parameters.AddWithValue("@ZipCode", ZipCode);
                    cmd.Parameters.AddWithValue("@Address", Address);
                    cmd.Parameters.AddWithValue("@Password", Password);
                    cmd.Parameters.AddWithValue("@UserType", UserType);
                    cmd.Parameters.AddWithValue("@Gender", Gender);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            gveLearning.EditIndex = -1;
            this.BindGridView();
        }
        protected void OnCourses(object sender, EventArgs e)
        {
            Response.Redirect("Courses.aspx");
        }
    }
}