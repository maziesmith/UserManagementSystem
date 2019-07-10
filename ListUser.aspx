<%@ Page Language="C#" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="ListUser.aspx.cs" Inherits="InfologUserManagement.ListUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>List user</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <span class="float-left ">
            <asp:Button ID="Registration" runat="server" Text="Add New User" OnClick="AddUser" class="btn btn-success" />
        </span>
        <span class="float-right ">
            <asp:DropDownList ID="Export" runat="server" Width="150">
                <asp:ListItem Value="">Export to PDF</asp:ListItem>
                <asp:ListItem>Export to CSV</asp:ListItem>
                <asp:ListItem>Export to XLS</asp:ListItem>
            </asp:DropDownList>
            <asp:Button ID="ExportBtn" runat="server" Text="Export" class="btn btn-success" OnClick="ExportObject" />
        </span>

        <div class="table-responsive">
            <asp:GridView CssClass="table table-bordered"
                AutoGenerateColumns="false"
                ID="GridView1"
                runat="server"
                OnRowCommand="GridView1_RowCommand">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="btnEdit" runat="server" Width="60" Text="Edit" CommandName="EditButton" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="Username" DataField="Username" />
                    <asp:BoundField HeaderText="Firstname" DataField="Firstname" />
                    <asp:BoundField HeaderText="Lastname" DataField="Lastname" />
                    <asp:BoundField HeaderText="Active" DataField="Active" />
                    <asp:BoundField HeaderText="Last Modified By" DataField="LastModifiedBy" />
                    <asp:BoundField HeaderText="Last Modified Date" DataField="LastModifiedDate" />
                </Columns>
            </asp:GridView>
            <span class="float-left ">
                <asp:Repeater ID="rptPager" runat="server">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkPage" runat="server" Text='<%#Eval("Text") %>' CommandArgument='<%# Eval("Value") %>' Enabled='<%# Eval("Enabled") %>' OnClick="Page_Changed"></asp:LinkButton>
                    </ItemTemplate>
                </asp:Repeater>
            </span>
            <span class="float-right ">Show 
                <asp:DropDownList ID="ddlPageSize" runat="server" AutoPostBack="true" OnSelectedIndexChanged="PageSize_Changed">
                    <asp:ListItem Text="10" Value="10" />
                    <asp:ListItem Text="25" Value="25" />
                    <asp:ListItem Text="50" Value="50" />
                </asp:DropDownList>
                Rows
            </span>
        </div>
    </form>
    <br />

</body>
</html>
