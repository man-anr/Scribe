<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.Master" AutoEventWireup="true" CodeBehind="QTFResult.aspx.cs" Inherits="DatabaseProject.QTFResult" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodycontent" runat="server">
    <asp:Button ID="ListSubject" Text="List Subject" runat="server" OnClick="ListSubjectButton_Click" />
    <asp:Button ID="LogOut" Text="Log Out" runat="server" OnClick="LogOutButton_Click" />
    <br />
    <div class="row">
      <div class="column">
          <label>Subject Name: </label> <br />
          <label>Subject Code: </label><br />
      </div>
      <div class="column">
          <label><%=Session["SubjectName"] %></label><br />
          <label><%=Session["SubjectID"] %></label><br />
      </div>
    </div>
    <asp:DataGrid ID="dgQTFResult" runat="server" AllowPaging="True" AutoGenerateColumns="false" BackColor="White" 
        BorderColor="Transparent" BorderStyle="Solid" OnPageIndexChanged="dgQTFResult_PageIndexChanged" PageSize="10" ShowFooter="true" Width="900px">             
        <AlternatingItemStyle CssClass="Even_Row_Admin" />
        <HeaderStyle CssClass="Table_Header_Admin" />
        <Columns>
            <asp:TemplateColumn HeaderText="No">
                 <ItemTemplate>
                     <%# Container.ItemIndex + 1 %>
                </ItemTemplate>                
                <ItemStyle Width="20%" />
                <HeaderStyle Font-Bold="True" />
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="Student Name">
                <ItemTemplate>
                    <asp:Label ID="lbl_QTF_Result_StudentName" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "stud_name") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="20%" />
                <HeaderStyle Font-Bold="True" />
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="Student ID">
                <ItemTemplate>
                    <asp:Label ID="lbl_QTF_Result_StudentID" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "stud_id") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="20%" />
                <HeaderStyle Font-Bold="True" />
            </asp:TemplateColumn>
             <asp:TemplateColumn HeaderText="Result Quiz True/False">
                <ItemTemplate>
                    <asp:Label ID="lbl_QTF_Result_StudentMark" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "quiz_tf_mark") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="20%" />
                <HeaderStyle Font-Bold="True" />
            </asp:TemplateColumn>
        </Columns>
        <PagerStyle Mode="NumericPages" />
    </asp:DataGrid>
    <asp:Label ID="lblAttention" runat="server" CssClass="Note"></asp:Label>
</asp:Content>
