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
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                //this.BindGridView();
            }
        }
        //private void BindGridView()
        //{
        //    string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        //    using (SqlConnection con = new SqlConnection(constr))
        //    {
        //        using(SqlCommand cmd=new SqlCommand("select * from RegistrationF",con))
        //        {
        //            con.Open();
        //            gvRegistrationF.DataSource=cmd.ExecuteReader();
        //            gvRegistrationF.DataBind();
        //            con.Close();
        //        }
        //    }
        //}

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text;
            txtEmail.Text = string.Empty;
            string password = txtPassword.Text;
            txtPassword.Text = string.Empty;
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Select * from RegistrationF where email='" + email + "' and Password='" + password + "'", con))
                {

                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        string auth = dr["UserType"].ToString();
                        Session["email"] = dr["email"].ToString();
                        if (auth == "Admin")
                        {
                            Response.Redirect("Admin.aspx");
                        }
                        else if (auth == "User")
                        {
                            Response.Redirect("User.aspx");
                        }
                    }
                    else
                    {
                        Response.Write("<script language='javascript'>window.alert('please Enter valid Details');</script>");
                    }
                }
            }
        }
    }
}