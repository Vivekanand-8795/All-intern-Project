<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="tester.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
         <asp:GridView ID="gvCustomer" runat="server" AutoGenerateColumns="false">
           <Columns>
               <asp:BoundField DataField="Id" HeaderText="Id" />
               <asp:BoundField DataField="Name" HeaderText="Name" />
               <asp:BoundField DataField="City" HeaderText="City" />
               <asp:BoundField DataField="Country" HeaderText="Country" />
               <asp:BoundField DataField="Date" HeaderText="Date" />
           </Columns>
       </asp:GridView>
    </form>
</body>
</html>
