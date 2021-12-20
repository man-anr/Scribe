<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminPage.Master" AutoEventWireup="true" CodeBehind="ViewATL.aspx.cs" Inherits="Scribe.ViewATL" %>
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
      </div>
      <div class="column">
          <label><%=Session["SubjectName"] %></label><br />
          <label><%=Session["SubjectID"] %></label><br />
      </div>
    </div>
    <asp:DataGrid ID="dgViewATL" runat="server" AllowPaging="True" AutoGenerateColumns="false" BackColor="White" BorderColor="Transparent" BorderStyle="Solid" OnItemCommand="dgViewATL_ItemCommand" OnItemDataBound="dgViewATL_ItemDataBound" OnPageIndexChanged="dgViewATL_PageIndexChanged" PageSize="10" ShowFooter="true" Width="900px">             
        <AlternatingItemStyle CssClass="Even_Row_Admin" />
        <HeaderStyle CssClass="Table_Header_Admin" />
        <Columns>
            <asp:TemplateColumn HeaderText="No">
                 <ItemTemplate>
                    <asp:Label ID="lbl_ID_ATL" Visible="false" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "atl_id") %>'></asp:Label>
                     <%# Container.ItemIndex + 1 %>
                </ItemTemplate>                
                <ItemStyle Width="5%" />
                <HeaderStyle Font-Bold="True" />
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="Assignment/Tutorial/Lab">
                <ItemTemplate>
                    <asp:Label ID="lbl_ATL_Name" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "atl_name") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="24%" />
                <HeaderStyle Font-Bold="True" />
              </asp:TemplateColumn>
             <asp:TemplateColumn HeaderText="Your File">
                <ItemTemplate>
                    <asp:Label ID="lbl_SubmittedATL_ID" Runat="server" Visible="false" Text='<%# DataBinder.Eval(Container.DataItem, "atlsubmission_id") %>'></asp:Label>
                    <asp:Label ID="lbl_SubmittedATL_FileName" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "atlsubmission_file_name") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="24%" />
                <HeaderStyle Font-Bold="True" />
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="Download Task">
                <ItemTemplate>
                    <asp:Button ID="btnDownloadATL" Runat="server" CommandName="DownloadATL" Text="Download" />
                </ItemTemplate>
                <ItemStyle Width="24%" />
                <HeaderStyle Font-Bold="True" />
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="Submission">
                <HeaderStyle Font-Bold="True" />
                <ItemTemplate>
                    <asp:Button ID="btnSubmitATL" Runat="server" CommandName="SubmitATL" Text="Submit" />
                </ItemTemplate>
                <ItemStyle Width="23%" />
            </asp:TemplateColumn>
        </Columns>
        <PagerStyle Mode="NumericPages" />
    </asp:DataGrid>
    <asp:Label ID="lblAttention" runat="server" CssClass="Note"></asp:Label>
</asp:Content>
