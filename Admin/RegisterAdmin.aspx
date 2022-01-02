﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminPage.Master" AutoEventWireup="true" CodeBehind="RegisterAdmin.aspx.cs" Inherits="Scribe.RegisterAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodycontent" runat="server">

    <div class="card text-center m-4">
        <div class="card-header">
            Register an admin
        </div>
        <div class="card-body">
            <asp:DataGrid Width="800px" ID="dgAdmin" runat="server" AllowPaging="False" AutoGenerateColumns="false" BackColor="" BorderColor="Transparent" BorderStyle="None" OnCancelCommand="dgCancel_Admin" OnEditCommand="dgEdit_Admin" OnItemCommand="dgAdmin_ItemCommand" OnItemDataBound="dgAdmin_ItemDataBound" OnPageIndexChanged="dgAdmin_PageIndexChanged" OnUpdateCommand="dgUpdate_Admin" PageSize="10" ShowFooter="true">
                <AlternatingItemStyle CssClass="Even_Row_Admin" />
                <HeaderStyle CssClass="Table_Header_Admin" />
                <Columns>
                    <asp:TemplateColumn HeaderText="Admin ID">
                        <ItemTemplate>
                            <asp:Label ID="IDAdmin" runat="server" Visible="false" Text='<%# DataBinder.Eval(Container.DataItem, "admin_id") %>'></asp:Label>
                            <asp:Label ID="lbl_Admin_ID" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "admin_id") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_IDAdmin" runat="server" Visible="false" Text='<%#DataBinder.Eval(Container.DataItem, "admin_id") %>'></asp:TextBox>
                            <asp:TextBox ID="txt_Admin_ID" runat="server" MaxLength="50" Text='<%# DataBinder.Eval(Container.DataItem, "admin_id") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txt_Admin_ID_New" MaxLength="50" runat="server"></asp:TextBox>
                        </FooterTemplate>
                        <ItemStyle Width="20%" />
                        <HeaderStyle Font-Bold="True" />
                    </asp:TemplateColumn>
                    <asp:TemplateColumn HeaderText="Admin Name">
                        <ItemTemplate>
                            <asp:Label ID="lbl_Admin_Name" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "admin_name") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_Admin_Name" runat="server" MaxLength="50" Text='<%# DataBinder.Eval(Container.DataItem, "admin_name") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txt_Admin_Name_New" MaxLength="50" runat="server"></asp:TextBox>
                        </FooterTemplate>
                        <ItemStyle Width="20%" />
                        <HeaderStyle Font-Bold="True" />
                    </asp:TemplateColumn>
                    <asp:EditCommandColumn ButtonType="PushButton" CancelText="Cancel" EditText="Update" HeaderText="Update" UpdateText="Update"  >
                        <HeaderStyle Font-Bold="True" />
                        
                    </asp:EditCommandColumn>
                    <asp:TemplateColumn HeaderText="Delete">
                        <HeaderStyle Font-Bold="True" />
                        <ItemTemplate>
                            <asp:Button ID="btnDeleteAdmin" runat="server" CommandName="DeleteAdmin" Text="Delete" />
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:Button ID="btnAddAdmin" runat="server" CommandName="AddAdmin" Text="Add" />
                        </FooterTemplate>
                    </asp:TemplateColumn>
                </Columns>
                <PagerStyle Mode="NumericPages" />
            </asp:DataGrid>
            <asp:Label ID="lblAttention" runat="server" CssClass="Note"></asp:Label>

        </div>
    </div>





</asp:Content>
