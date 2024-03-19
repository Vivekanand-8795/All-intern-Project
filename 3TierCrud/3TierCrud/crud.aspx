<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="crud.aspx.cs" Inherits="_3TierCrud.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <table>
               <tr>
                <td>
                    Id&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtId" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                </td>
            </tr>
         <tr>
                <td>
                    Password&nbsp;
                    <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
                </td>
            </tr>
             <tr>
                <td>
                    UserType&nbsp;
                    <asp:TextBox ID="txtUserType" runat="server"></asp:TextBox>
                </td>
            </tr>
             <tr>
                <td>
                   <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
                   <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="OnUpdate" />
                </td>
                   <td>
                       &nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
