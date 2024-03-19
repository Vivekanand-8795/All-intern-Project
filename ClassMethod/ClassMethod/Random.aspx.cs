using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace ClassMethod
{
    public partial class Random : System.Web.UI.Page
    {
        //private Button sender;

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
                using (SqlCommand cmd = new SqlCommand("Select * from Random", con))
                {
                    con.Open();
                    gvRandom.DataSource = cmd.ExecuteReader();
                    gvRandom.DataBind();
                    con.Close();
                }
            }
        }

        //protected void ExecuteDataOperation(object sender, EventArgs e)
        //{
        //    Button clickedButton = (Button)sender;
        //    string operation = clickedButton.CommandArgument;
        //    SqlParameter[] parameters = null;

        //    switch (operation)
        //    {
        //        case "Insert":
        //            parameters = new SqlParameter[]
        //            {
        //        new SqlParameter("@Name", txtName.Text),
        //        new SqlParameter("@City", txtCity.Text)
        //            };
        //            break;
        //        case "Update":
        //            parameters = new SqlParameter[]
        //            {
        //        new SqlParameter("@Name", txtName.Text),
        //        new SqlParameter("@City", txtCity.Text),
        //        new SqlParameter("@Id",txtId.Text)
        //    };
        //            break;
        //        case "Delete":
        //            if (int.TryParse(txtId.Text, out int recordIdToDelete))
        //            {
        //                parameters = new SqlParameter[]
        //                {
        //            new SqlParameter("@Id", recordIdToDelete)
        //                };
        //            }
        //            else
        //            {
        //                lblErrorMessage.Text = "Please enter a valid record ID for deletion.";
        //                return;
        //            }
        //            break;
        //        default:

        //            break;
        //    }

        //    string query = "Select * from Random";
        //    string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;

        //    using (SqlConnection con = new SqlConnection(constr))
        //    using (SqlCommand cmd = new SqlCommand(query, con))
        //    {
        //        switch (operation)
        //        {
        //            case "Insert":
        //                query = "INSERT INTO Random (Name, City) VALUES (@Name, @City)";
        //                break;
        //            case "Update":
        //                query = "UPDATE Random SET Name = @Name, City = @City WHERE Id = @Id";
        //                break;
        //            case "Delete":
        //                query = "DELETE FROM Random WHERE Id = @Id";
        //                break;
        //            default:

        //                break;
        //        }

        //        cmd.CommandText = query;

        //        if (parameters != null)
        //        {
        //            cmd.Parameters.AddRange(parameters);
        //        }

        //        con.Open();
        //        cmd.ExecuteNonQuery();
        //        this.BindGridView();

        //        txtName.Text = "";
        //        txtCity.Text = "";
        //        txtId.Text = "";
        //        Response.Clear();
        //    }
        //}





        //..............................................









        //....................................................




        protected void HandleDataOperation(object sender, EventArgs e)
        {
            Button clickedButton = (Button)sender;
            string operation = clickedButton.CommandArgument;

            if (!string.IsNullOrEmpty(operation))
            {
                SqlParameter[] parameters = null;

                if (operation == "Insert")
                {
                    parameters = new SqlParameter[]
                    {
                new SqlParameter("@Name", txtName.Text),
                new SqlParameter("@City", txtCity.Text),
                new SqlParameter("@Action", "Insert")
                    };
                }
                else if (operation == "Update")
                {
                    int recordId;
                    if (int.TryParse(txtId.Text, out recordId))
                    {
                        parameters = new SqlParameter[]
                        {
                    new SqlParameter("@Id", recordId),
                    new SqlParameter("@Name", txtName.Text),
                    new SqlParameter("@City", txtCity.Text),
                    new SqlParameter("@Action", "Update")
                        };
                    }
                    else
                    {
                        lblErrorMessage.Text = "Please enter a valid ID for the update operation.";
                        return;
                    }
                }
                else if (operation == "Delete")
                {
                    int recordId;
                    if (int.TryParse(txtId.Text, out recordId))
                    {
                        parameters = new SqlParameter[]
                        {
                    new SqlParameter("@Id", recordId),
                    new SqlParameter("@Action", "Delete")
                        };
                    }
                    else
                    {
                        lblErrorMessage.Text = "Please enter a valid ID for the delete operation.";
                        return;
                    }
                }

                ExecuteDataOperation(parameters);
            }
        }

        private void ExecuteDataOperation(SqlParameter[] parameters)
        {
            string query = "sp_Random";
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                if (parameters != null)
                {
                    cmd.Parameters.AddRange(parameters);
                }

                con.Open();
                cmd.ExecuteNonQuery();
                this.BindGridView();
                txtName.Text = "";
                txtCity.Text = "";
                txtId.Text = "";
            }
        }



    }
}