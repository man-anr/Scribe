<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.Master" AutoEventWireup="true" CodeBehind="LecturerATL.aspx.cs" Inherits="DatabaseProject.LecturerATL" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodycontent" runat="server">
    <asp:Button ID="ListSubject" Text="List Subject" runat="server" OnClick="ListSubjectButton_Click" />
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
          <asp:TextBox ID="LectATL_Name" runat="server"></asp:TextBox><br />
          <asp:FileUpload ID="fileupload" runat="server"></asp:FileUpload>
      </div>
      <div class="column">
          <br />
          <br />
          <br />
          <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUploadDocument" />
      </div>
    </div>
    <asp:DataGrid ID="dgLectATL" runat="server" AllowPaging="True" AutoGenerateColumns="false" BackColor="White" BorderColor="Transparent" BorderStyle="Solid" OnItemCommand="dgLectATL_ItemCommand" OnItemDataBound="dgLectATL_ItemDataBound" OnPageIndexChanged="dgLectATL_PageIndexChanged" PageSize="10" ShowFooter="true" Width="900px">             
        <AlternatingItemStyle CssClass="Even_Row_Admin" />
        <HeaderStyle CssClass="Table_Header_Admin" />
        <Columns>
            <asp:TemplateColumn HeaderText="No">
                 <ItemTemplate>
                    <asp:Label ID="lbl_ID_LectATL" Visible="false" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "atl_id") %>'></asp:Label>
                     <%# Container.ItemIndex + 1 %>
                </ItemTemplate>                
                <ItemStyle Width="5%" />
                <HeaderStyle Font-Bold="True" />
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="Assignment/Tutorial/Lab">
                <ItemTemplate>
                    <asp:Label ID="lbl_LectATL_Name" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "atl_name") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="25%" />
                <HeaderStyle Font-Bold="True" />
              </asp:TemplateColumn>
             <asp:TemplateColumn HeaderText="File Name">
                <ItemTemplate>
                    <asp:Label ID="lbl_LectATL_FileName" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "atl_file_name") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="30%" />
                <HeaderStyle Font-Bold="True" />
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="Modified By">
                <ItemTemplate>
                    <asp:Label ID="lbl_LectATL_Modified_By" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lect_name") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="20%" />
                <HeaderStyle Font-Bold="True" />
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="Modified On">
                <ItemTemplate>
                    <asp:Label ID="lbl_LectATL_Modified_On" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "atl_modified_date_time") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="20%" />
                <HeaderStyle Font-Bold="True" />
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="View Content">
                <HeaderStyle Font-Bold="True" />
                <ItemTemplate>
                    <asp:Button ID="btnViewATL" Runat="server" CommandName="ViewATL" Text="View" />
                </ItemTemplate>
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="View Submission">
                <HeaderStyle Font-Bold="True" />
                <ItemTemplate>
                    <asp:Button ID="btnSubmissionATL" Runat="server" CommandName="SubmissionATL" Text="Submission" />
                </ItemTemplate>
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="Delete">
                <HeaderStyle Font-Bold="True" />
                <ItemTemplate>
                    <asp:Button ID="btnDeleteATL" Runat="server" CommandName="DeleteATL" Text="Delete" />
                </ItemTemplate>
            </asp:TemplateColumn>
        </Columns>
        <PagerStyle Mode="NumericPages" />
    </asp:DataGrid>
    <asp:Label ID="lblAttention" runat="server" CssClass="Note"></asp:Label>
</asp:Content>