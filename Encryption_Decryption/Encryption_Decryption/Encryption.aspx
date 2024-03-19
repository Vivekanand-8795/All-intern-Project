<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Encryption.aspx.cs" Inherits="Encryption_Decryption.Encryption" %>

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
                    <asp:Label ID="lblEncryption" Text="Encryption:" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtEncryption" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblDecryption" Text="Decryption:" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtDecryption" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnEncryption" runat="server" Text="Encryption" OnClick="OnEncryption" />
                    <asp:Button ID="btnDecryption" runat="server" Text="Decryption" OnClick="OnDecryption" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
