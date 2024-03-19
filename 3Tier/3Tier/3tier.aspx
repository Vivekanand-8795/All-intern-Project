<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="3tier.aspx.cs" Inherits="_3Tier._3tier" %>

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
                   <asp:Button ID="btnSave" runat="server" Text="Save" Width="100%" OnClick="btnSave_Click" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
