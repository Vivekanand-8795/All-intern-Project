<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgetPassword.aspx.cs" Inherits="eLearningProject.ForgetPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lblEmail" runat="server" Text="Enetr Your Register Mail Address:"></asp:Label>
            <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
            <asp:Button ID="btnPassword" runat="server" Text="Get Your Password" OnClick="OnPassword" />
            <asp:Label ID="lbl" runat="server" Text=""></asp:Label>
        </div>
    </form>
</body>
</html>
