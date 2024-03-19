<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NestedRepeater.aspx.cs" Inherits="Nested_Repeater.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>

    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Repeater ID="rptCustomers" runat="server" OnItemDataBound="OnItemDataBound">
            <HeaderTemplate>
                <table class="Grid" cellspacing="0" rules="all" border="1">
                    <tr>
                        <th scope="col">&nbsp;
                        </th>
                        <th scope="col" style="width: 150px">Name
                        </th>
                        <th scope="col" style="width: 150px">Email
                        </th>
                        <th scope="col" style="width: 150px">Pincode
                        </th>
                    </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td>
                        <img alt="" style="cursor: pointer;" src="img/expand.png" height="25" />
                        <asp:Panel ID="pnlCustomers_Details" runat="server" Style="display: none">
                            <asp:Repeater ID="rptCustomers_Details" runat="server">
                                <HeaderTemplate>
                                    <table class="ChildGrid" cellspacing="0" rules="all" border="1">
                                        <tr>
                                            <th scope="col" style="width: 200px">OrderId
                                            </th>
                                            <th scope="col" style="width: 300px">Date
                                            </th>
                                        </tr>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblOrderId" runat="server" Text='<%# Eval("OrderId") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="lblDate" runat="server" Text='<%# Eval("Date") %>' />
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </table>
                                </FooterTemplate>
                            </asp:Repeater>
                        </asp:Panel>
                      <%--  <asp:HiddenField ID="hfid" runat="server" Value='<%# Eval("id") %>' />--%>
                    </td>
                    <td>
                        <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("Email") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblPincode" runat="server" Text='<%# Eval("Pincode") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>
    </form>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        document.addEventListener("click", function (event) {
            if (event.target.tagName === "IMG" && event.target.src.includes("expand")) {
                let parentRow = event.target.closest("tr");
                let newRow = document.createElement("tr");
                let cell = document.createElement("td");
                cell.colSpan = "999";
                newRow.appendChild(cell);
                parentRow.after(newRow);
                cell.innerHTML = event.target.nextElementSibling.innerHTML;
                event.target.src = "img/login.jpg";
            } else if (event.target.tagName === "IMG" && event.target.src.includes("login")) {
                event.target.src = "img/expand.png";
                event.target.closest("tr").nextElementSibling.remove();
            }
        });
    });
    </script>
</body>
</html>
