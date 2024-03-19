<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="eLearningProject.Payment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <title></title>
    <style>
        * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }

        body {
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            background-color: #f8f9fa;
        }

        .container {
            border-radius: 10px;
            background-color: #e3e3e3;
            box-shadow: 5px 20px 50px #fa882a;
            max-width: 600px; 
            width: 100%; 
            padding: 20px; 
        }

        h4 {
            color: #fa882a;
            text-align: center; 
        }

        table {
            width: 100%;
        }

        td {
            padding: 10px;
        }

        .btnSubmit {
            background-color: #f57f17;
            color: white;
            border-radius: 15px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
                <h4 style="color: #fa882a">Payment Mode</h4>
                <table>
                    <tr>
                        <td>
                            <asp:TextBox ID="txtOrderId" runat="server" placeholder="OrderId" CssClass="form-control" BorderColor="#f57f17"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="txtName" runat="server" placeholder="Name" CssClass="form-control" BorderColor="#f57f17"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="txtEmail" runat="server" placeholder="G456@gmail.com" CssClass="form-control" BorderColor="#f57f17"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="txtMobileNo" runat="server" placeholder="MobileNo" CssClass="form-control" BorderColor="#f57f17"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="txtAmount" runat="server" placeholder="Amount" CssClass="form-control" BorderColor="#f57f17"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: center;">
                            <asp:Button ID="btnSubmit" OnClick="OnSubmit" runat="server" Text="Submit" Style="background-color: #f57f17; color: white; border-radius: 15px;"
                                CssClass="btn btn-light" Height="35" BorderColor="White" />
                        </td>
                    </tr>
                </table>
            </div>
    </form>
</body>
</html>
