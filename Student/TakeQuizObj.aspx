<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminPage.Master" AutoEventWireup="true" CodeBehind="TakeQuizObj.aspx.cs" Inherits="Scribe.TakeQuizObj" %>
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
    <asp:DataGrid ID="dgTakeQuizObj" runat="server" AllowPaging="True" AutoGenerateColumns="false" BackColor="White" BorderColor="Transparent" BorderStyle="Solid" OnItemCommand="dgTakeQuizObj_ItemCommand" OnItemDataBound="dgTakeQuizObj_ItemDataBound" OnPageIndexChanged="dgTakeQuizObj_PageIndexChanged" PageSize="10" ShowFooter="true" Width="900px">             
        <AlternatingItemStyle CssClass="Even_Row_Admin" />
        <HeaderStyle CssClass="Table_Header_Admin" />
        <Columns>
            <asp:TemplateColumn HeaderText="No">
                 <ItemTemplate>
                    <asp:Label ID="lbl_ID_QuizObj" Visible="false" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "quiz_obj_id") %>'></asp:Label>
                     <%# Container.ItemIndex + 1 %>
                </ItemTemplate>                
                <ItemStyle Width="5%" />
                <HeaderStyle Font-Bold="True" />
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="Question">
                <ItemTemplate>
                    <asp:Label ID="lbl_QuizObj_Question" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "quiz_obj_question") %>'></asp:Label>
                </ItemTemplate>                
                <ItemStyle Width="25%" />
                <HeaderStyle Font-Bold="True" />
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="Answer A">
                <ItemTemplate>
                    <asp:Label ID="lbl_Answer_A" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ans_a") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="15%" />
                <HeaderStyle Font-Bold="True" />
            </asp:TemplateColumn>
             <asp:TemplateColumn HeaderText="Answer B">
                <ItemTemplate>
                    <asp:Label ID="lbl_Answer_B" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ans_b") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="15%" />
                <HeaderStyle Font-Bold="True" />
            </asp:TemplateColumn>
             <asp:TemplateColumn HeaderText="Answer C">
                <ItemTemplate>
                    <asp:Label ID="lbl_Answer_C" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ans_c") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="15%" />
                <HeaderStyle Font-Bold="True" />
            </asp:TemplateColumn>
             <asp:TemplateColumn HeaderText="Answer D">
                <ItemTemplate>
                    <asp:Label ID="lbl_Answer_D" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ans_d") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="15%" />
                <HeaderStyle Font-Bold="True" />
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="Your Answer">
                <ItemTemplate>
                    <asp:Label ID="lbl_Correct_Ans" Visible="false" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "correct_ans") %>'></asp:Label>
                    <asp:TextBox ID="txt_Your_Ans" MaxLength="1" runat="server"></asp:TextBox>
                </ItemTemplate>
                <ItemStyle Width="5%" />
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
                <ItemStyle Width="5%" />
                <HeaderStyle Font-Bold="True" />
            </asp:TemplateColumn>                             
        </Columns>
        <PagerStyle Mode="NumericPages" />
    </asp:DataGrid>
    <asp:Label ID="lblAttention" runat="server" CssClass="Note"></asp:Label><br />
</asp:Content>