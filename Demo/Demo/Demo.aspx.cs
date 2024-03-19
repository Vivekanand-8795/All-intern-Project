using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Demo
{
    public partial class Demo : System.Web.UI.Page
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
            using (SqlConnection con =new SqlConnection(constr))
            {
                using(SqlCommand cmd=new SqlCommand("Select * from Customer", con))
                {
                    con.Open();
                    gvCustomer.DataSource = cmd.ExecuteReader();
                    gvCustomer.DataBind();
                    con.Close();
                }
            }
        }
    }
}