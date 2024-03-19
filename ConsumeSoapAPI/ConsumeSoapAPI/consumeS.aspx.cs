using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace ConsumeSoapAPI
{
    public partial class consumeS : System.Web.UI.Page
    {
        SoapRefrence.WebService1 obj = new SoapRefrence.WebService1();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.BindGridView();
            }
        }
        private void BindGridView()
        {
            try
            {
                SoapRefrence.WebService1 obj = new SoapRefrence.WebService1();
                DataTable dt = obj.get();
                gvSoapApi.DataSource = dt;
                gvSoapApi.DataBind();
            }
            catch (Exception ex)
            {

            }
        }
        protected void Insert(object sender, EventArgs e)
        {
            try
            {
                string name = txtName.Text;
                txtName.Text = string.Empty;
                string address = txtAddress.Text;
                txtAddress.Text = string.Empty;
                SoapRefrence.WebService1 obj = new SoapRefrence.WebService1();
                obj.Insert(name, address);
                BindGridView();
                Response.Write("Inserted Successfully");
            }
            catch (Exception ex)
            {
              
            }
        }
        protected void Update(object sender, EventArgs e)
        {
            try
            {
                if (int.TryParse(txtId.Text, out int id))
                {
                    string name = txtName.Text;
                    txtName.Text = string.Empty;
                    string address = txtAddress.Text;
                    txtAddress.Text = string.Empty;
                    SoapRefrence.WebService1 obj = new SoapRefrence.WebService1();
                    string result = obj.Update(name, address, id);
                    BindGridView();
                    Response.Write("<script>alert('Data updated successfully')</script>");
                }
                else
                {
                    Response.Write("Invalid ID. Please enter a valid integer.");
                }
            }
            catch (Exception ex)
            {
              
            }
        }


        protected void Delete(object sender, EventArgs e)
        {
            try
            {
                if (int.TryParse(txtId.Text, out int id))
                {
                    SoapRefrence.WebService1 obj = new SoapRefrence.WebService1();
                    string rtesult = obj.Delete(id);
                    BindGridView();
                    Response.Write("Data Deleted Successfully");
                }
                else
                {
                    Response.Write("Invalid ID. Please enter a valid integer.");
                }
            }
            catch (Exception ex)
            {
               
            }
        }
    }
}