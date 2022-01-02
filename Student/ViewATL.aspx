<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Student.Master" AutoEventWireup="true" CodeBehind="ViewATL.aspx.cs" Inherits="Scribe.ViewATL" %>

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
            <asp:DataGrid ID="dgViewATL" runat="server" AllowPaging="False" AutoGenerateColumns="false" BackColor="White" BorderColor="Transparent" BorderStyle="Solid" OnItemCommand="dgViewATL_ItemCommand" OnItemDataBound="dgViewATL_ItemDataBound" OnPageIndexChanged="dgViewATL_PageIndexChanged" PageSize="10" ShowFooter="true" Width="100%">
                <AlternatingItemStyle CssClass="Even_Row_Admin" />
                <HeaderStyle CssClass="Table_Header_Admin" />
                <Columns>
                    <asp:TemplateColumn HeaderText="No">
                        <ItemTemplate>
                            <asp:Label ID="lbl_ID_ATL" Visible="false" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "atl_id") %>'></asp:Label>
                            <%# Container.ItemIndex + 1 %>
                        </ItemTemplate>
                        <ItemStyle Width="5%" />
                        <HeaderStyle Font-Bold="True" />
                    </asp:TemplateColumn>
                    <asp:TemplateColumn HeaderText="Assignment/Tutorial/Lab">
                        <ItemTemplate>
                            <asp:Label ID="lbl_ATL_Name" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "atl_name") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="24%" />
                        <HeaderStyle Font-Bold="True" />
                    </asp:TemplateColumn>
                    <asp:TemplateColumn HeaderText="Your File">
                        <ItemTemplate>
                            <asp:Label ID="lbl_SubmittedATL_ID" runat="server" Visible="false" Text='<%# DataBinder.Eval(Container.DataItem, "atlsubmission_id") %>'></asp:Label>
                            <asp:Label ID="lbl_SubmittedATL_FileName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "atlsubmission_file_name") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="24%" />
                        <HeaderStyle Font-Bold="True" />
                    </asp:TemplateColumn>
                    <asp:TemplateColumn HeaderText="">
                        <ItemTemplate>
                            <asp:Button ID="btnDownloadATL" runat="server" CommandName="DownloadATL" Text="Download" CssClass="btn btn-success text-white"/>
                        </ItemTemplate>
                        <ItemStyle Width="24%" />
                        <HeaderStyle Font-Bold="True" />
                    </asp:TemplateColumn>
                    <asp:TemplateColumn HeaderText="">
                        <HeaderStyle Font-Bold="True" />
                        <ItemTemplate>
                            <asp:Button ID="btnSubmitATL" runat="server" CommandName="SubmitATL" Text="Submit" CssClass="btn btn-primary text-white"/>
                        </ItemTemplate>
                        <ItemStyle Width="23%" />
                    </asp:TemplateColumn>
                </Columns>
                <PagerStyle Mode="NumericPages" />
            </asp:DataGrid>
            <asp:Label ID="lblAttention" runat="server" CssClass="Note"></asp:Label></li>
    </ul>
    <%--<asp:Button ID="ListSubject" Text="Subject List Registered" runat="server" OnClick="SubjectListRegisterButton_Click" />--%>
    <%--<asp:Button ID="LogOut" Text="Log Out" runat="server" OnClick="LogOutButton_Click" />--%>
</asp:Content>
