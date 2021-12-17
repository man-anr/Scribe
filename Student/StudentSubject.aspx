<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.Master" AutoEventWireup="true" CodeBehind="StudentSubject.aspx.cs" Inherits="DatabaseProject.StudentSubject" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodycontent" runat="server">
    <asp:Button ID="RegisterSubject" Text="Register Subject" runat="server" OnClick="RegisterSubjectButton_Click" />
    <asp:Button ID="LogOut" Text="Log Out" runat="server" OnClick="LogOutButton_Click" />
    <br />
    <h1>Subject List :</h1>
     <asp:DataGrid ID="dgStudentSubject" runat="server" AllowPaging="True" AutoGenerateColumns="false" BackColor="White" BorderColor="Transparent" BorderStyle="Solid" OnItemCommand="dgStudentSubject_ItemCommand" OnItemDataBound="dgStudentSubject_ItemDataBound" OnPageIndexChanged="dgStudentSubject_PageIndexChanged" PageSize="10" ShowFooter="true" Width="900px">
        <AlternatingItemStyle CssClass="Even_Row_Admin" />
        <HeaderStyle CssClass="Table_Header_Admin" />
        <Columns>
             <asp:TemplateColumn HeaderText="No">
                <ItemTemplate>
                    <asp:Label ID="lbl_ID" Visible="false" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "workload_id") %>'></asp:Label>
                     <%# Container.ItemIndex + 1 %>
                </ItemTemplate>
                <ItemStyle Width="5%" />
                <HeaderStyle Font-Bold="True" />
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="Lecturer">
                <ItemTemplate>                  
                    <asp:Label ID="lbl_LecturerName" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lect_name") %>'></asp:Label>
                </ItemTemplate>           
                <ItemStyle Width="20%" />
                <HeaderStyle Font-Bold="True" />
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="Subject">
                <ItemTemplate>                  
                    <asp:Label ID="lbl_SubjectID" visible="false" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "subj_id") %>'></asp:Label>
                    <asp:Label ID="lbl_SubjectName" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "subj_name") %>'></asp:Label>
                </ItemTemplate>           
                <ItemStyle Width="25%" />
                <HeaderStyle Font-Bold="True" />
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="Task">
                <HeaderStyle Font-Bold="True" />
                <ItemTemplate>
                    <asp:Button ID="btnView" Runat="server" CommandName="ViewATL" Text="View" />
                </ItemTemplate> 
                <ItemStyle Width="10%" />
            </asp:TemplateColumn>
             <asp:TemplateColumn HeaderText="Mark T/F">
                <ItemTemplate>                  
                    <asp:Label ID="lbl_QuizTFMark" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "quiz_tf_mark") %>'></asp:Label>
                </ItemTemplate>           
                <ItemStyle Width="20%" />
                 <ItemStyle Width="10%" />
                <HeaderStyle Font-Bold="True" />
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="Quiz T/F">
                <HeaderStyle Font-Bold="True" />
                <ItemTemplate>                    
                    <asp:Button ID="btnViewQuizTF" Runat="server" CommandName="ViewQuizTF" Text="View" />
                </ItemTemplate> 
                <ItemStyle Width="10%" />
            </asp:TemplateColumn>
             <asp:TemplateColumn HeaderText="Mark Objective">
                <ItemTemplate>                  
                    <asp:Label ID="lbl_QuizObjMark" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "quiz_obj_mark") %>'></asp:Label>
                </ItemTemplate>           
                <ItemStyle Width="10%" />
                <HeaderStyle Font-Bold="True" />
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="Quiz Objective">
                <HeaderStyle Font-Bold="True" />
                <ItemTemplate>
                   <asp:Button ID="btnViewQuizObj" Runat="server" CommandName="ViewQuizObj" Text="View Quiz" />                   
                </ItemTemplate>   
                <ItemStyle Width="10%" />
            </asp:TemplateColumn>
        </Columns>
        <PagerStyle Mode="NumericPages" />
    </asp:DataGrid>
    <asp:Label ID="lblAttention" runat="server" CssClass="Note"></asp:Label>
</asp:Content>