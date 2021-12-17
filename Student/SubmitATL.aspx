<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.Master" AutoEventWireup="true" CodeBehind="SubmitATL.aspx.cs" Inherits="DatabaseProject.SubmitATL" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodycontent" runat="server">
    <asp:Button ID="ListSubject" Text="Subject List Registered" runat="server" OnClick="SubjectListRegisterButton_Click" />
    <asp:Button ID="LogOut" Text="Log Out" runat="server" OnClick="LogOutButton_Click" />
    <br />
    <div class="row">
      <div class="column">
          <label>Subject Name: </label> <br />
          <label>Subject Code: </label><br />
          <label>Assignment/Tutorial/Lab: </label><br />
          <label>File:</label>
      </div>
      <div class="column">
          <label><%=Session["SubjectName"] %></label><br />
          <label><%=Session["SubjectID"] %></label><br />
          <label><%=Session["ATL_Name"] %></label><br />
          <asp:FileUpload ID="fileupload" runat="server"></asp:FileUpload>
      </div>
      <div class="column">
          <br />
          <br />
          <br />
          <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUploadDocument" />
      </div>
    </div>
    <br />
    <asp:Label ID="lblAttention" runat="server" CssClass="Note"></asp:Label>
</asp:Content>
