<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminPage.Master" AutoEventWireup="true" CodeBehind="TakeQuizTF.aspx.cs" Inherits="Scribe.TakeQuizTF" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodycontent" runat="server">
    <asp:Button ID="ListSubject" Text="Subject List Registered" runat="server" OnClick="SubjectListRegisterButton_Click" />
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
    <asp:DataGrid ID="dgTakeQuizTF" runat="server" AllowPaging="True" AutoGenerateColumns="false" BackColor="White" BorderColor="Transparent" BorderStyle="Solid" OnItemCommand="dgTakeQuizTF_ItemCommand" OnItemDataBound="dgTakeQuizTF_ItemDataBound" OnPageIndexChanged="dgTakeQuizTF_PageIndexChanged" PageSize="10" ShowFooter="true" Width="900px">             
        <AlternatingItemStyle CssClass="Even_Row_Admin" />
        <HeaderStyle CssClass="Table_Header_Admin" />
        <Columns>
            <asp:TemplateColumn HeaderText="No">
                 <ItemTemplate>
                    <asp:Label ID="lbl_ID_QuizObj" Visible="false" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "quiz_tf_id") %>'></asp:Label>
                     <%# Container.ItemIndex + 1 %>
                 </ItemTemplate>                
                <ItemStyle Width="5%" />
                <HeaderStyle Font-Bold="True" />
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="Question">
                <ItemTemplate>
                    <asp:Label ID="lbl_QuizObj_Question" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "quiz_tf_question") %>'></asp:Label>
                </ItemTemplate>                
                <ItemStyle Width="45%" />
                <HeaderStyle Font-Bold="True" />
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="True or False">
                <ItemTemplate>
                    <asp:Label ID="lbl_Correct_Ans" Visible="false" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "true") %>'></asp:Label>
                    <asp:RadioButtonList ID="radio_ans" runat="server">
                        <asp:ListItem Value="True">True</asp:ListItem>
                        <asp:ListItem Value="False">False</asp:ListItem>
                     </asp:RadioButtonList>
                </ItemTemplate>
                <ItemStyle Width="25%" />
                <HeaderStyle Font-Bold="True" />
            </asp:TemplateColumn>           
            <asp:TemplateColumn HeaderText="Confirm Your Answer">
                <ItemTemplate>
                    <asp:Label ID="lbl_Confirm" Visible="false" runat="server"></asp:Label>
                    <asp:Button ID="btnConfirmAnswer" Runat="server" CommandName="ConfirmAnswer" Text="Confirm" Enabled="true"/>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:Button ID="btnFinishAnswer" Runat="server" CommandName="FinishAnswer" Text="Finish" Enabled="true"/>
                </FooterTemplate>
                <ItemStyle Width="25%" />
                <HeaderStyle Font-Bold="True" />
            </asp:TemplateColumn>                             
        </Columns>
        <PagerStyle Mode="NumericPages" />
    </asp:DataGrid>
    <asp:Label ID="lblAttention" runat="server" CssClass="Note"></asp:Label><br />
</asp:Content>
