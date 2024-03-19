<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Import.aspx.cs" Inherits="ImportExcelPdf.Import" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 42px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lblText" runat="server" Text="Imoprt to Excel Pdf" ForeColor="Lime"></asp:Label>
            <br />
            <br />
            <table>
                <tr>
                    <td class="auto-style1">
                        <asp:Label ID="lblText2" runat="server" Text="Upload Pdf"></asp:Label>
                        <br />
                        <br />
                        <br />
                    </td>
                    <td class="auto-style1">
                        <asp:FileUpload ID="fluPdf" runat="server" />
                        <br />
                        <br />
                        <br />
                    </td>

                </tr>
                <tr>
                    <td>
                        <asp:Button ID="btnSubmit" runat="server" Text="Upload and save to sql server" OnClick="OnSubmit" BackColor="#009900" AutoPostBack="false" />
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblText3" runat="server" ForeColor="Red"></asp:Label></td>
                </tr>
            </table>

        </div>
    </form>
</body>
</html>



<%--//protected void OnSubmit(object sender, EventArgs e)
        //{
        //    string Emp_Code;
        //    string Name_Of_Employee;
        //    string Date_of_Birth;
        //    string Age;
        //    string Relationship;
        //    string Gender;
        //    string path = Path.GetFileName(fluPdf.FileName);
        //    path = path.Replace(" ", " ");
        //    fluPdf.SaveAs(Server.MapPath("~/File/")+path);
        //    string ExcelPath = Server.MapPath(("~/File/") + path);
        //}--%>