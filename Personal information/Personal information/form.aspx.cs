using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.IO;


namespace Personal_information
{
    public partial class form : System.Web.UI.Page
    {
        SqlConnection Conn;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            string cf = ConfigurationManager.ConnectionStrings["PF"].ConnectionString;
            Conn = new SqlConnection(cf);
            Conn.Open();
            if(!IsPostBack)
            {
                load();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int ID = int.Parse(TextBox12.Text);
            string Name = TextBox1.Text;
            string DateofBirth = TextBox2.Text;
            string Address = TextBox3.Text;
            string City = TextBox4.Text;
            string Zipcode = TextBox5.Text;
            string Phone = TextBox6.Text;
            string Membership = DropDownList1.SelectedValue;
            string State = TextBox7.Text;
            string Country = TextBox8.Text;
            string Email = TextBox9.Text;
            string CourseName = TextBox10.Text;
            string PaymentDetails = DropDownList2.SelectedValue;
            string Comments = TextBox11.Text;

            SqlCommand cmd =new SqlCommand("Insert into Register values('"+ID+"', '"+Name+"', '"+DateofBirth+"', '"+ Address + "', '"+ City + "', '"+ Zipcode + "', '"+ Phone + "', '"+ Membership + "', '"+ State + "', '"+ Country + "', '"+ Email + "', '"+ CourseName + "', '"+ PaymentDetails + "', '"+ Comments + "' ) ", Conn);
            cmd.ExecuteNonQuery();
            Response.Write("<script>alert('Inserted Successfully')</script>");
            load();
        }

        public void load()
        {
            SqlCommand cmd = new SqlCommand("select * from Register", Conn);
            SqlDataAdapter d = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            d.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            int ID = int.Parse(TextBox12.Text);
            string Name = TextBox1.Text;
            string DateofBirth = TextBox2.Text;
            string Address = TextBox3.Text;
            string City = TextBox4.Text;
            string Zipcode = TextBox5.Text;
            string Phone = TextBox6.Text;
            string Membership = DropDownList1.SelectedValue;
            string State = TextBox7.Text;
            string Country = TextBox8.Text;
            string Email = TextBox9.Text;
            string CourseName = TextBox10.Text;
            string PaymentDetails = DropDownList2.SelectedValue;
            string Comments = TextBox11.Text;

            SqlCommand cmd = new SqlCommand("Update Register set Name= '" + Name + "',DateofBirth= '" + DateofBirth + "',Address= '" + Address + "',City= '" + City + "',Zipcode= '" + Zipcode + "',Phone= '" + Phone + "',Membership= '" + Membership + "',State= '" + State + "',Country= '" + Country + "',Email= '" + Email + "',CourseName= '" + CourseName + "',PaymentDetails= '" + PaymentDetails + "',Comments= '" + Comments + "' where ID='" + ID + "' ", Conn);
            cmd.ExecuteNonQuery();
            Response.Write("<script>alert('Updated Successfully')</script>");
            load();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            int ID = int.Parse(TextBox12.Text);
            

            SqlCommand cmd = new SqlCommand("delete from Register where ID='" + ID + "' ", Conn);
            cmd.ExecuteNonQuery();
            Response.Write("<script>alert('Deleted Successfully')</script>");
            load();
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            load();
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Document document = new Document();
            PdfWriter.GetInstance(document, new FileStream(Server.MapPath("~/Form.pdf"), FileMode.Create));
            document.Open();

            
            PdfPTable table = new PdfPTable(2);
            table.DefaultCell.Border = Rectangle.NO_BORDER;
            table.AddCell("Name:");
            table.AddCell(TextBox1.Text);
            table.AddCell("Date of Birth:");
            table.AddCell(TextBox2.Text);
            table.AddCell("Address:");
            table.AddCell(TextBox3.Text);
            table.AddCell("City:");
            table.AddCell(TextBox4.Text);
            table.AddCell("Zipcode:");
            table.AddCell(TextBox5.Text);
            table.AddCell("Phone:");
            table.AddCell(TextBox6.Text);
            table.AddCell("Membership:");
            table.AddCell(DropDownList1.SelectedValue);
            table.AddCell("State:");
            table.AddCell(TextBox7.Text);
            table.AddCell("Country:");
            table.AddCell(TextBox8.Text);
            table.AddCell("Email:");
            table.AddCell(TextBox9.Text);
            table.AddCell("Course Name:");
            table.AddCell(TextBox10.Text);
            table.AddCell("Payment Details:");
            table.AddCell(DropDownList2.SelectedValue);
            table.AddCell("Comments:");
            table.AddCell(TextBox11.Text);

            document.Add(table);
            document.Close();

            Response.ContentType = "Application/pdf";
            Response.AppendHeader("Content-Disposition", "attachment; filename=Form.pdf");
            Response.TransmitFile(Server.MapPath("~/Form.pdf"));
            Response.End();
        }
    }
}