<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminRegistration.aspx.cs" Inherits="eLearningProject.AdminRegistration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous">
    </script>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title></title>
    <style>
        * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }

        .container {
            border-radius: 10px;
            margin-top: 50px;
            background-color: #e3e3e3;
            box-shadow: 5px 20px 50px #fa882a;
        }

        .solid {
            margin: 0;
            border: 0;
            height: 2px;
            background-color: black;
        }

        .border {
            border-radius: 5px;
            height: 40px;
            text-align: center;
        }

        .col-lg-8 {
            margin-left: 100px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:GridView ID="gveLearning" runat="server" AutoGenerateColumns="false">
        </asp:GridView>
        <div class="container col-md-6">
            <nav class="navbar navbar-expand-lg" style="background-color: #e3e3e3">
                <div class="container-fluid">
                    <img src="img/RNG1.jpg" height="60" class="logo" />
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item ml-auto">
                            <h3 style="color: #f57f17">Class Registration</h3>
                            <p style="color: #f57f17">Fill out the form carefully for registration</p>
                        </li>
                    </ul>
                </div>
            </nav>
            <hr class="solid" />
            <br />
            <table class="details">
                <tr class="row">
                    <td>
                        <asp:Label ID="lblName" runat="server" Text="Student Name" Font-Bold="true" Style="color: #f57f17"></asp:Label><br />
                    </td>

                    <td class="col-lg-4">
                        <asp:TextBox ID="txtFname" runat="server" placeholder="First Name" CssClass="form-control" BorderColor="#f57f17"></asp:TextBox>
                    </td>
                    <td class="col-lg-4">
                        <asp:TextBox ID="txtMname" runat="server" placeholder="Middle Name" CssClass="form-control" BorderColor="#f57f17"></asp:TextBox>
                    </td>
                    <td class="col-lg-4">
                        <asp:TextBox ID="txtLname" runat="server" placeholder="Last Name" CssClass="form-control" BorderColor="#f57f17"></asp:TextBox>
                        <br />
                    </td>
                </tr>
                <tr class="row">
                    <td class="col-lg-6">
                        <asp:Label ID="lblGender" runat="server" Text="Gender" Font-Bold="true" Style="color: #f57f17"></asp:Label><br />
                        <asp:DropDownList ID="ddlGender" runat="server" DataTextField="Gender" placeholder="Please Select" CssClass="form-control" BorderColor="#f57f17">
                            <asp:ListItem Text="Please Select" Value="Please Select"></asp:ListItem>
                            <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                            <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                            <asp:ListItem Text="Other" Value="Other"></asp:ListItem>
                        </asp:DropDownList>
                        <br />
                    </td>
                    <td class="col-lg-6">
                        <asp:Label ID="lblEmail" runat="server" Text="Student E-mail" Font-Bold="true" Style="color: #f57f17"></asp:Label><br />
                        <asp:TextBox ID="txtEmail" runat="server" placeholder="gupta456@gmail.com" CssClass="form-control" BorderColor="#f57f17"></asp:TextBox>
                        <br />
                    </td>
                </tr>
                <tr class="row">
                    <td class="col-lg-6">
                        <asp:Label ID="lblUid" runat="server" Text="UID Number" Font-Bold="true" Style="color: #f57f17"></asp:Label>
                        <asp:TextBox ID="txtUid" runat="server" placeholder="000000000000" CssClass="form-control" BorderColor="#f57f17"></asp:TextBox>
                        <br />
                    </td>
                    <td class="col-lg-6">
                        <asp:Label ID="lblPan" runat="server" Text="Pan Card Number" Font-Bold="true" Style="color: #f57f17"></asp:Label>
                        <asp:TextBox ID="txtPan" runat="server" placeholder="dksxf0000l" CssClass="form-control" BorderColor="#f57f17"></asp:TextBox>
                        <br />
                    </td>
                </tr>
                <tr class="row">
                    <td class="col-lg-6">
                        <asp:Label ID="lblMobile" runat="server" Text="Mobile" Font-Bold="true" Style="color: #f57f17"></asp:Label>
                        <asp:TextBox ID="txtMobile" runat="server" placeholder="0000000000" CssClass="form-control" BorderColor="#f57f17"></asp:TextBox>
                        <br />
                    </td>
                    <td class="col-lg-6">
                        <asp:Label ID="lblBirth" runat="server" Text="Date of Birth (MM/DD/YYYY)" Font-Bold="true" Style="color: #f57f17"></asp:Label>
                        <asp:TextBox ID="txtDateOfBirth" runat="server" placeholder="MM/DD/YYYY" CssClass="form-control" BorderColor="#f57f17"></asp:TextBox>
                        <br />
                    </td>
                </tr>

                <tr class="row">
                    <td class="col-lg-6">
                        <asp:Label ID="lblDate" runat="server" Text="Registration Date (MM/DD/YYYY)" Font-Bold="true" Style="color: #f57f17"></asp:Label>
                        <asp:TextBox ID="txtDate" runat="server" placeholder="MM/DD/YYYY" CssClass="form-control" BorderColor="#f57f17"></asp:TextBox>
                        <br />
                    </td>
                    <td class="col-lg-6">
                        <asp:Label ID="lblCourses" runat="server" Text="Courses" Font-Bold="true" Style="color: #f57f17"></asp:Label>
                        <asp:TextBox ID="txtCourses" runat="server" placeholder="c,c++,html,css..etc." CssClass="form-control" BorderColor="#f57f17"></asp:TextBox>
                        <br />
                    </td>
                </tr>
                <tr class="row">
                    <td class="col-lg-6">
                        <asp:Label ID="lblZipCode" runat="server" Text="Zip Code" Font-Bold="true" Style="color: #f57f17"></asp:Label>
                        <asp:TextBox ID="txtZipCode" runat="server" placeholder="000000" CssClass="form-control" BorderColor="#f57f17"></asp:TextBox>
                        <br />
                    </td>
                    <td class="col-lg-6">
                        <asp:Label ID="lblAddress" runat="server" Text="Address" Font-Bold="true" Style="color: #f57f17"></asp:Label>
                        <asp:TextBox ID="txtAddress" runat="server" placeholder="Mumbai" CssClass="form-control" BorderColor="#f57f17" TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr class="row">
                    <td class="col-lg-6">
                        <asp:Label ID="lblUserType" runat="server" Text="UserType" Font-Bold="true" Style="color: #f57f17"></asp:Label><br />
                        <asp:DropDownList ID="ddlUserType" runat="server" DataTextField="UserType" placeholder="Please Select" CssClass="form-control" BorderColor="#f57f17">
                            <asp:ListItem Text="Please Select" Value="Please Select"></asp:ListItem>
                            <asp:ListItem Text="Admin" Value="Admin"></asp:ListItem>
                        </asp:DropDownList>
                        <br />
                    </td>
                    <td class="col-lg-6"></td>

                </tr>
                <tr class="row">
                    <td class="col-lg-8">
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-light w-100"
                            Style="background-color: #f57f17; color: white" OnClick="OnSubmit" OnClientClick="return validateform();" />
                    </td>
                </tr>
            </table>
            <br />
            <br />
        </div>
        <br />
        <br />
        <br />
        <br />
        <br />
        <%-- js using --%>
        <script>
            function validateform() {
                var txtFname = document.getElementById("txtFname");
                var txtMname = document.getElementById("txtMname");
                var txtLname = document.getElementById("txtLname");
                var txtEmail = document.getElementById("txtEmail");
                var txtUid = document.getElementById("txtUid");
                var txtPan = document.getElementById("txtPan");
                var txtMobile = document.getElementById("txtMobile");
                var txtDateOfBirth = document.getElementById("txtDateOfBirth");
                var txtDate = document.getElementById("txtDate");
                var txtCourses = document.getElementById("txtCourses");
                var txtZipCode = document.getElementById("txtZipCode");
                var txtAddress = document.getElementById("txtAddress");
                txtFname.style.borderColor = "";
                txtMname.style.borderColor = "";
                txtLname.style.borderColor = "";
                txtUid.style.borderColor = "";
                txtPan.style.borderColor = "";
                txtMobile.style.borderColor = "";
                txtDateOfBirth.style.borderColor = "";
                txtDate.style.borderColor = "";
                txtCourses.style.borderColor = "";
                txtZipCode.style.borderColor = "";
                txtAddress.style.borderColor = "";

                var isValid = true;


                if (!isValidFname(txtFname.value)) {
                    txtFname.style.borderColor = "red";
                    alert('Please enter First Name.');
                    isValid = false;
                }
                else if (!isValidMname(txtMname.value)) {
                    txtMname.style.borderColor = "red";
                    alert('Please enter Middle Name.');
                    isValid = false;
                }
                else if (!isValidLname(txtLname.value)) {
                    txtLname.style.borderColor = "red";
                    alert('Please enter Last Name.');
                    isValid = false;
                }
                else if (!isValidEmail(txtEmail.value)) {
                    txtEmail.style.borderColor = "red";
                    alert('Please enter a valid email address.');
                    isValid = false;
                }
                else if (txtUid.value.trim() === '' && txtPan.value.trim() === '') {
                    txtUid.style.borderColor = "red";
                    alert('Please enter either a UID Number or a Pan Card Number.');
                    isValid = false;
                } else if (txtUid.value.trim() !== '' && !isValidUid(txtUid.value)) {
                    txtUid.style.borderColor = "red";
                    alert('Please enter a valid UID Number.');
                    isValid = false;
                } else if (txtPan.value.trim() !== '' && !isValidPan(txtPan.value)) {
                    txtPan.style.borderColor = "red";
                    alert('Please enter a valid Pan Card Number.');
                    isValid = false;
                }
                else if (!isValidMobile(txtMobile.value)) {
                    txtMobile.style.borderColor = "red";
                    alert('Please enter Mobile Number.');
                    isValid = false;
                }
                else if (!isValidDateOfBirth(txtDateOfBirth.value)) {
                    txtDateOfBirth.style.borderColor = "red";
                    alert('Please enter Date Of Birth.');
                    isValid = false;
                }
                else if (!isValidDate(txtDate.value)) {
                    txtDate.style.borderColor = "red";
                    alert('Please enter Registration Date.');
                    isValid = false;
                }
                else if (!isValidCourses(txtCourses.value)) {
                    txtCourses.style.borderColor = "red";
                    alert('Please enter Courses.');
                    isValid = false;
                }
                else if (!isValidZipCode(txtZipCode.value)) {
                    txtZipCode.style.borderColor = "red";
                    alert('Please enter ZipCode.');
                    isValid = false;
                }
                else if (!isValidAddress(txtAddress.value)) {
                    txtAddress.style.borderColor = "red";
                    alert('Please enter Address.');
                    isValid = false;
                }
                return isValid;

            }

            function isValidFname(fname) {
                if (fname.trim() === "") {
                    return false;
                }
                return true;
            }
            function isValidMname(mname) {
                if (mname.trim() === "") {
                    return false;
                }
                return true;
            }
            function isValidLname(lname) {
                if (lname.trim() === "") {
                    return false;
                }
                return true;
            }

            function isValidEmail(email) {
                var emailRegex = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$/;
                return emailRegex.test(email);
            }
            function isValidUid(uid) {
                var uidRegex = /^([0-9]{4}[0-9]{4}[0-9]{4}$)|([0-9]{4}\s[0-9]{4}\s[0-9]{4}$)|([0-9]{4}-[0-9]{4}-[0-9]{4}$)/;
                return uidRegex.test(uid);
            }
            function isValidPan(pan) {
                var panRegex = /[A-Z]{5}[0-9]{4}[A-Z]{1}$/;
                return panRegex.test(pan);
            }
            function isValidMobile(mobile) {
                var mobileRegex = /^[0]?[789]\d{9}$/;
                return mobileRegex.test(mobile);
            }
            function isValidDateOfBirth(dateOfBirth) {
                var dateOfBirthRegex = /^(?: (?: 31(\/|-|\.)(?:0?[13578]|1[02]|(?:Jan|Mar|May|Jul|Aug|Oct|Dec)))\1|(?:(?:29|30)(\/|-|\.)(?:0?[1,3-9]|1[0-2]|(?:Jan|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec))\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)(?:0?2|(?:Feb))\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9]|(?:Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep))|(?:1[0-2]|(?:Oct|Nov|Dec)))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$/;
                return dateOfBirthRegex.test(dateOfBirth);
            }
            function isValidDate(date) {
                var dateRegex = /^(?: (?: 31(\/|-|\.)(?:0?[13578]|1[02]|(?:Jan|Mar|May|Jul|Aug|Oct|Dec)))\1|(?:(?:29|30)(\/|-|\.)(?:0?[1,3-9]|1[0-2]|(?:Jan|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec))\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)(?:0?2|(?:Feb))\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9]|(?:Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep))|(?:1[0-2]|(?:Oct|Nov|Dec)))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$/;
                return dateRegex.test(date);
            }
            function isValidCourses(courses) {
                if (courses.trim() === "") {
                    return false;
                }
                return true;
            }
            function isValidZipCode(ZipCode) {
                var ZipCodeRegex = /^\d{6}([-]|\s*)?(\d{4})?$/;
                return ZipCodeRegex.test(ZipCode);
            }
            function isValidAddress(Address) {
                if (Address.trim() === "") {
                    return false;
                }
                return true;
            }
        </script>
    </form>
</body>
</html>
