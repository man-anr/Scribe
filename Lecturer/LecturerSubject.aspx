<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Lecturer.Master" AutoEventWireup="true" CodeBehind="LecturerSubject.aspx.cs" Inherits="Scribe.LecturerSubject" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodycontent" runat="server">

    <asp:DataGrid ID="dgLecturerSubject" runat="server" AllowPaging="false" AutoGenerateColumns="false" BackColor="White" BorderColor="Transparent" BorderStyle="Solid" OnItemCommand="dgLecturerSubject_ItemCommand" OnItemDataBound="dgLecturerSubject_ItemDataBound" OnPageIndexChanged="dgLecturerSubject_PageIndexChanged" PageSize="10" ShowFooter="true" Width="100%">
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
            <asp:TemplateColumn HeaderText="Subject Name">
                <ItemTemplate>
                    <asp:Label ID="lbl_SubjectName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "subj_name") %>'></asp:Label>
                    <asp:Label ID="lbl_SubjectID" Visible="false" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "subj_id") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="20%" />
                <HeaderStyle Font-Bold="True" />
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="Tutorial">
                <HeaderStyle Font-Bold="True" />
                <ItemTemplate>
                    <asp:Button ID="btnCreate" runat="server" CommandName="CreateTutorial" Text="Manage" CssClass="btn btn-primary text-white" />
                </ItemTemplate>
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="Quiz True/False">
                <HeaderStyle Font-Bold="True" />
                <ItemTemplate>
                    <asp:Button ID="btnResultTF" runat="server" CommandName="ResultTF" Text="Result" CssClass="btn btn-success text-white" />

                    <asp:Button ID="btnCreateViewQuizTF" runat="server" CommandName="CreateViewQuizTF" Text="Manage" CssClass="btn btn-warning text-white" />
                </ItemTemplate>
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="Quiz Objective">
                <HeaderStyle Font-Bold="True" />
                <ItemTemplate>
                    <asp:Button ID="btnResultObj" runat="server" CommandName="ResultObj" Text="Result" CssClass="btn btn-success text-white" />

                    <asp:Button ID="btnCreateViewQuizObj" runat="server" CommandName="CreateViewQuizObj" Text="Manage" CssClass="btn btn-warning text-white" />
                </ItemTemplate>
            </asp:TemplateColumn>
        </Columns>
        <PagerStyle Mode="NumericPages" />
    </asp:DataGrid>
    <asp:Label ID="lblAttention" runat="server" CssClass="Note"></asp:Label>
</asp:Content>
