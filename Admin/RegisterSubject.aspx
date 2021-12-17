<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.Master" AutoEventWireup="true" CodeBehind="RegisterSubject.aspx.cs" Inherits="DatabaseProject.RegisterSubject" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodycontent" runat="server">
 <asp:DataGrid ID="dgSubject" runat="server" AllowPaging="True" AutoGenerateColumns="false" BackColor="White" BorderColor="Transparent" BorderStyle="Solid" OnCancelCommand="dgCancel_Subject" OnEditCommand="dgEdit_Subject" OnItemCommand="dgSubject_ItemCommand" OnItemDataBound="dgSubject_ItemDataBound" OnPageIndexChanged="dgSubject_PageIndexChanged" OnUpdateCommand="dgUpdate_Subject" PageSize="10" ShowFooter="true" Width="900px">
        <AlternatingItemStyle CssClass="Even_Row_Admin" />
        <HeaderStyle CssClass="Table_Header_Admin" />
        <Columns>
            <asp:TemplateColumn HeaderText="Subject ID">
                <ItemTemplate>
                    <asp:Label ID="IDSubject" Runat="server" Visible="false" Text='<%# DataBinder.Eval(Container.DataItem, "subj_id") %>'></asp:Label>
                    <asp:Label ID="lbl_Subject_ID" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "subj_id") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txt_IDSubject" runat="server" Visible="false" Text='<%#DataBinder.Eval(Container.DataItem, "subj_id") %>'></asp:TextBox>
                    <asp:TextBox ID="txt_Subject_ID" runat="server" MaxLength="50" Text='<%# DataBinder.Eval(Container.DataItem, "subj_id") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txt_Subject_ID_New" MaxLength="50" runat="server"></asp:TextBox>
                </FooterTemplate>
                <ItemStyle Width="20%" />
                <HeaderStyle Font-Bold="True" />
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="Subject Name">
                <ItemTemplate>
                    <asp:Label ID="lbl_Subject_Name" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "subj_name") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txt_Subject_Name" runat="server" MaxLength="50" Text='<%# DataBinder.Eval(Container.DataItem, "subj_name") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txt_Subject_Name_New" MaxLength="50"  runat="server"></asp:TextBox>
                </FooterTemplate>
                <ItemStyle Width="20%" />
                <HeaderStyle Font-Bold="True" />
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="Modified By">
                <ItemTemplate>
                    <asp:Label ID="lbl_Subject_Modified_By" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "subj_modified_by") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="20%" />
                <HeaderStyle Font-Bold="True" />
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="Modified On">
                <ItemTemplate>
                    <asp:Label ID="lbl_Subject_Modified_On" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "subj_modified_date_time") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="20%" />
                <HeaderStyle Font-Bold="True" />
            </asp:TemplateColumn>
            <asp:EditCommandColumn ButtonType="PushButton" CancelText="Cancel" EditText="Update" HeaderText="Update" UpdateText="Update"><HeaderStyle Font-Bold="True" /></asp:EditCommandColumn>
            <asp:TemplateColumn HeaderText="Delete">
                <HeaderStyle Font-Bold="True" />
                <ItemTemplate>
                    <asp:Button ID="btnDeleteSubject" Runat="server" CommandName="DeleteSubject" Text="Delete" />
                </ItemTemplate>
                <FooterTemplate>
                    <asp:Button ID="btnAddSubject" Runat="server" CommandName="AddSubject" Text="Add" />
                </FooterTemplate>
            </asp:TemplateColumn>
        </Columns>
        <PagerStyle Mode="NumericPages" />
    </asp:DataGrid>
    <asp:Label ID="lblAttention" runat="server" CssClass="Note"></asp:Label>
    <br />
    <a href="Admin.aspx">BACK</a>
</asp:Content>
