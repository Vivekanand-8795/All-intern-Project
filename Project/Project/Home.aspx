<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Project.WebForm1" %>

<!DOCTYPE html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        h6{
            margin-left:500px;
            color:white;
        }
        .link{
            color:white;
        }
        .navbar-nav{
            justify-content:end;
        }
        #navbarSupportedContent{
            justify-content:end;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div>
                <nav class="navbar navbar-expand-lg navbar-light bg-dark">
                    <h6>Interior Design Services-<a href="#" class="link" >Book Meeting</a></h6>
                </nav>
            </div>
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <a class="navbar-brand" href="#">RNG</a>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <form class="form-inline my-2 my-lg-0">
                        <input class=" mr-sm-2" type="search" placeholder="Search"  aria-label="Search">
                         <i class="fa fa-search"></i>
                       <%-- <button class="btn btn-outline-dark my-2 my-sm-0" type="submit">Search</button>--%>
                    </form>
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link " href="#">Products</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link " href="#">Design</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link " href="#">Inspiration</a>
                        </li>
                    </ul> 
                </div>
            </nav>
        </div>
    </form>
</body>
</html>
