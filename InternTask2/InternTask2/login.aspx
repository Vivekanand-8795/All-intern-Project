<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="InternTask2.login" %>

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
            margin-top: 12%;
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
        <asp:GridView ID="gvRegistrationF" runat="server" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="Id" />
                <asp:BoundField DataField="name" HeaderText="Name" />
                <asp:BoundField DataField="email" HeaderText="Email" />
                <asp:BoundField DataField="password" HeaderText="Password" />
                <asp:BoundField DataField="Image" HeaderText="Image" />
                <asp:BoundField DataField="UserType" HeaderText="UserType" />
                <asp:BoundField DataField="Gender" HeaderText="Gender" />
            </Columns>
        </asp:GridView>


        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <br />
                    <div class="text-center">
                        <img src="img/fg.jpg" class="mx-auto rounded-circle" width="100" />
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
                    <br />
                    <div class="d-grid gap-2 d-md-block text-center">
                        <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-primary" OnClick="btnLogin_Click" OnClientClick="return validateform();" />
                    </div>
                    <h6 class="text-center">or</h6>
                    <div class="text-center">
                        <a class="link-primary hidden-link" href="registration.aspx">create new account</a>
                    </div>
                    <br />
                </div>
            </div>
        </div>


        <%-- js using --%>
        <script>

            function validateform() {
                var txtEmail = document.getElementById("txtEmail");
                var txtPassword = document.getElementById("txtPassword");
                txtEmail.style.borderColor = "";
                txtPassword.style.borderColor = "";

                var isValid = true;

                if (!isValidEmail(txtEmail.value)) {
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

        </script>

    </form>
</body>
</html>
