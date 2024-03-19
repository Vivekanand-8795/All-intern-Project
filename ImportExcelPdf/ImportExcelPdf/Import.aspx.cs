using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Data.OleDb;
using OfficeOpenXml;
using System.Data;

namespace ImportExcelPdf
{
    public partial class Import : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Your existing Page_Load code here
            }
            ExcelPackage.LicenseContext = LicenseContext.NonCommercial;
        }
        protected void OnSubmit(object sender, EventArgs e)
        {
            string path = Path.GetFileName(fluPdf.FileName);
            path = path.Replace(" ", " ");
            fluPdf.SaveAs(Server.MapPath("~/File/") + path);
            string excelPath = Server.MapPath("~/File/") + path;

            using (var package = new ExcelPackage(new FileInfo(excelPath)))
            {
                if (package.Workbook.Worksheets.Count > 0)
                {
                    var worksheet = package.Workbook.Worksheets[1]; // Assuming data is in the first worksheet
                    int startRow = 2; // Assuming data starts from the second row

                    // Loop through rows in Excel and insert into SQL database
                    for (int row = startRow; row <= worksheet.Dimension.End.Row; row++)
                    {
                        string empCode = worksheet.Cells[row, 1].Text;
                        string nameOfEmployee = worksheet.Cells[row, 2].Text;
                        string dateOfBirth = worksheet.Cells[row, 3].Text;
                        string age = worksheet.Cells[row, 4].Text;
                        string relationship = worksheet.Cells[row, 5].Text;
                        string gender = worksheet.Cells[row, 6].Text;

                        saveddata(empCode, nameOfEmployee, dateOfBirth, age, relationship, gender);
                    }
                }
            }

            // Your existing code...
        }
        private void saveddata(string Emp_Code, string Name_Of_Employee, string Date_of_Birth, string Age, string Relationship, string Gender)
        {
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr)) 
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand("INSERT INTO excelPdf (Emp_Code, Name_Of_Employee, Date_of_Birth, Age, Relationship, Gender) " +
                                          "VALUES (@EmpCode, @Name, @DOB, @Age, @Relationship, @Gender)", con))
                {
                    // Assuming Emp_Code is of type bigint in the SQL Server table
                    long empCodeValue = 0;
                    long.TryParse(Emp_Code, out empCodeValue);
                    cmd.Parameters.Add("@EmpCode", SqlDbType.BigInt).Value = empCodeValue;
                    cmd.Parameters.Add("@Name", SqlDbType.NVarChar).Value = Name_Of_Employee;
                    cmd.Parameters.Add("@DOB", SqlDbType.NVarChar).Value = Date_of_Birth;

                    // Convert 'Age' to int before adding to parameters
                    int ageValue = 0;
                    int.TryParse(Age, out ageValue);
                    cmd.Parameters.Add("@Age", SqlDbType.Int).Value = ageValue;

                    cmd.Parameters.Add("@Relationship", SqlDbType.NVarChar).Value = Relationship;
                    cmd.Parameters.Add("@Gender", SqlDbType.NVarChar).Value = Gender;

                    // Execute the INSERT statement
                    cmd.ExecuteNonQuery();
                }
            }
            lblText3.Text = "Data has been saved successfully";
        }
    }
}





//private void saveddata(string Emp_Code, string Name_Of_Employee, string Date_of_Birth, string Age, string Relationship, string Gender)
//{
//    string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;

//    using (SqlConnection con = new SqlConnection(constr))
//    {
//        con.Open();
//        using (SqlCommand cmd = new SqlCommand("INSERT INTO excelPdf (Emp_Code, Name_Of_Employee, Date_of_Birth, Age, Relationship, Gender) " +
//                                 "VALUES (@EmpCode, @Name, @DOB, @Age, @Relationship, @Gender)", con))
//        {
//            cmd.Parameters.AddWithValue("@EmpCode", Emp_Code);
//            cmd.Parameters.AddWithValue("@Name", Name_Of_Employee);
//            cmd.Parameters.AddWithValue("@DOB", Date_of_Birth);
//            cmd.Parameters.AddWithValue("@Age", Age);
//            cmd.Parameters.AddWithValue("@Relationship", Relationship);
//            cmd.Parameters.AddWithValue("@Gender", Gender);

//            // Execute the INSERT statement
//            cmd.ExecuteNonQuery();
//        }
//    }
//}






//protected void OnSubmit(object sender, EventArgs e)
//{
//    string Emp_Code;
//    string Name_Of_Employee;
//    string Date_of_Birth;
//    string Age;
//    string Relationship;
//    string Gender;
//    string path = Path.GetFileName(fluPdf.FileName);
//    path = path.Replace(" ", " ");
//    fluPdf.SaveAs(Server.MapPath("~/File/") + path);
//    string excelPath = Server.MapPath("~/File/") + path;

//    using (OleDbConnection con = new OleDbConnection($"Provider=Microsoft.ACE.OLEDB.12.0;Data Source={excelPath};Extended Properties='Excel 12.0;HDR=YES;IMEX=1'"))
//    {
//        con.Open();

//        using (OleDbCommand cmd = new OleDbCommand("SELECT * FROM excelPdf", con))
//        {
//            using (OleDbDataReader dr = cmd.ExecuteReader())
//            {
//                while (dr.Read())
//                {
//                    Emp_Code = dr["Emp_Code"].ToString();
//                    Name_Of_Employee = dr["Name_Of_Employee"].ToString();
//                    Date_of_Birth = dr["Date_of_Birth"].ToString();
//                    Age = dr["Age"].ToString();
//                    Relationship = dr["Relationship"].ToString();
//                    Gender = dr["Gender"].ToString();
//                    saveddata( Emp_Code, Name_Of_Employee, Date_of_Birth, Age, Relationship,Gender);
//                    // Now you have the data from the Excel file
//                }
//            }
//        }
//    }

//    lblText3.Text = "Data has been saved successfully";
//}