<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="InternTask2.User1" %>

<!DOCTYPE html>


<%-- sweet alert cdn --%>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<link href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css" rel="stylesheet" />




<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 128px;
        }

        .centered-image {
            display: block;
            margin: 0 auto;
            text-align: center;
        }

        .rounded-border {
            border-radius: 50%;
            border: 2px solid #ccc;
        }
    </style>
<script>
    //update
    var object = { status: false, ele: null };

    function Update(ev) {
        if (object.status) { return true; }

        Swal.fire({
            title: 'Are you sure?',
            text: 'Do you want to Update this row?',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Yes',
            cancelButtonText: 'No'
        }).then((result) => {
            if (result.isConfirmed) {
                performUpdate().then(() => {
                    object.status = true;
                    object.ele = ev;
                    ev.click();
                }).catch((error) => {
                    console.error("Update failed:", error);
                });
            }
        });
        return false;
    }
    function performUpdate() {
        return new Promise((resolve, reject) => {
            setTimeout(() => {
                resolve();
            }, 1000);
        });
    }

    //edit
    var object = { status: false, ele: null };

    function Edit(ev) {
        if (object.status) { return true; }

        Swal.fire({
            title: 'Are you sure?',
            text: 'Do you want to Edit this row?',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Yes',
            cancelButtonText: 'No'
        }).then((result) => {
            if (result.isConfirmed) {
                performEdit().then(() => {
                    object.status = true;
                    object.ele = ev;
                    ev.click();
                }).catch((error) => {
                    console.error("Edit failed:", error);
                });
            }
        });
        return false;
    }
    function performEdit() {
        return new Promise((resolve, reject) => {
            setTimeout(() => {
                resolve();
            }, 1000);
        });
    }
    //cancel
    var object = { status: false, ele: null };

    function Cancel(ev) {
        if (object.status) { return true; }

        Swal.fire({
            title: 'Are you sure?',
            text: 'Do you want to cancel this action?',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Yes',
            cancelButtonText: 'No'
        }).then((result) => {
            if (result.isConfirmed) {
                performCancel().then(() => {
                    object.status = true;
                    object.ele = ev;
                    ev.click();
                }).catch((error) => {
                    console.error("Cancel failed:", error);
                });
            }
        });
        return false;
    }
    function performCancel() {
        return new Promise((resolve, reject) => {
            setTimeout(() => {
                resolve();
            }, 1000);
        });
    }


</script>


</head>
<body>
    <form id="form1" runat="server">
        <asp:GridView ID="gvRegistrationF" runat="server" AutoGenerateColumns="false" OnRowCancelingEdit="OnRowCancelingEdit" OnRowEditing="OnRowEditing" OnRowUpdating="OnRowUpdating" DataKeyNames="id" BackColor="silver" Width="100%">
            <Columns>
                <asp:TemplateField HeaderText="Id">
                    <ItemTemplate>
                        <asp:Label ID="lblId" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Name">
                    <ItemTemplate>
                        <asp:Label ID="lblName" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtName" runat="server" Text='<%#Eval("name") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Email">
                    <ItemTemplate>
                        <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("email") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEmail" runat="server" Text='<%#Eval("email") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Password">
                    <ItemTemplate>
                        <asp:Label ID="lblPassword" runat="server" Text='<%# Eval("password") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtPassword" runat="server" Text='<%#Eval("password") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Gender">
                    <ItemTemplate>
                        <asp:Label ID="lblGender" runat="server" Text='<%# Eval("Gender") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlGender" runat="server">
                            <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                            <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                            <asp:ListItem Text="Other" Value="Other"></asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="UserType">
                    <ItemTemplate>
                        <asp:Label ID="lblUserType" runat="server" Text='<%# Eval("UserType") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlUserType" runat="server">
                            <asp:ListItem Text="User" Value="User"></asp:ListItem>
                            <asp:ListItem Text="Admin" Value="Admin"></asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Image">
                    <ItemTemplate>
                        <asp:Image ID="Image" runat="server" ImageUrl='<%# GetImagePath(Eval("Image")) %>' Width="50" CssClass="centered-image rounded-border" />

                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Image ID="Image" runat="server" ImageUrl='<%# GetImagePath(Eval("Image")) %>' Width="50" CssClass="centered-image rounded-border" />
                        <asp:FileUpload ID="fluImages" runat="server" />
                    </EditItemTemplate>
                </asp:TemplateField>

                <%-- <asp:CommandField ButtonType="Link" ShowEditButton="true" ShowDeleteButton="true"  />--%>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkEdit" runat="server" Text="Edit" CssClass="Edit" CommandName="Edit" OnClientClick="return Edit(this);"></asp:LinkButton>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:LinkButton ID="lnkUpdate" runat="server" Text="Update" CssClass="Update" CommandName="Update" OnClientClick="return Update(this);"></asp:LinkButton>
                        <asp:LinkButton ID="lnkCancel" runat="server" Text="Cancel" CssClass="Cancel" CommandName="Cancel" OnClientClick="return Cancel(this);"></asp:LinkButton>
                    </EditItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

    </form>
</body>
</html>



<%--< script type = "text/javascript" src = "http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js" ></ script >
< script src = "http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js" type = "text/javascript" ></ script >
< link href = "http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/start/jquery-ui.css"
    rel = "stylesheet" type = "text/css" />
//< script type = "text/javascript" >
//    $(function() {
//        $("[id*=btnShowPopup]").click(function() {
//        ShowPopup();
//        return false;
//    });
//});
//function ShowPopup()
//{
//        $("#dialog").dialog({
//    title: "GridView",
//            width: 450,
//            buttons:
//        {
//        Ok: function() {
//                    $(this).dialog('close');
//            }
//        },
//            modal: true
//        });
//    }
//</ script >--%>
<%--<  %--<script type="text/javascript">
           $(function () {
               $("[id*=lnkCancel]").click(function () {
                   Cancel();
                   return false;
               });
           });

           function Cancel() {
               $("#dialog").dialog({
                   title: "GridView",
                   width: 450,
                   buttons: {
                       Cancel: function () {
                           $(this).dialog('close');
                       },
                       No: function () {
                           $(this).dialog('close');
                       }
                   },
                   modal: true
               });
           }
        </script>--%>