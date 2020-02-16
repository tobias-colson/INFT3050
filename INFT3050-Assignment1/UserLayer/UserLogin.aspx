<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserLogin.aspx.cs" Inherits="INFT3050_Assignment1.UserLayer.UserLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container py-5">
        <h2 class="text-center text-white pb-5">Login</h2>
        <div class="row justify-content-center">
            <div class="col-md-6">
                <!--Login form-->
                <div class="form-horizontal">
                    <!--Username-->
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="userUsername">Username</asp:Label>
                        <asp:TextBox runat="server" class="form-control" ID="userUsername" placeholder="Enter username" />
                        <!--Required field validator-->
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="userUsername"
                            CssClass="text-danger" ErrorMessage="Missing Username." />
                    </div>
                    <!--Password-->
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="userPassword">Password</asp:Label>
                        <asp:TextBox runat="server" class="form-control" ID="userPassword" TextMode="Password" placeholder="Enter password" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="userPassword"
                            CssClass="text-danger" ErrorMessage="Missing Password." />
                    </div>
                    <!--Logs user in-->
                    <div class="form-group">
                        <asp:Button runat="server" Text="Submit" Class="btn btn-dark" OnClick="LogIn"/>
                    </div>
                    <asp:Label runat="server" ID="errorMessage" Visible="false" Style="color: red">Incorrect Username or Password</asp:Label><br />
                    <asp:Label runat="server" ID="disabledMessage" Visible="false" Style="color: red">Account Disabled</asp:Label><br />
                    <!--Register link-->
                    <asp:HyperLink class="pb-3" runat="server" NavigateUrl="UserRegistration.aspx">Don't have an account? Click here to register.</asp:HyperLink>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
