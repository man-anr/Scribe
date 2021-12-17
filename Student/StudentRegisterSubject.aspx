<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.Master" AutoEventWireup="true" CodeBehind="StudentRegisterSubject.aspx.cs" Inherits="DatabaseProject.StudentRegisterSubject" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodycontent" runat="server">
    <asp:Button ID="ListSubject" Text="Subject List Registered" runat="server" OnClick="SubjectListRegisterButton_Click" />
    <asp:Button ID="LogOut" Text="Log Out" runat="server" OnClick="LogOutButton_Click" />
    <asp:DataGrid ID="dgStudRegisterSubject" runat="server" AllowPaging="True" AutoGenerateColumns="false" BackColor="White" BorderColor="Transparent" BorderStyle="Solid" OnItemCommand="dgStudRegisterSubject_ItemCommand" OnItemDataBound="dgStudRegisterSubject_ItemDataBound" OnPageIndexChanged="dgStudRegisterSubject_PageIndexChanged" PageSize="10" ShowFooter="true" Width="900px">
        <AlternatingItemStyle CssClass="Even_Row_Admin" />
        <HeaderStyle CssClass="Table_Header_Admin" />
        <Columns>
             <asp:TemplateColumn HeaderText="No">
                <ItemTemplate>
                    <asp:Label ID="lbl_WorkloadID" Visible="false" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "id") %>'></asp:Label>
                    <asp:Label ID="lbl_SubjID" Visible="false" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "subj_id") %>'></asp:Label>
                     <%# Container.ItemIndex + 1 %>
                </ItemTemplate>
                <ItemStyle Width="10%" />
                <HeaderStyle Font-Bold="True" />
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="Lecturer">
                <ItemTemplate>                  
                    <asp:Label ID="lbl_LecturerName" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lect_name") %>'></asp:Label>
                </ItemTemplate>           
                <ItemStyle Width="30%" />
                <HeaderStyle Font-Bold="True" />
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="Subject">
                <ItemTemplate>                  
                    <asp:Label ID="lbl_SubjectName" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "subj_name") %>'></asp:Label>
                </ItemTemplate>           
                <ItemStyle Width="30%" />
                <HeaderStyle Font-Bold="True" />
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="Register">
                <HeaderStyle Font-Bold="True" />
                <ItemTemplate>
                    <asp:Button ID="btnRegisterSubject" Runat="server" CommandName="RegisterSubject" Text="Register" />
                </ItemTemplate>     
                <ItemStyle Width="30%" />
            </asp:TemplateColumn>
            </Columns>
        <PagerStyle Mode="NumericPages" />
    </asp:DataGrid>
    <asp:Label ID="lblAttention" runat="server" CssClass="Note"></asp:Label>
</asp:Content>
