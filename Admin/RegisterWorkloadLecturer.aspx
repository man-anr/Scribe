<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.Master" AutoEventWireup="true" CodeBehind="RegisterWorkloadLecturer.aspx.cs" Inherits="DatabaseProject.RegisterWorkloadLecturer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodycontent" runat="server">
     <asp:DataGrid ID="dgWorkloadLecturer" runat="server" AllowPaging="True" AutoGenerateColumns="false" BackColor="White" BorderColor="Transparent" BorderStyle="Solid" OnCancelCommand="dgCancel_WorkloadLecturer" OnEditCommand="dgEdit_WorkloadLecturer" OnItemCommand="dgWorkloadLecturer_ItemCommand" OnItemDataBound="dgWorkloadLecturer_ItemDataBound" OnPageIndexChanged="dgWorkloadLecturer_PageIndexChanged" OnUpdateCommand="dgUpdate_WorkloadLecturer" PageSize="10" ShowFooter="true" Width="900px">
        <AlternatingItemStyle CssClass="Even_Row_Admin" />
        <HeaderStyle CssClass="Table_Header_Admin" />
        <Columns>
             <asp:TemplateColumn HeaderText="No">
                <ItemTemplate>
                    <asp:Label ID="lbl_ID" Visible="false" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "id") %>'></asp:Label>
                     <%# Container.ItemIndex + 1 %>
                </ItemTemplate>
                <ItemStyle Width="20%" />
                <HeaderStyle Font-Bold="True" />
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="Lecturer">
                <ItemTemplate>
                    <asp:Label ID="lbl_LecturerID" Runat="server" Visible="false" Text='<%# DataBinder.Eval(Container.DataItem, "lect_id") %>'></asp:Label>
                    <asp:Label ID="lbl_LecturerName" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lect_name") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                     <asp:DropDownList ID="ddledit_LecturerName" OnPreRender="SetLecturerDropDownIndex" runat="server"></asp:DropDownList>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:DropDownList ID="ddlnew_LecturerName" runat="server"></asp:DropDownList>
                </FooterTemplate>
                <ItemStyle Width="20%" />
                <HeaderStyle Font-Bold="True" />
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="Subject">
                <ItemTemplate>
                    <asp:Label ID="lbl_SubjectID" Runat="server" Visible="false" Text='<%# DataBinder.Eval(Container.DataItem, "subj_id") %>'></asp:Label>
                    <asp:Label ID="lbl_SubjectName" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "subj_name") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                     <asp:DropDownList ID="ddledit_SubjectName" OnPreRender="SetSubjectDropDownIndex" runat="server"></asp:DropDownList>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:DropDownList ID="ddlnew_SubjectName" runat="server"></asp:DropDownList>
                </FooterTemplate>
                <ItemStyle Width="20%" />
                <HeaderStyle Font-Bold="True" />
            </asp:TemplateColumn>
             <asp:EditCommandColumn ButtonType="PushButton" CancelText="Cancel" EditText="Update" HeaderText="Update" UpdateText="Update"><HeaderStyle Font-Bold="True" /></asp:EditCommandColumn>
            <asp:TemplateColumn HeaderText="Delete">
                <HeaderStyle Font-Bold="True" />
                <ItemTemplate>
                    <asp:Button ID="btnDeleteWorkload" Runat="server" CommandName="DeleteWorkload" Text="Delete" />
                </ItemTemplate>
                <FooterTemplate>
                    <asp:Button ID="btnAddWorkload" Runat="server" CommandName="AddWorkload" Text="Add" />
                </FooterTemplate>
            </asp:TemplateColumn>
        </Columns>
        <PagerStyle Mode="NumericPages" />
    </asp:DataGrid>
    <asp:Label ID="lblAttention" runat="server" CssClass="Note"></asp:Label>
    <br />
    <a href="Admin.aspx">BACK</a>
</asp:Content>
