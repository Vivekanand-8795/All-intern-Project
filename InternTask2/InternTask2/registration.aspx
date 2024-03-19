<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registration.aspx.cs" Inherits="InternTask2.registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous">
    </script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet" />
    <style>
        .col-md-6 {
             border-radius:2rem;
            margin-top: 80px;
            background-color: silver;
        }

        /*.hidden-link {
            text-decoration: none;
        }*/
    </style>

    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <br />
                    <div class="text-center">
                        <h5>CREATE NEW ACCOUNT</h5>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblName" runat="server" Text="Name:"></asp:Label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-user"></i></span>
                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>

                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblEmail" runat="server" Text="Email:"></asp:Label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>

                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblPassword" runat="server" Text="Password:"></asp:Label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-lock"></i></span>
                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                        </div>
                    </div>


                    <div class="form-group">
                        <asp:Label ID="lblGender" runat="server" Text="Gender:"></asp:Label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-user"></i></span>
                            <asp:DropDownList ID="ddlGender" runat="server"  CssClass="form-control">
                                <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                                <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                                <asp:ListItem Text="Other" Value="other"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblUserType" runat="server" Text="UserType:"></asp:Label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-user"></i></span>
                            <asp:DropDownList ID="ddlUserType" runat="server"  CssClass="form-control">
                                <asp:ListItem Text="Admin" Value="Admin"></asp:ListItem>
                                <asp:ListItem Text="User" Value="User"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>


                    <br />
                    <div class="d-grid gap-2 d-md-block text-center">
                        <asp:Button ID="btnSubmit" runat="server" Text="Register" OnClick="OnSubmit" OnClientClick="return validateform();" BorderStyle="None" CssClass="btn btn-primary" />
                    </div>
                    <br />
                    <div class="text-center">
                        <a class="link-primary hidden-link" href="login.aspx">already have an account...!</a>
                    </div>
                    <br />
                </div>
            </div>
        </div>
        <%-- js 85/2 --%>
        <script>

            function validateform() {
                var txtEmail = document.getElementById("txtEmail");
                var txtPassword = document.getElementById("txtPassword");
                var txtName = document.getElementById("txtName");
                txtName.style.borderColor = "";
                txtEmail.style.borderColor = "";
                txtPassword.style.borderColor = "";

                var isValid = true;

                if (!isValidName(txtName.value)) {
                    txtName.style.borderColor = "red";
                    alert('Invalid name format. Please use letters, numbers, and single spaces between words.');
                    isValid = false;
                }
                else if (!isValidEmail(txtEmail.value)) {
                    txtEmail.style.borderColor = "red";
                    alert('Please enter a valid email address.');
                    isValid = false;
                }
                else if (!isValidPassword(txtPassword.value)) {
                    txtPassword.style.borderColor = "red";
                    alert('Please enter a valid password.');
                    isValid = false;
                }
                return isValid;
            }

            function isValidEmail(email) {
                var emailRegex = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$/;
                return emailRegex.test(email);
            }

            function isValidPassword(password) {
                var passwordRegex = /[A-Za-z0-9]/;
                return passwordRegex.test(password);
            }

            function isValidName(name) {
                var nameRegex = /^[A-Za-z0-9]+(?: [A-Za-z0-9]+)*$/;
                return nameRegex.test(name);
            }

        </script>
    </form>
</body>
</html>
