<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.Master" AutoEventWireup="true" CodeBehind="RegisterLecturer.aspx.cs" Inherits="DatabaseProject.RegisterLecturer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodycontent" runat="server">
 <asp:DataGrid ID="dgLecturer" runat="server" AllowPaging="True" AutoGenerateColumns="false" BackColor="White" BorderColor="Transparent" BorderStyle="Solid" OnCancelCommand="dgCancel_Lecturer" OnEditCommand="dgEdit_Lecturer" OnItemCommand="dgLecturer_ItemCommand" OnItemDataBound="dgLecturer_ItemDataBound" OnPageIndexChanged="dgLecturer_PageIndexChanged" OnUpdateCommand="dgUpdate_Lecturer" PageSize="10" ShowFooter="true" Width="900px">
        <AlternatingItemStyle CssClass="Even_Row_Admin" />
        <HeaderStyle CssClass="Table_Header_Admin" />
        <Columns>
            <asp:TemplateColumn HeaderText="Lecturer ID">
                <ItemTemplate>
                    <asp:Label ID="IDLecturer" Runat="server" Visible="false" Text='<%# DataBinder.Eval(Container.DataItem, "lect_id") %>'></asp:Label>
                    <asp:Label ID="lbl_Lecturer_ID" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lect_id") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txt_IDLecturer" runat="server" Visible="false" Text='<%#DataBinder.Eval(Container.DataItem, "lect_id") %>'></asp:TextBox>
                    <asp:TextBox ID="txt_Lecturer_ID" runat="server" MaxLength="50" Text='<%# DataBinder.Eval(Container.DataItem, "lect_id") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txt_Lecturer_ID_New" runat="server"></asp:TextBox>
                </FooterTemplate>
                <ItemStyle Width="20%" />
                <HeaderStyle Font-Bold="True" />
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="Lecturer Name">
                <ItemTemplate>
                    <asp:Label ID="lbl_Lecturer_Name" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lect_name") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txt_Lecturer_Name" MaxLength="50" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lect_name") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txt_Lecturer_Name_New" MaxLength="50" runat="server"></asp:TextBox>
                </FooterTemplate>
                <ItemStyle Width="20%" />
                <HeaderStyle Font-Bold="True" />
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="Modified By">
                <ItemTemplate>
                    <asp:Label ID="lbl_Lecturer_Modified_By" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lect_modified_by") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="20%" />
                <HeaderStyle Font-Bold="True" />
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="Modified On">
                <ItemTemplate>
                    <asp:Label ID="lbl_Lecturer_Modified_On" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lect_modified_date_time") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="20%" />
                <HeaderStyle Font-Bold="True" />
            </asp:TemplateColumn>
            <asp:EditCommandColumn ButtonType="PushButton" CancelText="Cancel" EditText="Update" HeaderText="Update" UpdateText="Update"><HeaderStyle Font-Bold="True" /></asp:EditCommandColumn>
            <asp:TemplateColumn HeaderText="Delete">
                <HeaderStyle Font-Bold="True" />
                <ItemTemplate>
                    <asp:Button ID="btnDeleteLecturer" Runat="server" CommandName="DeleteLecturer" Text="Delete" />
                </ItemTemplate>
                <FooterTemplate>
                    <asp:Button ID="btnAddLecturer" Runat="server" CommandName="AddLecturer" Text="Add" />
                </FooterTemplate>
            </asp:TemplateColumn>
        </Columns>
        <PagerStyle Mode="NumericPages" />
    </asp:DataGrid>
    <asp:Label ID="lblAttention" runat="server" CssClass="Note"></asp:Label>
    <br />
    <a href="Admin.aspx">BACK</a>
</asp:Content>