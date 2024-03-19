<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CallBack.aspx.cs" Inherits="eLearningProject.WebForm1" %>

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

        table {
            width: 100%;
        }

        td {
            padding: 10px;
        }

        .btnNext {
            background-color: #f57f17;
            color: white;
            border-radius: 15px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <table>
                <tr>
                    <td>
                        <asp:TextBox ID="pTxnId" runat="server" placeholder="Id" CssClass="form-control" BorderColor="#f57f17"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="h1Message" runat="server" placeholder="Message" CssClass="form-control" BorderColor="#f57f17"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="pMode" runat="server" placeholder="Mode" CssClass="form-control" BorderColor="#f57f17"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center;">
                        <asp:Button ID="btnNext" OnClick="OnNext" runat="server" Text="Next" Style="background-color: #f57f17; color: white; border-radius: 15px;"
                            CssClass="btn btn-light" Height="35" BorderColor="White" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>



