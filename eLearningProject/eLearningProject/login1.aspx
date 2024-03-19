<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login1.aspx.cs" Inherits="eLearningProject.login1" %>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login</title>

    <style>
        * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }

        .container-fluid {
            padding: 0;
        }

        .fo {
            margin: 0;
            border: 0;
            height: 2px;
            background-color: black;
        }

        .solid {
            margin: 0;
            border: 0;
            height: 2px;
            background-color: black;
        }

        .main {
            width: 350px;
            height: 500px;
            background: white;
            overflow: hidden;
            border-radius: 10px;
            box-shadow: 5px 20px 50px #fa882a;
        }

        .login {
            text-align: center;
            margin-top: 20px;
            height: 460px;
            background: #f57f17;
            border-radius: 60% / 10%;
        }

        .button-style {
            width: 60%;
            height: 40px;
            margin: 10px auto;
            justify-content: center;
            display: block;
            color: #f57f17;
            background: #e3e3e3;
            font-size: 1em;
            font-weight: bold;
            margin-top: 20px;
            outline: none;
            border: none;
            border-radius: 5px;
            transition: .2s ease-in;
            cursor: pointer;
        }

        .input-style {
            width: 60%;
            height: 35px;
            background: #e0dede;
            justify-content: center;
            display: flex;
            margin: 20px auto;
            padding: 10px;
            border: none;
            outline: none;
            border-radius: 5px;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <nav class="navbar navbar-expand-lg" style="background-color: #e3e3e3">
                <div class="container-fluid">
                    <img src="img/RNG1.jpg" height="60" class="logo" />
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item ml-auto">
                            <img src="img/elearnlogo1.jpg" class="img-fluid" width="200" />
                        </li>
                    </ul>
                </div>
            </nav>
            <hr class="solid" />
            <br />
            <br />
            <br />
        </div>
        <div class="container main">
            <div class="login">
                <h1 style="color: #e3e3e3">Login</h1>
                <br />
                <br />
                <asp:TextBox ID="txtLoginEmail" runat="server" CssClass="input-style" placeholder="Email"></asp:TextBox>
                <asp:TextBox ID="txtLoginPassword" runat="server" CssClass="input-style" placeholder="Password" TextMode="Password"></asp:TextBox>
                <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" CssClass="button-style"></asp:Button>
                <h4 style="color: #e3e3e3">or</h4>
                <div>
                    <a href="#" onclick="window.open('ForgetPassword.aspx','FP','width=500,height=50,top=300,left=500,fullscreen=no,resizeable=0');" style="color: #e3e3e3">
                        <h5>Forget Password</h5>
                    </a>
                    <a href="ChangePWd.aspx" style="color: #e3e3e3">
                        <h5>Change Password</h5>
                    </a>
                </div>
                <asp:Label ID="lbl" runat="server" Text=""></asp:Label>
            </div>
        </div>
        <br />
        <br />
        <footer>
            <hr class="fo" />
            <div class="progress">
                <div class="progress-bar bg-secondary" role="progressbar" style="width: 100%">
                    © 2023 Copyright Alliance
                </div>
            </div>
        </footer>
    </form>
</body>
</html>
