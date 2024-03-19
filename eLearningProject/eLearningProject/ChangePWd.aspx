<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangePwd.aspx.cs" Inherits="eLearningProject.ChangePwd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="correct-integrity-value" crossorigin="anonymous" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous" />
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title></title>
    <style>
        * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }

        .main {
            margin-top: 150px;
            width: 350px;
            height: 450px;
            background: white;
            overflow: hidden;
            border-radius: 10px;
            box-shadow: 5px 20px 50px #fa882a;
        }

        .input-group-append {
            margin-left: auto;
            margin-top: -34px;
            margin-right: 3px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:GridView ID="gveLearning" runat="server" AutoGenerateColumns="false">
        </asp:GridView>
        <div class="container main">
            <br />
            <h3 style="color: #f57f17; text-align: center">Change Password </h3>
            <br />

            <asp:Label ID="lblOldPwd" runat="server" Text="Old Password" Style="color: #f57f17"></asp:Label><br />
            <asp:TextBox ID="txtOldPwd" runat="server" TextMode="Password" CssClass="form-control" BorderColor="#f57f17" Style="border-radius: 5px 0 0 5px;"></asp:TextBox>
            <div class="input-group">
                <div class="input-group-append">
                    <span class="input-group-text" style="cursor: pointer;" onclick="togglePassword('txtOldPwd')">
                        <i class="fa fa-eye-slash" style="background-color: white;"></i>
                    </span>
                </div>
            </div>
            <br />

            <asp:Label ID="lblNewPwd" runat="server" Text="New Password" Style="color: #f57f17"></asp:Label><br />
            <asp:TextBox ID="txtNewPwd" runat="server" TextMode="Password" CssClass="form-control" BorderColor="#f57f17" Style="border-radius: 5px"></asp:TextBox>
            <div class="input-group">
                <div class="input-group-append">
                    <span class="input-group-text" style="cursor: pointer;" onclick="Password('txtNewPwd')">
                        <i class="fa fa-eye-slash"></i>
                    </span>
                </div>
            </div>
            <br />

            <asp:Label ID="lblCnfPwd" runat="server" Text="Confirm New Password" Style="color: #f57f17"></asp:Label><br />
            <asp:TextBox ID="txtCnfPwd" runat="server" TextMode="Password" CssClass="form-control" BorderColor="#f57f17" Style="border-radius: 5px"></asp:TextBox>
            <div class="input-group">
                <div class="input-group-append">
                    <span class="input-group-text" style="cursor: pointer;" onclick="Pwd('txtCnfPwd')">
                        <i class="fa fa-eye-slash"></i>
                    </span>
                </div>
            </div>
            <br />
            <asp:Button ID="btnSet" Text="Set Password" runat="server" CssClass="btn btn-light w-100"
                Style="background-color: #f57f17; color: white" OnClientClick="validatePassword();" OnClick="OnSet" />

            <br />
            <br />
            <br />
        </div>
    </form>
    <script>
        function togglePassword(textboxId) {
            var pwdTextbox = document.getElementById('<%=txtOldPwd.ClientID%>');

            if (pwdTextbox.type === 'password') {
                pwdTextbox.type = 'text';
            } else {
                pwdTextbox.type = 'password';
            }
        }
        function Password(textboxId) {
            var pwdTextbox = document.getElementById('<%=txtNewPwd.ClientID%>');

            if (pwdTextbox.type === 'password') {
                pwdTextbox.type = 'text';
            } else {
                pwdTextbox.type = 'password';
            }
        }

        function Pwd(textboxId) {
            var pwdTextbox = document.getElementById('<%=txtCnfPwd.ClientID%>');

            if (pwdTextbox.type === 'password') {
                pwdTextbox.type = 'text';
            } else {
                pwdTextbox.type = 'password';
            }
        }
    </script>
</body>
</html>
