<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminPage.Master" AutoEventWireup="true" CodeBehind="RegisterStudent.aspx.cs" Inherits="Scribe.RegisterStudent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodycontent" runat="server">
    <asp:DataGrid ID="dgStudent" runat="server" AllowPaging="True" AutoGenerateColumns="false" BackColor="White" BorderColor="Transparent" BorderStyle="Solid" OnCancelCommand="dgCancel_Student" OnEditCommand="dgEdit_Student" OnItemCommand="dgStudent_ItemCommand" OnItemDataBound="dgStudent_ItemDataBound" OnPageIndexChanged="dgStudent_PageIndexChanged" OnUpdateCommand="dgUpdate_Student" PageSize="10" ShowFooter="true" Width="900px">
        <AlternatingItemStyle CssClass="Even_Row_Admin" />
        <HeaderStyle CssClass="Table_Header_Admin" />
        <Columns>
            <asp:TemplateColumn HeaderText="Student ID">
                <ItemTemplate>
                    <asp:Label ID="IDStudent" Runat="server" Visible="false" Text='<%# DataBinder.Eval(Container.DataItem, "stud_id") %>'></asp:Label>
                    <asp:Label ID="lbl_Student_ID" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "stud_id") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txt_IDStudent" runat="server" Visible="false" Text='<%#DataBinder.Eval(Container.DataItem, "stud_id") %>'></asp:TextBox>
                    <asp:TextBox ID="txt_Student_ID" runat="server" MaxLength="50" Text='<%# DataBinder.Eval(Container.DataItem, "stud_id") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txt_Student_ID_New" MaxLength="50" runat="server"></asp:TextBox>
                </FooterTemplate>
                <ItemStyle Width="20%" />
                <HeaderStyle Font-Bold="True" />
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="Student Name">
                <ItemTemplate>
                    <asp:Label ID="lbl_Student_Name" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "stud_name") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txt_Student_Name" runat="server" MaxLength="50" Text='<%# DataBinder.Eval(Container.DataItem, "stud_name") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txt_Student_Name_New" MaxLength="50" runat="server"></asp:TextBox>
                </FooterTemplate>
                <ItemStyle Width="20%" />
                <HeaderStyle Font-Bold="True" />
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="Student Email">
                <ItemTemplate>
                    <asp:Label ID="lbl_Student_Email" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "stud_email") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="20%" />
                <HeaderStyle Font-Bold="True" />
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="Modified By">
                <ItemTemplate>
                    <asp:Label ID="lbl_Student_Modified_By" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "modified_by") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="20%" />
                <HeaderStyle Font-Bold="True" />
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="Modified On">
                <ItemTemplate>
                    <asp:Label ID="lbl_Student_Modified_On" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "modified_date_time") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="20%" />
                <HeaderStyle Font-Bold="True" />
            </asp:TemplateColumn>
            <asp:EditCommandColumn ButtonType="PushButton" CancelText="Cancel" EditText="Update" HeaderText="Update" UpdateText="Update"><HeaderStyle Font-Bold="True" /></asp:EditCommandColumn>
            <asp:TemplateColumn HeaderText="Delete">
                <HeaderStyle Font-Bold="True" />
                <ItemTemplate>
                    <asp:Button ID="btnDeleteStudent" Runat="server" CommandName="DeleteStudent" Text="Delete" />
                </ItemTemplate>
                <FooterTemplate>
                    <asp:Button ID="btnAddStudent" Runat="server" CommandName="AddStudent" Text="Add" />
                </FooterTemplate>
            </asp:TemplateColumn>
        </Columns>
        <PagerStyle Mode="NumericPages" />
    </asp:DataGrid>
    <asp:Label ID="lblAttention" runat="server" CssClass="Note"></asp:Label>
    <br />
    <a href="Admin.aspx">BACK</a>
</asp:Content>