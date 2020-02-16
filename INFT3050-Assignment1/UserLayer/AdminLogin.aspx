<%@ Page Title="Admin Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="INFT3050_Assignment1.UserLayer.AdminLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container py-5">
        <h2 class="text-center text-white pb-5">Site Administration Login</h2>
        <div class="row justify-content-center">
            <div class="col-md-6">
                <!--Login form for admins-->
                <div class="form-horizontal">
                    <!--Username-->
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="adminUsername">Username</asp:Label>
                        <asp:TextBox runat="server" class="form-control" ID="adminUsername" placeholder="Enter username" />
                        <!--Required field validator-->
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="adminUsername"
                            CssClass="text-danger" ErrorMessage="Missing Username." />
                    </div>
                    <!--Password-->
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="adminPassword">Password</asp:Label>
                        <asp:TextBox runat="server" class="form-control" ID="adminPassword" TextMode="Password" placeholder="Enter password" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="adminPassword"
                            CssClass="text-danger" ErrorMessage="Missing Password." />
                    </div>
                    <div class="form-group">
                        <!--Redirects to admin landing page-->
                        <asp:Button runat="server" Text="Submit" Class="btn btn-dark" OnClick="LogIn"/>
                    </div>
                    <asp:Label runat="server" ID="errorMessage" Visible="false" Style="color: red">Incorrect Username or Password</asp:Label><br />
                    <asp:Label runat="server" ID="disabledMessage" Visible="false" Style="color: red">Account Disabled</asp:Label><br />
                    <!--Redirects to admin registration page-->
                    <asp:HyperLink class="pb-3" runat="server" NavigateUrl="AdminRegistration.aspx">Apply for an account here.</asp:HyperLink>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
