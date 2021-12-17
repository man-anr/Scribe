<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.Master" AutoEventWireup="true" CodeBehind="LecturerSubject.aspx.cs" Inherits="DatabaseProject.LecturerSubject" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodycontent" runat="server">
   <asp:DataGrid ID="dgLecturerSubject" runat="server" AllowPaging="True" AutoGenerateColumns="false" BackColor="White" BorderColor="Transparent" BorderStyle="Solid" OnItemCommand="dgLecturerSubject_ItemCommand" OnItemDataBound="dgLecturerSubject_ItemDataBound" OnPageIndexChanged="dgLecturerSubject_PageIndexChanged" PageSize="10" ShowFooter="true" Width="900px">
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
                    <asp:Label ID="lbl_SubjectName" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "subj_name") %>'></asp:Label>
                    <asp:Label ID="lbl_SubjectID" visible="false" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "subj_id") %>'></asp:Label>
                </ItemTemplate>           
                <ItemStyle Width="20%" />
                <HeaderStyle Font-Bold="True" />
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="Create Assignment/Tutorial">
                <HeaderStyle Font-Bold="True" />
                <ItemTemplate>
                    <asp:Button ID="btnCreate" Runat="server" CommandName="CreateTutorial" Text="Create" />
                </ItemTemplate>           
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="Quiz True/False">
                <HeaderStyle Font-Bold="True" />
                <ItemTemplate>
                    <asp:Button ID="btnResultTF" Runat="server" CommandName="ResultTF" Text="Result" />
                    <br/>
                    <asp:Button ID="btnCreateViewQuizTF" Runat="server" CommandName="CreateViewQuizTF" Text="Create/View Quiz" />
                </ItemTemplate>           
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="Quiz Objective">
                <HeaderStyle Font-Bold="True" />
                <ItemTemplate>
                    <asp:Button ID="btnResultObj" Runat="server" CommandName="ResultObj" Text="Result" />
                    <br/>
                    <asp:Button ID="btnCreateViewQuizObj" Runat="server" CommandName="CreateViewQuizObj" Text="Create/View Quiz" />                   
                </ItemTemplate>           
            </asp:TemplateColumn>
        </Columns>
        <PagerStyle Mode="NumericPages" />
    </asp:DataGrid>
    <asp:Label ID="lblAttention" runat="server" CssClass="Note"></asp:Label>
</asp:Content>