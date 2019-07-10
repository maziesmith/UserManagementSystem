<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="InfologUserManagement.Login" %>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="container h-100">
                <div class="row h-100 justify-content-center align-items-center">
                    <span class="border">
                        <div class="p-5">
                                <br />
                                <asp:Label ID="Label1" runat="server" Text="Username"></asp:Label>
                                <br />
                                <asp:TextBox ID="Username" runat="server" CssClass="auto-style2"></asp:TextBox>
                                <br />
                                <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
                                <br />
                                <asp:TextBox ID="Password" runat="server" CssClass="auto-style2" TextMode="Password"></asp:TextBox>
                                <br />
                                <h6>
                                    <p class="text-danger">
                                        <asp:Label ID="LoginMessage" runat="server"></asp:Label>
                                    </p>
                                </h6>
                                <span class="float-right ">
                                    <asp:Button ID="SubmitButton" runat="server" Text="Submit" OnClick="LoginHandler" class="btn btn-success" />
                                </span>
                        </div>
                </span>
        </div>
        </div>
    </form>
</body>
</html>
