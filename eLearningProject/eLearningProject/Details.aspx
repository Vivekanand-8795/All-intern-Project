<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="eLearningProject.Details" %>

<!DOCTYPE html>

<%-- Icon --%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha384-vtXRMe3mGCbOeY7l30aIg8H9p3GdeSe4IFlP6G8JMa7o7lXvnz3GFKzPxzJdPfGK" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha384-3B6NwesSXE7YJlcLI9RpRqGf2p/EgVH8BgoKTaUrmKNDkHPStTQ3EyoYjCGXaOTS" crossorigin="anonymous">

<%-- Bootstrap --%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

<%-- Carousel --%>
<link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600;700;800&display=swap" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>

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


        .col-lg-3 {
            transition: all 0.3s;
            padding: 15px;
            margin: 40px;
            box-shadow: 2px 5px 20px #fa882a;
            text-align: center;
            grid-column-gap: 10px;
            grid-row-gap: 10px;
            background-color: #d6651f;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
            justify-content: center;
            align-items: center;
        }

            .col-lg-3:hover {
                transform: scale(1.15);
            }

        .data:hover {
            color: #f57f17;
        }

        .nav-item {
            display: inline-block;
            position: relative;
            cursor: pointer;
        }

        .primary-tooltiptext {
            visibility: hidden;
            width: 120px;
            background-color: #f57f17;
            color: #fff;
            text-align: center;
            border-radius: 5px;
            padding: 5px;
            position: absolute;
            z-index: 1;
            top: 100%;
            left: 50%;
            margin-left: -60px;
            opacity: 0;
            transition: opacity 0.3s;
        }

        .nav-item:hover .primary-tooltiptext {
            visibility: visible;
            opacity: 1;
        }
    </style>
</head>
<body style="margin: 0; padding: 0;">
    <form id="form1" runat="server">
        <div class="container-fluid">
            <nav class="navbar navbar-expand-lg <%--navbar-light bg-light--%>" style="background-color: #e3e3e3">
                <div class="container-fluid">
                    <img src="img/RNG1.jpg" height="60" class="logo" />

                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="navbar-brand" style="color: #f57f17" href="#tab2">Overview</a>
                        </li>
                        <li class="nav-item">
                            <a class="navbar-brand" style="color: #f57f17" href="#tab1">Opportunities</a>
                        </li>
                        <li class="nav-item">
                            <a class="navbar-brand" style="color: #f57f17" href="#tab3">Courses</a>
                        </li>
                        <li class="nav-item">
                            <a href="tel:8795779179">
                                <i class="fas fa-phone" style="color: #f57f17"></i>
                                <span class="primary-tooltiptext">8795779179</span>
                            </a>
                        </li>
                    </ul>
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item ml-auto">
                            <%--    <asp:Button ID="btnLogout" runat="server" Text="Logout" Style="color: #f57f17;" class="btn btn-light" OnClick="OnLogout" OnClientClick="preventBack()"/>--%>

                            <%--<a class="navbar-brand btn btn-light" style="color: #f57f17" href="Login1.aspx" onclick="preventBack()">Logout</a>--%>
                        </li>
                        <li style="width: 20px"></li>
                        <li class="nav-item">
                            <asp:Button ID="btnRegister" runat="server" Text="Register Now" Style="color: #f57f17;" class="btn btn-light" OnClick="OnRegister" OnClientClick="Register()" />
                        </li>
                        <li style="width: 20px"></li>
                        <li class="nav-item ml-auto">
                            <img src="img/elearnlogo1.jpg" class="img-fluid" width="200" />
                        </li>
                    </ul>
                </div>
            </nav>
            <hr class="solid" />
            <%-- crousel --%>
            <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="img/firstImg.png" class="d-block w-100" alt="first Slide" height="400">
                    </div>
                    <div class="carousel-item">
                        <img src="img/secondImg.jpg" class="d-block w-100" alt="Secind Slide" height="400">
                    </div>
                    <div class="carousel-item">
                        <img src="img/fourImg.jpg" class="d-block w-100" alt="Third Slide" height="400">
                    </div>
                    <div class="carousel-item">
                        <img src="img/fiveImg.jpg" class="d-block w-100" alt="four Slide" height="400">
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
            <%-- crousel --%>
            <div class="container">
                <!-- Tab 1 Content -->
                <br />
                <div class="row" id="tab1">
                    <h2 class="data">Unlock High Paying Roles with Our Course</h2>
                    <br />
                    <div class=" col-lg-3 " style="background-color: #f7f3f2">
                        <h1 class="data">Data Scientist </h1>
                        <h4>WORK</h4>
                        <p>Develops and applies data-driven solutions to business problems</p>
                        <h5>TOOLS</h5>
                        <div>
                            <img src="img/tablu.svg" class="img-fluid" />
                            <img src="img/tensor.svg" class="img-fluid" />
                            <img src="img/powerBI.svg" class="img-fluid" />
                        </div>
                        <br />
                        <p>SALARY</p>
                        <h6>₹10 lacs – ₹20 lacs per year</h6>
                    </div>

                    <div class="col-lg-3" style="background-color: #69d3fa">
                        <h1 class="data">Data Analyst </h1>
                        <h4>WORK</h4>
                        <p>Collects, cleans, and analyzes data to identify trends and patterns</p>
                        <h5>TOOLS</h5>
                        <div>
                            <img src="img/Python.svg" class="img-fluid" />
                            <img src="img/Sql.svg" class="img-fluid" />
                            <img src="img/numPy.svg" class="img-fluid" />
                        </div>
                        <br />
                        <p>SALARY</p>
                        <h6>₹10 lacs – ₹20 lacs per year</h6>
                    </div>

                    <div class=" col-lg-3" style="background-color: #f7f3f2">
                        <h1 class="data">Business Analyst </h1>
                        <h4>WORK</h4>
                        <p>Understands the needs of the business and translates them into requirements for data-driven solutions</p>
                        <h5>TOOLS</h5>
                        <div>
                            <img src="img/Sql.svg" class="img-fluid" />
                            <img src="img/Excel.svg" class="img-fluid" />
                            <img src="img/word.svg" class="img-fluid" />
                        </div>
                        <br />
                        <p>SALARY</p>
                        <h6>₹6.5 lacs – ₹13 lacs per year</h6>
                    </div>
                </div>
                <br />
                <br />
                <!-- Tab 3 Content -->
                <div class="container">
                    <div id="tab3">
                        <h4 class="data">Courses</h4>
                        <br />
                        <br />
                        <h5 style="color: #f57f17">C Programming Language</h5>
                        C language<span> C languageTutorial with programming approach for beginners and professionals, helps you to understand the C language tutorial easily. Our C tutorial explains each topic with programs.
The C Language is developed by Dennis Ritchie for creating system applications that directly interact with the hardware devices such as drivers, kernels, etc.</span>
                        <img src="img/CDiagram.jpg" class="img-fluid" />
                        <h5 style="color: #f57f17">Power BI</h5>
                        <p>Power BI is a unified, scalable platform for self-service and enterprise business intelligence (BI). Connect to and visualise any data, and seamlessly infuse the visuals into the apps you use every day.</p>
                        <br />
                        <h5 style="color: #f57f17">Pandas</h5>
                        <p>
                            Pandas is a Python library used for working with data sets.
It has functions for analyzing, cleaning, exploring, and manipulating data.
The name "Pandas" has a reference to both "Panel Data", and "Python Data Analysis" and was created by Wes McKinney in 2008.
                        </p>
                        <br />
                        <center>
                            <img src="img/merge.svg" class="img-fluid" /></center>
                        <br />
                        <h5 style="color: #f57f17">SQL Server</h5>
                        <p>
                            SQL stands for Structured Query Language
SQL lets you access and manipulate databases
SQL became a standard of the American National Standards Institute (ANSI) in 1986, and of the International Organization for Standardization (ISO) in 1987
                        </p>
                        <br />
                        <h5 style="color: #f57f17">Python</h5>
                        <p>
                            Python is a popular programming language. It was created by Guido van Rossum, and released in 1991.<br />
                            It is used for:<br />
                            web development (server-side)<br />
                            software development<br />
                            mathematics<br />
                            system scripting.
                        </p>
                        <br />
                        <div class="row">
                            <div class="col-lg-6">
                                <img src="img/.net.png" class="img-fluid" />
                            </div>
                            <div class="col-lg-6">
                                <h5 style="color: #f57f17">.NET</h5>
                                .NET is an open source developer platform, created by Microsoft, for building many different types of applications.
                            </div>
                        </div>

                        <br />
                        <div class="row">
                            <div class="col-lg-6">
                                <h5 style="color: #f57f17">Java</h5>
                                Java is a multi-platform, object-oriented, and network-centric language that can be used as a platform in itself. It is a fast, secure, reliable programming language for coding everything from mobile apps and enterprise software to big data applications and server-side technologies.
                            </div>
                            <div class="col-lg-6">
                                <img src="img/java.png" width="200" />
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-lg-6">
                                <img src="img/javascript.png" width="200" class="ml-auto" />
                            </div>
                            <div class="col-lg-6">
                                <h5 style="color: #f57f17">JavaScript</h5>
                                JavaScript is a necessary component for adding dynamic features to your website. The JavaScript programming language is based on the underlying ECMAScript specification. Learning JavaScript from the ground up is a critical step toward launching your web development career. Knowledge of JavaScript is required for many frameworks on the frontend (Angular, React, Vue.js) and backend (Node.js).
                            </div>
                        </div>
                        <br />
                        <%-- sentence empty --%>
                        <div class="row">
                            <div class="col-lg-6">
                                <h5 style="color: #f57f17">C# </h5>
                                C# (pronounced "See Sharp") is a modern, object-oriented, and type-safe programming language. C# enables developers to build many types of secure and robust applications that run in .NET. C# has its roots in the C family of languages and will be immediately familiar to C, C++, Java, and JavaScript programmers.
                            </div>
                            <div class="col-lg-6">
                                <img src="img/Netgen.png" width="200" />

                            </div>
                        </div>

                        <br />
                        <div class="row">
                            <div class="col-lg-6">
                                <img src="https://w7.pngwing.com/pngs/201/90/png-transparent-logo-html-html5.png" width="200" />
                            </div>
                            <div class="col-lg-6">
                                <h5 style="color: #f57f17">HTML</h5>
                                <p>HTML stands for Hypertext Markup Language used to build the structure of a web page. HTML is used to describe the structure of information on a web page. HTML5 is the latest evolution of the standard that defines HTML.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <br />
            <br />
            <br />
            <br />
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <h3 style="color: #f57f17">Full Stack Web Development</h3>
                        <br />
                        <p>
                            To become a full-stack web developer, you must learn a wide range of skills. Finding the right learning path and achieving a quick result can be difficult for tyros. At first, visual perception may be overwhelming in understanding what you need to learn and how everything fits together at the end.

This post includes links to great learning resources, as well as a brief description of the relevant topics, so you can get started quickly expanding your skill set.
                        </p>
                    </div>
                    <div class="col-lg-6">
                        <img src="https://miro.medium.com/v2/resize:fit:800/0*ZEPJsASfB2z7hi_0" class="img-fluid" style="" />
                    </div>
                </div>
            </div>
            <br />
            <br />
            <%-- tab 2 content --%>
            <div class="container">
                <div class="row" id="tab2">
                    <h4 style="color: #f57f17">RISING DEMAND IN DATA SCIENCE</h4>
                    <h2 style="color: #f57f17">Your Career Growth is Guaranteed</h2>
                    <br />
                    <div class="col-lg-5 m-4" style="background-color: #e2e8ee; border-radius: 1rem">
                        <img src="https://cdn.prod.website-files.com/62e8d2ea218fb7676b6892a6/64c3c4e82ac72e7162cb66a8_image%20281-p-500.webp" />
                        <p style="height: 30px"></p>
                        <h6 style="color: #f57f17; text-align: center">High Pay for Lifetime</h6>
                        <p>Salary of ₹10 lacs across all Junior Data Science Roles, with average hikes of 100%</p>
                    </div>
                    <p style="width: 90px;"></p>
                    <div class="col-lg-5 m-4" style="background-color: #e2e8ee; border-radius: 1rem">
                        <img src="img/roles.png" />
                        <p style="height: 30px"></p>
                        <h6 style="color: #f57f17; text-align: center">Booming Jobs in Data Science</h6>
                        <p>From 2019 to 2023, Data Science industry saw 2.5x boom in Open Job Roles</p>
                    </div>
                </div>
            </div>
        </div>
        <p style="height: 100px"></p>
        <footer>
            <hr class="fo" />
            <div class="progress">
                <div class="progress-bar bg-secondary" role="progressbar" style="width: 100%">
                    © 2023 Copyright Alliance
                </div>
            </div>
        </footer>
    </form>
    <script type="text/javascript">
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };
     </script>
</body>
</html>
