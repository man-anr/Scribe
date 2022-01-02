<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Student.Master" AutoEventWireup="true" CodeBehind="TakeQuizTF.aspx.cs" Inherits="Scribe.TakeQuizTF" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodycontent" runat="server">

    <ul class="list-group list-group-flush">
        <li class="list-group-item">
            <div class="row">
                <div class="column">
                    <label>Subject Name: </label>
                    <label><%=Session["SubjectName"] %></label><br />
                    <label>Subject Code: </label>
                    <label><%=Session["SubjectID"] %></label><br />
                </div>
            </div>
        </li>
        <li class="list-group-item">
            <asp:DataGrid ID="dgTakeQuizTF" runat="server" AllowPaging="False" AutoGenerateColumns="false" BackColor="White" BorderColor="Transparent" BorderStyle="Solid" OnItemCommand="dgTakeQuizTF_ItemCommand" OnItemDataBound="dgTakeQuizTF_ItemDataBound" OnPageIndexChanged="dgTakeQuizTF_PageIndexChanged" PageSize="10" ShowFooter="true" Width="100%">
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
                            <asp:Label ID="lbl_QuizObj_Question" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "quiz_tf_question") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="45%" />
                        <HeaderStyle Font-Bold="True" />
                    </asp:TemplateColumn>
                    <asp:TemplateColumn HeaderText="True or False">
                        <ItemTemplate>
                            <asp:Label ID="lbl_Correct_Ans" Visible="false" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "true") %>'></asp:Label>
                            <asp:RadioButtonList ID="radio_ans" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Value="True"> &nbsp;True&nbsp;&nbsp;&nbsp;</asp:ListItem> 
                                <asp:ListItem Value="False"> &nbsp;False</asp:ListItem>
                            </asp:RadioButtonList>
                        </ItemTemplate>
                        <ItemStyle Width="25%" />
                        <HeaderStyle Font-Bold="True" />
                    </asp:TemplateColumn>
                    <asp:TemplateColumn HeaderText="Confirm Your Answer">
                        <ItemTemplate>
                            <asp:Label ID="lbl_Confirm" Visible="false" runat="server"></asp:Label>
                            <asp:Button ID="btnConfirmAnswer" runat="server" CommandName="ConfirmAnswer" Text="Confirm" Enabled="true" CssClass="btn btn-primary text-white"/>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:Button Width="200px" ID="btnFinishAnswer" runat="server" CommandName="FinishAnswer" Text="Finish" Enabled="true" CssClass="btn btn-success text-white"/>
                        </FooterTemplate>
                        <ItemStyle Width="25%" />
                        <HeaderStyle Font-Bold="True" />
                    </asp:TemplateColumn>
                </Columns>
                <PagerStyle Mode="NumericPages" />
            </asp:DataGrid>
            <asp:Label ID="lblAttention" runat="server" CssClass="Note"></asp:Label></li>
    </ul>


</asp:Content>
