<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Student.Master" AutoEventWireup="true" CodeBehind="StudentRegisterSubject.aspx.cs" Inherits="Scribe.StudentRegisterSubject" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodycontent" runat="server">

    <asp:Button ID="ListSubject" Text="Subject List Registered" runat="server" OnClick="SubjectListRegisterButton_Click" CssClass="btn btn-outline-primary" />
    <%--<asp:Button ID="LogOut" Text="Log Out" runat="server" OnClick="LogOutButton_Click" />--%>
    

    <ul class="list-group list-group-flush">
        <li class="list-group-item"><h1>Available subjects:</h1></li>
        <li class="list-group-item">
            <asp:DataGrid ID="dgStudRegisterSubject" runat="server" AllowPaging="false" AutoGenerateColumns="false" BackColor="White" BorderColor="Transparent" BorderStyle="Solid" OnItemCommand="dgStudRegisterSubject_ItemCommand" OnItemDataBound="dgStudRegisterSubject_ItemDataBound" OnPageIndexChanged="dgStudRegisterSubject_PageIndexChanged" PageSize="10" ShowFooter="true" Width="100%">
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
                            <asp:Label ID="lbl_LecturerName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lect_name") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="30%" />
                        <HeaderStyle Font-Bold="True" />
                    </asp:TemplateColumn>
                    <asp:TemplateColumn HeaderText="Subject">
                        <ItemTemplate>
                            <asp:Label ID="lbl_SubjectName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "subj_name") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="30%" />
                        <HeaderStyle Font-Bold="True" />
                    </asp:TemplateColumn>
                    <asp:TemplateColumn HeaderText="">
                        <HeaderStyle Font-Bold="True" />
                        <ItemTemplate>
                            <asp:Button ID="btnRegisterSubject" runat="server" CommandName="RegisterSubject" Text="Register" CssClass="btn btn-info text-white"/>
                        </ItemTemplate>
                        <ItemStyle Width="30%" />
                    </asp:TemplateColumn>
                </Columns>
                <PagerStyle Mode="NumericPages" />
            </asp:DataGrid>
            <asp:Label ID="lblAttention" runat="server" CssClass="Note"></asp:Label>
        </li>
    </ul>


</asp:Content>
