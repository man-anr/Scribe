<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminPage.Master" AutoEventWireup="true" CodeBehind="CreateViewQTF.aspx.cs" Inherits="Scribe.CreateViewQTF" %>
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
    <asp:DataGrid ID="dgQuizTF" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="Transparent" BorderStyle="Solid" OnCancelCommand="dgCancel_QuizTF" OnEditCommand="dgEdit_QuizTF" OnItemCommand="dgQuizTF_ItemCommand" OnItemDataBound="dgQuizTF_ItemDataBound" OnPageIndexChanged="dgQuizTF_PageIndexChanged" OnUpdateCommand="dgUpdate_QuizTF" ShowFooter="True" Width="900px" OnSelectedIndexChanged="dgQuizTF_SelectedIndexChanged">             
        <AlternatingItemStyle CssClass="Even_Row_Admin" />
        <HeaderStyle CssClass="Table_Header_Admin" />
        <Columns>
            <asp:TemplateColumn HeaderText="No">
                 <ItemTemplate>
                    <asp:Label ID="lbl_ID_QuizTF" Visible="false" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "quiz_tf_id") %>'></asp:Label>
                     <%# Container.ItemIndex + 1 %>
                </ItemTemplate>                
                <ItemStyle Width="20%" />
                <HeaderStyle Font-Bold="True" />
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="Question">
                <ItemTemplate>
                    <asp:Label ID="lbl_QuizTF_Question" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "quiz_tf_question") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txt_QuizTF_Question" runat="server" MaxLength="200" Text='<%# DataBinder.Eval(Container.DataItem, "quiz_tf_question") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txt_QuizTF_Question_New" MaxLength="200" runat="server"></asp:TextBox>
                </FooterTemplate>
                <ItemStyle Width="20%" />
                <HeaderStyle Font-Bold="True" />
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="True?">
                <ItemTemplate>
                    <asp:CheckBox ID="checkbox_true" Enabled="false" Checked='<%# DataBinder.Eval(Container.DataItem, "true")%>' runat="server" Value=''/>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:CheckBox ID="checkbox_true" runat="server" Checked='<%# DataBinder.Eval(Container.DataItem, "true")%>'/>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:CheckBox ID="checkbox_true_new" runat="server"/>
                </FooterTemplate>
                <ItemStyle Width="20%" />
                <HeaderStyle Font-Bold="True" />
            </asp:TemplateColumn>          
            <asp:TemplateColumn HeaderText="Modified By">
                <ItemTemplate>
                    <asp:Label ID="lbl_QTF_Modified_By" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "quiz_tf_modified_by") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="20%" />
                <HeaderStyle Font-Bold="True" />
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="Modified On">
                <ItemTemplate>
                    <asp:Label ID="lbl_QTF_Modified_On" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "quiz_tf_modified_date_time") %>'></asp:Label>
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