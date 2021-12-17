<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.Master" AutoEventWireup="true" CodeBehind="CreateViewQObj.aspx.cs" Inherits="DatabaseProject.CreateViewQObj" %>
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
    <asp:DataGrid ID="dgQuizObj" runat="server" AllowPaging="True" AutoGenerateColumns="false" BackColor="White" BorderColor="Transparent" BorderStyle="Solid" OnCancelCommand="dgCancel_QuizObj" OnEditCommand="dgEdit_QuizObj" OnItemCommand="dgQuizObj_ItemCommand" OnItemDataBound="dgQuizObj_ItemDataBound" OnPageIndexChanged="dgQuizObj_PageIndexChanged" OnUpdateCommand="dgUpdate_QuizObj" PageSize="10" ShowFooter="true" Width="900px">             
        <AlternatingItemStyle CssClass="Even_Row_Admin" />
        <HeaderStyle CssClass="Table_Header_Admin" />
        <Columns>
            <asp:TemplateColumn HeaderText="No">
                 <ItemTemplate>
                    <asp:Label ID="lbl_ID_QuizObj" Visible="false" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "quiz_obj_id") %>'></asp:Label>
                     <%# Container.ItemIndex + 1 %>
                </ItemTemplate>                
                <ItemStyle Width="20%" />
                <HeaderStyle Font-Bold="True" />
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="Question">
                <ItemTemplate>
                    <asp:Label ID="lbl_QuizObj_Question" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "quiz_obj_question") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txt_QuizObj_Question" runat="server" MaxLength="200" Text='<%# DataBinder.Eval(Container.DataItem, "quiz_obj_question") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txt_QuizObj_Question_New" MaxLength="200" runat="server"></asp:TextBox>
                </FooterTemplate>
                <ItemStyle Width="20%" />
                <HeaderStyle Font-Bold="True" />
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="Answer A">
                <ItemTemplate>
                    <asp:Label ID="lbl_Answer_A" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ans_a") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txt_Answer_A" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ans_a") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txt_Answer_A_New" runat="server"></asp:TextBox>
                </FooterTemplate>
                <ItemStyle Width="20%" />
                <HeaderStyle Font-Bold="True" />
            </asp:TemplateColumn>
             <asp:TemplateColumn HeaderText="Answer B">
                <ItemTemplate>
                    <asp:Label ID="lbl_Answer_B" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ans_b") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txt_Answer_B" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ans_b") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txt_Answer_B_New" runat="server"></asp:TextBox>
                </FooterTemplate>
                <ItemStyle Width="20%" />
                <HeaderStyle Font-Bold="True" />
            </asp:TemplateColumn>
             <asp:TemplateColumn HeaderText="Answer C">
                <ItemTemplate>
                    <asp:Label ID="lbl_Answer_C" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ans_c") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txt_Answer_C" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ans_c") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txt_Answer_C_New" runat="server"></asp:TextBox>
                </FooterTemplate>
                <ItemStyle Width="20%" />
                <HeaderStyle Font-Bold="True" />
            </asp:TemplateColumn>
             <asp:TemplateColumn HeaderText="Answer D">
                <ItemTemplate>
                    <asp:Label ID="lbl_Answer_D" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ans_d") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txt_Answer_D" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ans_d") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txt_Answer_D_New" runat="server"></asp:TextBox>
                </FooterTemplate>
                <ItemStyle Width="20%" />
                <HeaderStyle Font-Bold="True" />
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="Correct Answer">
                <ItemTemplate>
                    <asp:Label ID="lbl_Correct_Ans" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "correct_ans") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txt_Correct_Ans" runat="server" MaxLength="1" Text='<%# DataBinder.Eval(Container.DataItem, "correct_ans") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txt_Correct_Ans_New" MaxLength="1" runat="server"></asp:TextBox>
                </FooterTemplate>
                <ItemStyle Width="20%" />
                <HeaderStyle Font-Bold="True" />
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="Modified By">
                <ItemTemplate>
                    <asp:Label ID="lbl_QObj_Modified_By" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "quiz_obj_modified_by") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="20%" />
                <HeaderStyle Font-Bold="True" />
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="Modified On">
                <ItemTemplate>
                    <asp:Label ID="lbl_QObj_Modified_On" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "quiz_obj_modified_date_time") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="20%" />
                <HeaderStyle Font-Bold="True" />
            </asp:TemplateColumn>
            <asp:EditCommandColumn ButtonType="PushButton" CancelText="Cancel" EditText="Update" HeaderText="Update" UpdateText="Update"><HeaderStyle Font-Bold="True" /></asp:EditCommandColumn>
            <asp:TemplateColumn HeaderText="Delete">
                <HeaderStyle Font-Bold="True" />
                <ItemTemplate>
                    <asp:Button ID="btnDeleteQuestion" Runat="server" CommandName="DeleteQuestion" Text="Delete" />
                </ItemTemplate>
                <FooterTemplate>
                    <asp:Button ID="btnAddQuestion" Runat="server" CommandName="AddQuestion" Text="Add" />
                </FooterTemplate>
            </asp:TemplateColumn>
        </Columns>
        <PagerStyle Mode="NumericPages" />
    </asp:DataGrid>
    <asp:Label ID="lblAttention" runat="server" CssClass="Note"></asp:Label>
</asp:Content>
