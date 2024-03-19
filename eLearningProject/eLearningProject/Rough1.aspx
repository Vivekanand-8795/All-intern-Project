<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Rough1.aspx.cs" Inherits="eLearningProject.Rough1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title></title>
     <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        .login-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            text-align: center;
        }

        .login-container img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            margin-bottom: 20px;
        }

        .login-container input {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            box-sizing: border-box;
        }

        .login-container button {
            width: 100%;
            padding: 10px;
            background-color: #4caf50;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
       <div class="login-container">
            <asp:Image ID="imgProfile" runat="server" Width="100" Height="100" ImageUrl="default-profile-picture.jpg" AlternateText="Profile Picture" />
            <h2>Login</h2>
            <asp:TextBox ID="txtEmail" runat="server" placeholder="Email" required></asp:TextBox>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Password" required></asp:TextBox>
            <asp:Button ID="btnLogin" runat="server" Text="Login" OnClientClick="login(); return false;" OnClick="btnLogin_Click" />
        </div>

        <asp:ScriptManager runat="server" />
<asp:TextBox ID="TextBox1" runat="server" />
<cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="TextBox1"
    Format="dd/MM/yyyy">
</cc1:CalendarExtender>


        <script>
            function login() {
                var email = document.getElementById('<%= txtEmail.ClientID %>').value;
                var password = document.getElementById('<%= txtPassword.ClientID %>').value;

                // Replace this with your actual authentication logic
                // For simplicity, we'll consider any email and password as valid
                var isValidUser = true;

                if (isValidUser) {
                    // Replace this with logic to redirect or perform other actions after successful login
                    alert('Login successful!');
                } else {
                    alert('Invalid email or password. Please try again.');
                }
            }
        </script>
    </form>
</body>
</html>
