<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="DatabaseProject.Admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style4 {
            height: 362px;
            font-size: x-large;
        }
        </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodycontent" runat="server">
    <center class="auto-style4">
        WELCOME <strong><asp:Label ID="lblid" runat="server"></asp:Label>
        <br />
        <br />
        </strong>      
        <table>
            </table>
        <asp:Button ID="RegisterAdmin" runat="server" Text="Register Admin" OnClick="RegisterAdmin_Click1" />
        <br />
        <br />
        <asp:Button ID="RegisterStudent" runat="server" Text="Register Student" OnClick="RegisterStudent_Click" />
        <br />
        <br />
        <asp:Button ID="RegisterLecturer" runat="server" Text="Register Lecturer" OnClick="RegisterLecturer_Click" />
        <br />
        <br />
        <asp:Button ID="RegisterSubject" runat="server" Text="Register Subject" OnClick="RegisterSubject_Click" />
        <br />
        <br />
        <asp:Button ID="RegisterWorkloadLecturer" runat="server" Text="Register Workload Lecturer" OnClick="RegisterWorkloadLecturer_Click" />
        <br />
      </center>
</asp:Content>
