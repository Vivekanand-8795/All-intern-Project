using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eLearningProject
{
    public partial class Details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataBind(); 
            }
            UpdateLoginButton();
        }

        protected void OnRegister(object sender, EventArgs e)
        {
            if (btnRegister.Text == "Logout")
            {
                Session.Clear();
                Session.Abandon();
                Session.RemoveAll();
                Response.Redirect("Login1.aspx");

            }
            else
            {
                Response.Redirect("RegistrationForm.aspx");
            }

           
        }
        private void UpdateLoginButton()
        {
            if (Session["email"] != null)
            {
                btnRegister.Text = "Logout";
                btnRegister.Visible = true;
               
            }
            else
            {
                btnRegister.Text = "Register Now";
            }
        }
    }
}

