<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="DatabaseProject.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodycontent" runat="server">
    <center class="mt-3">
        <table class="auto-style5">
            <tr>
                <h2 class="auto-style7">Login</h2>
            </tr>
            <tr>
                <h3 class="auto-style14">Enter your ID and Password</h3>
            </tr>
            <tr>
                <td class="auto-style12">User ID:</td>
                <td>&nbsp;<asp:TextBox ID="txtbox_ID" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="auto-style12">Password:</td>
                <td class="auto-style4">&nbsp;<asp:TextBox ID="txtbox_password" TextMode="Password" runat="server" OnTextChanged="txtbox_password_TextChanged"></asp:TextBox>&nbsp;
                                <asp:RequiredFieldValidator ID="rfvPword" runat="server" ControlToValidate="txtbox_password" ErrorMessage="Enter Password" ForeColor="Red">

                                </asp:RequiredFieldValidator>

                </td>
            </tr>
            <tr>

                <td class="auto-style6">
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                        <asp:ListItem>Student</asp:ListItem>
                        <asp:ListItem>Lecturer</asp:ListItem>
                        <asp:ListItem>Admin</asp:ListItem>
                    </asp:RadioButtonList>
            </tr>
            <tr>
                <td class="auto-style13">
                    <asp:Button ID="ButtonSubmit" Text="Submit" runat="server" OnClick="ButtonSubmit_Click" />&nbsp;
            <asp:Button ID="ButtonCancel" Text="Cancel" runat="server" OnClick="ButtonCancel_Click" />&nbsp;
            
                </td>
                <td>&nbsp;<asp:Label ID="lblStatus" ForeColor="Red" runat="server"></asp:Label></td>
            </tr>

        </table>
    </center>
</asp:Content>

