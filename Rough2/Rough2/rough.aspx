<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="rough.aspx.cs" Inherits="Rough2.rough" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            
            <asp:Calendar ID="Calendar1" runat="server" TargetControlID="TextBox1" OnSelectionChanged="Calendar1_SelectionChanged" Format="dd/MM/yyyy"></asp:Calendar>
        </div>
    </form>
</body>
</html>
