<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Random.aspx.cs" Inherits="ClassMethod.Random" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:GridView ID="gvRandom" runat="server" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" />
                <asp:BoundField DataField="Name" HeaderText="Name" />
                <asp:BoundField DataField="City" HeaderText="City" />
            </Columns>
        </asp:GridView>
        <asp:TextBox ID="txtName" runat="server" placeholder="Name"></asp:TextBox>
        <asp:TextBox ID="txtCity" runat="server" placeholder="City"></asp:TextBox>
        <asp:TextBox ID="txtId" runat="server" placeholder="Id"></asp:TextBox>
        <%--<asp:Button ID="btnInsert" Text="Insert" OnClick="ExecuteDataOperation" CommandArgument="Insert" runat="server" />
        <asp:Button ID="btnUpdate" Text="Update" OnClick="ExecuteDataOperation" CommandArgument="Update" runat="server" />
        <asp:Button ID="btnDelete" Text="Delete" OnClick="ExecuteDataOperation" CommandArgument="Delete" runat="server" />--%>
        <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red"></asp:Label>
        

        <asp:Button ID="btnInsert" Text="Insert" OnClick="HandleDataOperation" CommandArgument="Insert" runat="server" />
        <asp:Button ID="btnUpdate" Text="Update" OnClick="HandleDataOperation" CommandArgument="Update" runat="server" />
        <asp:Button ID="btnDelete" Text="Delete" OnClick="HandleDataOperation" CommandArgument="Delete" runat="server" />

    </form>
</body>
</html>
