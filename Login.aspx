<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AuthPage.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Scribe.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodycontent" runat="server">

    <section class="h-100">
        <div class="container h-100">
            <div class="row justify-content-sm-center h-100">
                <div class="col-xxl-4 col-xl-4 col-lg-5 col-md-7 col-sm-4">
                    <div class="text-center">
                        <img src="https://www.brandbucket.com/sites/default/files/logo_uploads/297086/large_quizroll.png" alt="logo" width="200">
                    </div>

                    <div class="card shadow rounded-3 ">


                        <div class="card-body p-5">





                            <h1 class="mb-4 text-center display-6">Login<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-shield-lock-fill ms-3 mb-1" viewBox="0 0 16 16">
                                <path fill-rule="evenodd" d="M8 0c-.69 0-1.843.265-2.928.56-1.11.3-2.229.655-2.887.87a1.54 1.54 0 0 0-1.044 1.262c-.596 4.477.787 7.795 2.465 9.99a11.777 11.777 0 0 0 2.517 2.453c.386.273.744.482 1.048.625.28.132.581.24.829.24s.548-.108.829-.24a7.159 7.159 0 0 0 1.048-.625 11.775 11.775 0 0 0 2.517-2.453c1.678-2.195 3.061-5.513 2.465-9.99a1.541 1.541 0 0 0-1.044-1.263 62.467 62.467 0 0 0-2.887-.87C9.843.266 8.69 0 8 0zm0 5a1.5 1.5 0 0 1 .5 2.915l.385 1.99a.5.5 0 0 1-.491.595h-.788a.5.5 0 0 1-.49-.595l.384-1.99A1.5 1.5 0 0 1 8 5z" />
                            </svg></h1>

                            <div class="form-floating mb-3">
                                <asp:TextBox ID="txtbox_ID" runat="server" CssClass="form-control" placeholder="Password"></asp:TextBox>
                                <label for="txtbox_ID">
                                    <asp:Label ID="Label1" ForeColor="Black" runat="server" CssClass="label"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-lines-fill" viewBox="0 0 16 16">
  <path d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm-5 6s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zM11 3.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5zm.5 2.5a.5.5 0 0 0 0 1h4a.5.5 0 0 0 0-1h-4zm2 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1h-2zm0 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1h-2z"/>
</svg> User ID</asp:Label></label>
                            </div>

                            <div class="form-floating">

                                <asp:TextBox ID="txtbox_password" TextMode="Password" runat="server" OnTextChanged="txtbox_password_TextChanged" CssClass="form-control" placeholder="Password"></asp:TextBox>
                                <label for="txtbox_password">
                                    <asp:Label ID="Label2" ForeColor="Black" runat="server" CssClass=""><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-key-fill" viewBox="0 0 16 16">
  <path d="M3.5 11.5a3.5 3.5 0 1 1 3.163-5H14L15.5 8 14 9.5l-1-1-1 1-1-1-1 1-1-1-1 1H6.663a3.5 3.5 0 0 1-3.163 2zM2.5 9a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
</svg> Password</asp:Label></label>


                                <asp:RequiredFieldValidator ID="rfvPword" runat="server" ControlToValidate="txtbox_password" ErrorMessage="Enter Password" ForeColor="Red">

                                </asp:RequiredFieldValidator>
                            </div>


                            <div class="mt-2 d-grid ">
                                <asp:Button ID="ButtonSubmit" Text="Log me in" runat="server" OnClick="ButtonSubmit_Click " CssClass="btn btn-primary" />
                            </div>
                            <div class="mt-2 d-grid ">
                                <asp:Button ID="ButtonCancel" Text="Clear texts" runat="server" OnClick="ButtonCancel_Click" CssClass="btn btn-outline-secondary" />
                            </div>



                        </div>


                        <div class="card-footer py-2">
                            <div class="text-center">
                                Can't remember your password? <a href="https://www.youtube.com/watch?v=dQw4w9WgXcQ" target="_blank" class="text-dark">
                                    <br>
                                    We can't help you</a>
                                <asp:Label ID="lblStatus" ForeColor="Red" runat="server"></asp:Label>

                            </div>


                        </div>

                    </div>

                   


                </div>

            </div>
        </div>
    </section>
</asp:Content>

