<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="eLearningProject.Login" %>

<!DOCTYPE html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="https://www.yourwebsite.com/styles.css">
    <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500&display=swap" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <style>
        * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }

        .container-fluid {
            padding: 0;
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

        #chk {
            display: none;
        }

        label {
            color: #fff;
            font-size: 2.3em;
            justify-content: center;
            display: flex;
            margin: 60px;
            font-weight: bold;
            cursor: pointer;
            transition: .5s ease-in-out;
        }

        .input-style {
            width: 60%;
            height: 20px;
            background: #e0dede;
            justify-content: center;
            display: flex;
            margin: 20px auto;
            padding: 10px;
            border: none;
            outline: none;
            border-radius: 5px;
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

            .button-style:hover {
                background: #e3e3e3;
            }

        .signup {
            position: relative;
            width: 100%;
            height: 100%;
        }

        .login {
            height: 460px;
            background: #f57f17;
            border-radius: 60% / 10%;
            transform: translateY(-180px);
            transition: .8s ease-in-out;
        }

            .login label {
                color: #573b8a;
                transform: scale(.6);
            }

        #chk:checked ~ .login {
            transform: translateY(-600px);
        }

            #chk:checked ~ .login label {
                transform: scale(1);
            }

        #chk:checked ~ .signup label {
            transform: scale(.6);
        }
    </style>

    <title></title>
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
        </div>
        <div class=" container main">
            <input type="checkbox" id="chk" aria-hidden="true">
            <div class="signup">
                <label for="chk" style="color: #f57f17">Sign Up</label>
                <asp:TextBox ID="txtUsername" runat="server" CssClass="input-style" placeholder="User name"></asp:TextBox>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="input-style" placeholder="Email"></asp:TextBox>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="input-style" placeholder="Password" TextMode="Password"></asp:TextBox>
                <asp:Button ID="btnSignup" runat="server" Text="Sign up" CssClass="button-style"></asp:Button>
            </div>
            <div class="login">
                <label for="chk" style="color:#e3e3e3">Login</label>
                <asp:TextBox ID="txtLoginEmail" runat="server" CssClass="input-style" placeholder="Email"></asp:TextBox>
                <asp:TextBox ID="txtLoginPassword" runat="server" CssClass="input-style" placeholder="Password" TextMode="Password"></asp:TextBox>
                <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" CssClass="button-style"></asp:Button>
                <h4>or</h4>
                <a href="#" onclick="window.open('ForgetPassword.aspx','FP','width=500,height=50,top=300,left=500,fullscreen=no,resizeable=0');">Forget Password</a>
                <asp:Label ID="lbl" runat="server" Text=""></asp:Label>
            </div>
        </div>
        <br />
        <br />
        <br />
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
<%-- <script>
        $(document).ready(function () {
            $('#chk').change(function () {
                if (this.checked) {
                    $('.login').css('transform', 'translateY(-500px)');
                    $('.signup label').css('transform', 'scale(1)');
                } else {
                    $('.login').css('transform', 'translateY(-180px)');
                    $('.signup label').css('transform', 'scale(0.6)');
                }
            });
        });
    </script>--%>