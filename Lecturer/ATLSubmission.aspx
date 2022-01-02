<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Lecturer.Master" AutoEventWireup="true" CodeBehind="ATLSubmission.aspx.cs" Inherits="Scribe.ATLSubmission" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodycontent" runat="server">

    <div class="row">
      <div class="column">
          <label>Subject Name: </label> <label><%=Session["SubjectName"] %></label><br />
          <label>Subject Code: </label> <label><%=Session["SubjectID"] %></label><br />
          <label>Assignment/Tutorial/Lab: </label> <label><%=Session["ATL_Name"] %></label><br />
      </div>
      
    </div>
    <asp:DataGrid ID="dgATLSubmission" runat="server" AllowPaging="False" AutoGenerateColumns="false" BackColor="White" BorderColor="Transparent" BorderStyle="Solid" OnItemCommand="dgATLSubmission_ItemCommand" OnItemDataBound="dgATLSubmission_ItemDataBound" OnPageIndexChanged="dgATLSubmission_PageIndexChanged" PageSize="10" ShowFooter="true" Width="100%">             
        <AlternatingItemStyle CssClass="Even_Row_Admin" />
        <HeaderStyle CssClass="Table_Header_Admin" />
        <Columns>
            <asp:TemplateColumn HeaderText="No">
                 <ItemTemplate>
                    <asp:Label ID="lbl_ID_ATLSubmission" Visible="false" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "atlsubmission_id") %>'></asp:Label>
                     <%# Container.ItemIndex + 1 %>
                </ItemTemplate>                
                <ItemStyle Width="5%" />
                <HeaderStyle Font-Bold="True" />
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="STUDENT NAME">
                <ItemTemplate>
                    <asp:Label ID="lbl_ATLSubmission_StudentName" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "stud_name") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="24%" />
                <HeaderStyle Font-Bold="True" />
              </asp:TemplateColumn>
             <asp:TemplateColumn HeaderText="STUDENT NUMBER">
                <ItemTemplate>
                    <asp:Label ID="lbl_ATLSubmission_StudentID" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "atlsubmission_stud_id") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="24%" />
                <HeaderStyle Font-Bold="True" />
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="File Name">
                <ItemTemplate>
                    <asp:Label ID="lbl_ATLSubmission_FileName" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "atlsubmission_file_name") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="24%" />
                <HeaderStyle Font-Bold="True" />
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="">
                <HeaderStyle Font-Bold="True" />
                <ItemTemplate>
                    <asp:Button ID="btnViewATLSubmission" Runat="server" CommandName="ViewATLSubmission" Text="View" CssClass="btn btn-success text-white"/>
                </ItemTemplate>
                <ItemStyle Width="23%" />
            </asp:TemplateColumn>
        </Columns>
        <PagerStyle Mode="NumericPages" />
    </asp:DataGrid>
    <asp:Label ID="lblAttention" runat="server" CssClass="Note"></asp:Label>
</asp:Content>
