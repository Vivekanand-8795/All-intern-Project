<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="eLearningProject.Home" %>

<!DOCTYPE html>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link href="bootstrap-5.3.0-dist/css/bootstrap-reboot.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title></title>
    <style>
        .solid {
            margin: 0;
            border: 0;
            height: 2px;
            background-color: black;
        }

        .container-fluid {
            padding: 0;
        }

        .fo {
            margin: 0;
            border: 0;
            height: 2px;
            background-color: black;
            margin-bottom: auto;
        }

        .logo {
            border-bottom-right-radius: 1em;
            border-top-left-radius: 1em;
        }

        .left {
            margin-left: auto;
            text-align: center;
        }

        .le {
            color: blue;
        }

        .text {
            box-shadow: 2px 5px 20px #fa882a;
            border-radius: 8px;
            margin-top: 100px;
            margin-left: 150px;
            margin-right: 150px;
            background-color: #f7f3f2;
        }

        .text2 {
            text-align: center;
        }

        .float {
            margin-left: 100PX;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <%-- NavBar --%>
            <nav class="navbar navbar-expand-lg <%--navbar-light bg-light--%>" style="background-color: #e3e3e3">
                <div class="container-fluid">
                    <img src="img/RNG1.jpg" height="60" class="logo" />
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item ml-auto">
                            <img src="img/elearnlogo1.jpg" class="img-fluid" width="200" />
                        </li>
                    </ul>
                </div>
            </nav>
            <%-- NavBar --%>
            <hr class="solid" />
            <br />
            <div class="text mb-5">
                <div class="text2">
                    <br />
                    <br />
                    <br />
                    <br />
                    <h4>Welcome to the RNG Academy e-Learning Portal
                    </h4>
                    <span>Existing Students, Faculty & Staff — Please login to get started. Others & New Applicants — Please visit our website
                    <a href="Details.aspx" style="color: #f57f17">here.</a>
                    </span>
                </div>
                <br />
                <div class="float">
                    <a href="Login1.aspx" text="Login" style="background-color: #f57f17; color: white" class="btn btn-light">
                        <h4>Login</h4>
                    </a>
                    <br />
                    <br />
                    <br />
                    <br />
                </div>
            </div>
            <br />
            <br />
            <br />
            <footer class="">
                <hr class="fo" />
                <div class="progress">
                    <div class="progress-bar bg-secondary" role="progressbar" style="width: 100%">
                        © 2023 Copyright Alliance
                    </div>
                </div>
            </footer>
        </div>
    </form>
</body>
</html>
