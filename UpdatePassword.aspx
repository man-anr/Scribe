<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AuthPage.Master" AutoEventWireup="true" CodeBehind="UpdatePassword.aspx.cs" Inherits="Scribe.UpdatePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodycontent" runat="server">

    <section class="h-100">
        <div class="container h-100">
            <div class="row justify-content-sm-center h-100">
                <div class="col-xxl-4 col-xl-4 col-lg-5 col-md-7 col-sm-4">
                    <div class="text-center">
                        <img src="./Assets/images/scribe-logo.png" alt="logo" width="200" class="m-4">
                    </div>

                    <div class="card shadow rounded ">


                        <div class="card-body p-5">



                            <center><strong><asp:Label ID="lblid" runat="server" ForeColor="Blue"></asp:Label></strong>
                                <h2 class="auto-style7">Update Password</h2>
                                <table class="auto-style5">
                                    <tr>
                                        <td class="auto-style12">New Password:</td>
                                    </tr>
                                    <tr>
                                        
                                        <td>
                                            <asp:TextBox Width="100%" ID="new_password" TextMode="Password" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvPword" runat="server" ControlToValidate="new_password" ErrorMessage="Enter Password"
                                                ForeColor="Red"></asp:RequiredFieldValidator>
                                    </tr>
                                    <tr>
                                        
                                        <td class="auto-style12">Confirm Password:</td>
                                    </tr>
                                    <tr>
                                        <td><asp:TextBox Width="100%" ID="confirm_password" TextMode="Password" runat="server" OnTextChanged="confirm_password_TextChanged"></asp:TextBox>&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="confirm_password"
                    ErrorMessage="Enter Password" ForeColor="Red"></asp:RequiredFieldValidator>
                                            
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <asp:CompareValidator runat="server" ID="cprPW" ControlToValidate="new_password" ControlToCompare="confirm_password"
                                                Type="string" ForeColor="red" ErrorMessage="The password entered is not match!">
                                            </asp:CompareValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="" colspan="2">
                                            <asp:Button Width="100%" ID="ButtonSubmit" Text="Reset my password" runat="server" OnClick="ButtonSubmit_Click" CssClass="btn btn-primary" />
                                            <%--&nbsp;
            <asp:Button ID="ButtonCancel" Text="Cancel" runat="server" OnClick="ButtonCancel_Click" />&nbsp;--%>
                                        </td>
                                    </tr>
                                </table>
                                <asp:Label  ID="lbl_success" runat="server"></asp:Label><asp:Button ID="ButtonHere" Text="here" runat="server" OnClick="ButtonHere_Click" />
                            </center>
                        </div>




                    </div>




                </div>

            </div>
        </div>
    </section>
</asp:Content>
