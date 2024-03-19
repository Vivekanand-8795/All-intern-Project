using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace InternTask2
{
    public partial class User1 : System.Web.UI.Page
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
                using (SqlCommand cmd = new SqlCommand("select * from RegistrationF where UserType='User'", con))
                {
                    con.Open();
                    gvRegistrationF.DataSource = cmd.ExecuteReader();
                    gvRegistrationF.DataBind();
                    con.Close();
                }
            }
        }

        protected void OnRowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvRegistrationF.EditIndex = -1;
            this.BindGridView();
        }
        protected void OnRowEditing(object sender, GridViewEditEventArgs e)
        {
            gvRegistrationF.EditIndex = e.NewEditIndex;
            this.BindGridView();
        }
        //protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        //{
        //    int id = Convert.ToInt32(gvRegistrationF.DataKeys[e.RowIndex].Values[0]);
        //    string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        //    using (SqlConnection con = new SqlConnection(constr))
        //    {
        //        using (SqlCommand cmd = new SqlCommand("Delete from RegistrationF where id=@id", con))
        //        {
        //            cmd.Parameters.AddWithValue("@id", id);
        //            con.Open();
        //            cmd.ExecuteNonQuery();
        //            con.Close();
        //        }
        //    }
        //    this.BindGridView();
        //}
        protected void OnRowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = gvRegistrationF.Rows[e.RowIndex];
            int id = Convert.ToInt32(gvRegistrationF.DataKeys[e.RowIndex].Values[0]);
            string Name = (row.FindControl("txtName") as TextBox).Text;
            string Email = (row.FindControl("txtEmail") as TextBox).Text;
            string Password = (row.FindControl("txtPassword") as TextBox).Text;
            string UserType = (row.FindControl("ddlUserType") as DropDownList).Text;
            string Gender = (row.FindControl("ddlGender") as DropDownList).Text;
            FileUpload fluImages = (row.FindControl("fluImages") as FileUpload);
            string path = "~/img/";
            if (fluImages.HasFile)
            {
                path += fluImages.FileName;
                fluImages.SaveAs(MapPath(path));
            }
            else
            {
                Response.Write("Please Take a Valid Image!!");
            }
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Update RegistrationF set name=@name,email=@email,password=@password,Gender=@Gender,UserType=@UserType,Image=@Image Where Id=@id ", con))
                {

                    cmd.Parameters.AddWithValue("@Id", id);
                    cmd.Parameters.AddWithValue("@Name", Name);
                    cmd.Parameters.AddWithValue("@Email", Email);
                    cmd.Parameters.AddWithValue("@Password", Password);
                    cmd.Parameters.AddWithValue("@UserType", UserType);
                    cmd.Parameters.AddWithValue("@Image", path);
                    cmd.Parameters.AddWithValue("@Gender", Gender);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            gvRegistrationF.EditIndex = -1;
            this.BindGridView();
        }
        protected string GetImagePath(object imageField)
        {
            string imagePath = imageField.ToString();
            if (!string.IsNullOrEmpty(imagePath))
            {
                // Check if the image path is a virtual path or a full path, and adjust accordingly.
                if (!imagePath.StartsWith("~/img/"))
                {
                    imagePath = "~/img/" + imagePath;
                }
                return imagePath;
            }
            return "~/img/default-image.png"; // You can provide a default image path if needed.
        }
        protected void gvRegistrationF_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}