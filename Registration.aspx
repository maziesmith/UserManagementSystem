<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" EnableEventValidation="false" Inherits="InfologUserManagement.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration</title>
    <meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <span class="float-left ">
                <asp:Button ID="Cancel" runat="server" Text="Cancel" OnClick="CancelSave" class="btn btn-secondary" />
                <asp:Button ID="Save" runat="server" Text="Save" OnCommand="SaveUser" class="btn btn-success" ValidationGroup="add" />
            </span>

            <table class="table table-borderless">
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Username"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="Username" runat="server" CssClass="auto-style2"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator runat="server" ID="reqUsername" ControlToValidate="Username" ForeColor="Red" ErrorMessage="* Required" EnableClientScript="true" ValidationGroup="add"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="Firstname"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="Firstname" runat="server" CssClass="auto-style2"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator runat="server" ID="ReqFirstname" ControlToValidate="Firstname" ForeColor="Red" ErrorMessage="* Required" EnableClientScript="true" ValidationGroup="add"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="Lastname"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="Lastname" runat="server" CssClass="auto-style2"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator runat="server" ID="ReqLastname" ControlToValidate="Lastname" ForeColor="Red" ErrorMessage="* Required" EnableClientScript="true" ValidationGroup="add"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="Active"></asp:Label></td>
                    <td>
                        <asp:CheckBox ID="Active" runat="server" AutoPostBack="False" />
                    </td>

                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text="Password"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="Password" runat="server" CssClass="auto-style2"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator runat="server" ID="ReqPassword" TextMode="Password" ControlToValidate="Password" ForeColor="Red" ErrorMessage="* Required" EnableClientScript="true" ValidationGroup="add"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label6" runat="server" Text="Confirm Password"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="Confirm" runat="server" CssClass="auto-style2" TextMode="Password"></asp:TextBox>
                    </td>
                    <td>
                        <asp:CompareValidator ID="CompareValidator1" runat="server"
                            ControlToValidate="Confirm"
                            CssClass="ValidationError"
                            ControlToCompare="Password"
                            ErrorMessage="Password Not Match!"
                            ForeColor="Red"
                            ValidationGroup="add"/>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                            ErrorMessage="* Required"
                            ControlToValidate="Confirm"
                            CssClass="ValidationError"
                            ForeColor="Red"
                            ValidationGroup="add">
                        </asp:RequiredFieldValidator>
                    </td>
                </tr>

            </table>
        </div>
    </form>
</body>
</html>
