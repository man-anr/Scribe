<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminPage.Master" AutoEventWireup="true" CodeBehind="UpdatePassword.aspx.cs" Inherits="Scribe.UpdatePassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    </asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodycontent" runat="server">
    <center>
        Welcome&nbsp&nbsp<strong><asp:Label ID="lblid" runat="server" ForeColor="Blue"></asp:Label></strong>
        <h2 class="auto-style7">Update Password</h2>
        <table class="auto-style5">
            <tr><td class="auto-style12">New Password:</td>
            <td><asp:TextBox id="new_password" TextMode="Password" runat="server"></asp:TextBox>
                 &nbsp;<asp:RequiredFieldValidator ID="rfvPword" runat="server" ControlToValidate="new_password" ErrorMessage="Enter Password" 
                     ForeColor="Red"></asp:RequiredFieldValidator>
        </tr>
        <tr><td class="auto-style12">Confirm Password:</td>
            <td>&nbsp;<asp:TextBox ID="confirm_password" TextMode="Password" runat="server" OnTextChanged="confirm_password_TextChanged"></asp:TextBox>&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="confirm_password" 
                    ErrorMessage="Enter Password" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:CompareValidator runat="server" id="cprPW" controltovalidate="new_password" controltocompare
                    ="confirm_password" type="string"  ForeColor="red" errormessage="The password entered is not match!">
                </asp:CompareValidator>
</td>
            </tr>
            <tr>
                <td class="auto-style13">
            <asp:Button ID="ButtonSubmit" Text="Submit" runat="server" OnClick="ButtonSubmit_Click" />&nbsp;
            <asp:Button ID="ButtonCancel" Text="Cancel" runat="server" OnClick="ButtonCancel_Click" />&nbsp;
            </td>             
            </tr>
        </table>
        <asp:Label ID="lbl_success" runat="server"></asp:Label><asp:Button ID="ButtonHere" Text="here" runat="server" OnClick="ButtonHere_Click" />
    </center>
</asp:Content>