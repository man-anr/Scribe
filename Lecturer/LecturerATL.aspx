<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Lecturer.Master" AutoEventWireup="true" CodeBehind="LecturerATL.aspx.cs" Inherits="Scribe.LecturerATL" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodycontent" runat="server">
    <%--<asp:Button ID="ListSubject" Text="List Subject" runat="server" OnClick="ListSubjectButton_Click" />--%>
    <%--<asp:Button ID="LogOut" Text="Log Out" runat="server" OnClick="LogOutButton_Click" />--%>


    <ul class="list-group list-group-flush">
        <li class="list-group-item">
            <div class="row">
                <div class="column">
                    <label>Subject Name : </label>
                    <label><%=Session["SubjectName"] %></label><br />
                    <label>Subject Code : </label>
                    <label><%=Session["SubjectID"] %></label><br />
                    <label>Assignment/Tutorial/Lab : </label>
                    <asp:TextBox ID="LectATL_Name" runat="server"></asp:TextBox><br />
                    <label>File : </label>
                    <asp:FileUpload ID="fileupload" runat="server"></asp:FileUpload>
                    <br />
                    <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUploadDocument" CssClass="mt-1 btn btn-primary text-white" />

                </div>

            </div>
        </li>
        <li class="list-group-item">
            <asp:DataGrid ID="dgLectATL" runat="server" AllowPaging="False" AutoGenerateColumns="false" BackColor="White" BorderColor="Transparent" BorderStyle="Solid" OnItemCommand="dgLectATL_ItemCommand" OnItemDataBound="dgLectATL_ItemDataBound" OnPageIndexChanged="dgLectATL_PageIndexChanged" PageSize="10" ShowFooter="true" Width="100%">
                <AlternatingItemStyle CssClass="Even_Row_Admin" />
                <HeaderStyle CssClass="Table_Header_Admin" />
                <Columns>
                    <asp:TemplateColumn HeaderText="No">
                        <ItemTemplate>
                            <asp:Label ID="lbl_ID_LectATL" Visible="false" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "atl_id") %>'></asp:Label>
                            <%# Container.ItemIndex + 1 %>
                        </ItemTemplate>
                        <ItemStyle Width="5%" />
                        <HeaderStyle Font-Bold="True" />
                    </asp:TemplateColumn>
                    <asp:TemplateColumn HeaderText="Assignment/Tutorial/Lab">
                        <ItemTemplate>
                            <asp:Label ID="lbl_LectATL_Name" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "atl_name") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="25%" />
                        <HeaderStyle Font-Bold="True" />
                    </asp:TemplateColumn>
                    <asp:TemplateColumn HeaderText="File Name">
                        <ItemTemplate>
                            <asp:Label ID="lbl_LectATL_FileName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "atl_file_name") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="30%" />
                        <HeaderStyle Font-Bold="True" />
                    </asp:TemplateColumn>
                    <asp:TemplateColumn HeaderText="Modified By">
                        <ItemTemplate>
                            <asp:Label ID="lbl_LectATL_Modified_By" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lect_name") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="20%" />
                        <HeaderStyle Font-Bold="True" />
                    </asp:TemplateColumn>
                    <asp:TemplateColumn HeaderText="Modified On">
                        <ItemTemplate>
                            <asp:Label ID="lbl_LectATL_Modified_On" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "atl_modified_date_time") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="20%" />
                        <HeaderStyle Font-Bold="True" />
                    </asp:TemplateColumn>
                    <asp:TemplateColumn HeaderText="" >
                        <HeaderStyle Font-Bold="True" />
                        <ItemTemplate>
                            <asp:Button ID="btnViewATL" runat="server" CommandName="ViewATL" Text="View" CssClass="btn btn-info text-white"/>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn HeaderText="">
                        <HeaderStyle Font-Bold="True" />
                        <ItemTemplate>
                            <asp:Button ID="btnSubmissionATL" runat="server" CommandName="SubmissionATL" Text="Submission" CssClass="btn btn-success text-white"/>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn HeaderText="">
                        <HeaderStyle Font-Bold="True" />
                        <ItemTemplate>
                            <asp:Button ID="btnDeleteATL" runat="server" CommandName="DeleteATL" Text="Delete" CssClass="btn btn-danger text-white"/>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                </Columns>
                <PagerStyle Mode="NumericPages" />
            </asp:DataGrid>
            <asp:Label ID="lblAttention" runat="server" CssClass="Note"></asp:Label></li>
    </ul>


</asp:Content>
