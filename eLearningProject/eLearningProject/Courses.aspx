<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Courses.aspx.cs" Inherits="eLearningProject.Courses" %>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title></title>
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

        .row {
            text-align: center;
        }

        .col-lg-3 {
            transition: all 0.3s;
            box-shadow: 2px 5px 20px #fa882a;
            border-radius: 10PX;
            margin-right: 20px;
        }

            .col-lg-3:hover {
                transform: scale(1.15);
            }

        .template-card {
            margin: 0px;
            background-color: #e3e3e3;
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
                        <li class="nav-item">
                            <a class="navbar-brand btn btn-light" style="color: #f57f17" href="Details.aspx">Home</a>
                        </li>
                        <li style="width: 10px"></li>
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
        <%-- first --%>
        <div class="container">
            <div class="row">
                <div class="col-lg-3" style="background-color: #e3e3e3; margin: 45px;">
                    <br />
                    <div class="template-card">
                        <img src="img/Python.svg" class="img-fluid" /><br />
                        <br />
                        <br />
                        <img src="img/pythonimg.png" class="img-fluid" /><br />
                        <br />
                        <br />
                        <a href="img/pythonl_EDIT.pdf" class="btn btn-warning w-100" style="background-color: #fa882a; color: #e3e3e3">Click</a>
                    </div>
                    <br />
                    <br />
                </div>
                <div class="col-lg-3" style="background-color: #fff0d9; margin: 45px;">
                    <br />
                    <div class="template-card" style="background-color: #fff0d9">
                        <img src="img/numPy.svg" class="img-fluid" /><br />
                        <br />
                        <br />
                        <img src="img/numpypandas.png" class="img-fluid" /><br />
                        <br />
                        <br />
                        <br />
                        <a href="img/pythonl_EDIT.pdf" class="btn btn-warning w-100" style="background-color: #fa882a; color: #e3e3e3">Click</a>
                    </div>
                    <br />
                    <br />
                </div>
                <div class="col-lg-3" style="background-color: #ffffff; margin: 45px;">
                    <br />
                    <div class="template-card" style="background-color: #ffffff">
                        <img src="img/powerBI.svg" class="img-fluid" /><br />
                        <br />
                        <br />
                        <img src="img/flow-of-Power-BI.png" class="img-fluid" /><br />
                        <br />
                        <br />
                        <br />
                        <a href="img/pythonl_EDIT.pdf" class="btn btn-warning w-100" style="background-color: #fa882a; color: #e3e3e3">Click</a>
                    </div>
                    <br />
                    <br />
                </div>
            </div>
        </div>
        <br />
        <br />
        <%-- second --%>
        <div class="container">
            <div class="row">
                <div class="col-lg-3" style="background-color: #e6e5e3; margin: 45px;">
                    <br />
                    <div class="template-card" style="background-color: #e6e5e3">
                        <img src="img/Sql.svg" class="img-fluid" /><br />
                        <br />
                        <br />
                        <img src="img/sQL.png" class="img-fluid" /><br />
                        <br />
                        <br />
                        <a href="img/pythonl_EDIT.pdf" class="btn btn-warning w-100" style="background-color: #fa882a; color: #e3e3e3">Click</a>
                    </div>
                    <br />
                    <br />
                </div>
                <div class="col-lg-3" style="background-color: #ffffff; margin: 45px;">
                    <br />
                    <div class="template-card" style="background-color: #ffffff">
                        <img src="img/C.jpg" class="img-fluid" width="50" /><br />
                        <br />
                        <br />
                        <img src="img/Langause%20C.jpg" class="img-fluid" width="150" /><br />
                        <br />
                        <br />
                        <br />
                        <a href="img/pythonl_EDIT.pdf" class="btn btn-warning w-100" style="background-color: #fa882a; color: #e3e3e3">Click</a>
                    </div>
                    <br />
                    <br />
                </div>
                <div class="col-lg-3" style="background-color: #ffffff; margin: 45px;">
                    <br />
                    <div class="template-card" style="background-color: #ffffff">
                        <img src="img/logo%20(2).png" class="img-fluid" width="100" /><br />
                        <br />
                        <br />
                        <img src="img/Cimages.png" class="img-fluid" /><br />
                        <br />
                        <br />
                        <br />
                        <a href="img/pythonl_EDIT.pdf" class="btn btn-warning w-100" style="background-color: #fa882a; color: #e3e3e3">Click</a>
                    </div>
                    <br />
                    <br />
                </div>
            </div>
        </div>
        <br />
        <br />
        <%-- third --%>
        <div class="container">
            <div class="row">
                <div class="col-lg-3" style="background-color: #ffffff; margin: 45px;">
                    <br />
                    <div class="template-card" style="background-color: #ffffff">
                        <img src="img/imagesHTML.png" class="img-fluid" width="150" /><br />
                        <br />
                        <br />
                        <img src="img/HTMLstructure.png" class="img-fluid" /><br />
                        <br />
                        <br />
                        <a href="img/pythonl_EDIT.pdf" class="btn btn-warning w-100" style="background-color: #fa882a; color: #e3e3e3">Click</a>
                    </div>
                    <br />
                    <br />
                </div>
                <div class="col-lg-3" style="background-color: #ffffff; margin: 45px;">
                    <br />
                    <div class="template-card" style="background-color: #ffffff">
                        <img src="img/CSSimage.jpg" class="img-fluid" width="100" /><br />
                        <br />
                        <br />
                        <img src="img/types-of-css.png" class="img-fluid" width="180" /><br />
                        <br />
                        <br />
                        <br />
                        <a href="img/pythonl_EDIT.pdf" class="btn btn-warning w-100" style="background-color: #fa882a; color: #e3e3e3">Click</a>
                    </div>
                    <br />
                    <br />
                </div>
                <div class="col-lg-3" style="background-color: #360275; margin: 45px;">
                    <br />
                    <div class="template-card" style="background-color: #360275">
                        <img src="img/Boostrapimages.jpg" class="img-fluid" width="100" /><br />
                        <br />
                        <br />
                        <img src="img/bootstrap.jpg" class="img-fluid" /><br />
                        <br />
                        <br />
                        <br />
                        <a href="img/pythonl_EDIT.pdf" class="btn btn-warning w-100" style="background-color: #fa882a; color: #e3e3e3">Click</a>
                    </div>
                    <br />
                    <br />
                </div>
            </div>
        </div>
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