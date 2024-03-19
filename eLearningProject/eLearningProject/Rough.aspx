<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Rough.aspx.cs" Inherits="eLearningProject.Rough" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- Add these lines in your head section -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>



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

        .collapse {
            float: right;
            width: 350px;
            /* background: white;
            overflow: hidden;*/
            border-radius: 10px;
            box-shadow: 5px 20px 50px #fa882a;
        }
    </style>
</head>
<body>
    <form runat="server" id="form1">
        <asp:GridView ID="gveLearning" runat="server" AutoGenerateColumns="false">
        </asp:GridView>
        <div class="container-fluid">
            <%-- NavBar --%>
            <nav class="navbar navbar-expand-lg <%--navbar-light bg-light--%>" style="background-color: #e3e3e3">
                <div class="container-fluid">
                    <img src="img/RNG1.jpg" height="60" class="logo" />
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item ml-auto">
                            <%--    <asp:Button ID="btnLogout" runat="server" Text="Logout" Style="background-color: #f57f17; color: white" class="btn btn-light" OnClick="OnLogout" OnClientClick="preventBack()" />--%>
                            <%-- collapse --%>
                            <button style="background-color: #f57f17; color: white" class="btn btn-light rounded-circle" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                                V
                            </button>
                            <%-- <asp:ImageButton ID="imgBtn" runat="server" Style="background-color: #f57f17; color: white"
                                class="btn btn-light rounded-circle" type="button"
                                data-toggle="collapse" data-target="#collapseExample"
                                aria-expanded="false" aria-controls="collapseExample" />--%>
                        </li>
                        <%-- c --%>
                        <li style="width: 30px"></li>
                        <li class="nav-item ml-auto">
                            <img src="img/elearnlogo1.jpg" class="img-fluid" width="200" />
                        </li>
                    </ul>
                </div>
            </nav>
            <%-- NavBar --%>
            <hr class="solid" />
            <br />
            <%-- Collapse --%>
            <div class="collapse" id="collapseExample" style="margin-right: 20px;">
                <div class="card card-body d-flex justify-content-center align-items-center">
                    <%--<img src="img/.net.png" class="rounded-circle" width="50" height="50" />--%>
                    <asp:Image ID="img" runat="server" class="rounded-circle" src="img/avatar.png" Height="50" Width="50" />
                    <asp:Label ID="lblUserName" runat="server"></asp:Label>
                    <asp:Label ID="lblUserEmail" runat="server"></asp:Label>
                    <asp:Button ID="btnLogout" runat="server" Text="Logout" Style="background-color: #f57f17; color: white" class="btn btn-light" OnClick="OnLogout" />
                </div>
            </div>

            <%-- Collapse --%>

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
                        <h3>Login</h3>
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
    <%--<script type="text/javascript">
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };
        </script>--%>
</body>
</html>

