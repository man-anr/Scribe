<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Student.Master" AutoEventWireup="true" CodeBehind="SubmitATL.aspx.cs" Inherits="Scribe.SubmitATL" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodycontent" runat="server">
    <%--<asp:Button ID="ListSubject" Text="Subject List Registered" runat="server" OnClick="SubjectListRegisterButton_Click" />
    <asp:Button ID="LogOut" Text="Log Out" runat="server" OnClick="LogOutButton_Click" />--%>

    <ul class="list-group list-group-flush">
        <li class="list-group-item">
            <label>Subject Name: </label>
            <label><%=Session["SubjectName"] %></label>

        </li>
        <li class="list-group-item">
            <label>Subject Code: </label>
            <label><%=Session["SubjectID"] %></label>
        </li>
        <li class="list-group-item">
            <label>Assignment/Tutorial/Lab: </label>
            <label><%=Session["ATL_Name"] %></label>
        </li>
        <li class="list-group-item">
            <label>File:</label>
            <asp:FileUpload ID="fileupload" runat="server"></asp:FileUpload>
        </li>
        <li class="list-group-item">
            <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUploadDocument" Width="" CssClass="btn btn-success text-white" /></li>
    </ul>

    <br />
    <asp:Label ID="lblAttention" runat="server" CssClass="Note"></asp:Label>
</asp:Content>
