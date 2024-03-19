<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="consumeS.aspx.cs" Inherits="ConsumeSoapAPI.consumeS" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:GridView ID="gvSoapApi" runat="server" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" />
                <asp:BoundField DataField="Name" HeaderText="Name" />
                <asp:BoundField DataField="Address" HeaderText="Address" />
            </Columns>

        </asp:GridView>
        <table>
            <tr>
                <td>
                    <asp:Label ID="lblID" runat="server" Text="Id:"></asp:Label></td>
                <td>
                    <asp:TextBox ID="txtId" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblName" runat="server" Text="Name:"></asp:Label></td>
                <td>
                    <asp:TextBox ID="txtName" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblAddress" runat="server" Text="Address:"></asp:Label></td>
                <td>
                    <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnInsert" runat="server" Text="Insert" OnClick="Insert" />
                </td>
                <td>
                    <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="Update" />
                </td>
                <td>
                    <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="Delete" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
