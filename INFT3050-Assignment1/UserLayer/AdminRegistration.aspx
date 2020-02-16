<%@ Page Title="Admin Registration" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminRegistration.aspx.cs" Inherits="INFT3050_Assignment1.UserLayer.AdminRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container py-5">
        <h2 class="text-center text-white pb-5">Register An Account</h2>
        <div class="row justify-content-center">
            <div class="col-md-6">
                <!--Registration form for admin-->
                <div class="form-horizontal">
                    <!--Username-->
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="adminUsername">Username</asp:Label>
                        <asp:TextBox runat="server" class="form-control" ID="adminUsername" placeholder="Enter username" />
                        <!--Validator for required field-->
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="adminUsername"
                            CssClass="text-danger" ErrorMessage="Missing Username." />
                    </div>
                    <!--Password, with censored input via Textmode-->
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="adminPassReg">Password</asp:Label>
                        <asp:TextBox runat="server" class="form-control" ID="adminPassReg" TextMode="Password" placeholder="Enter password" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="adminPassReg"
                            CssClass="text-danger" ErrorMessage="Missing Password." />
                    </div>
                    <!--Confirm password-->
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="adminPassConfirm">Confirm Password</asp:Label>
                        <asp:TextBox runat="server" class="form-control" ID="adminPassConfirm" TextMode="Password" placeholder="Enter password" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="adminPassConfirm"
                            CssClass="text-danger" ErrorMessage="Missing Password." />
                        <!--Comparator validator that compares passwords and requires same input-->
                        <asp:CompareValidator runat="server" ControlToValidate="adminPassConfirm" ControlToCompare="adminPassReg"
                            CssClass="text-danger" ErrorMessage="Passwords do not match." />
                    </div>
                    <!--Email address with email only input restriction-->
                     <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="adminEmail">Email</asp:Label>
                        <asp:TextBox runat="server" class="form-control" ID="adminEmail" TextMode="Email" placeholder="Enter email" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="adminEmail"
                            CssClass="text-danger" ErrorMessage="Missing Email." />
                    </div>
                    <!--Confirm email-->
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="adminEmailConfirm">Confirm Email</asp:Label>
                        <asp:TextBox runat="server" class="form-control" ID="adminEmailConfirm" TextMode="Email" placeholder="Confirm email" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="adminEmailConfirm"
                            CssClass="text-danger" ErrorMessage="Missing Email." />
                        <asp:CompareValidator runat="server" ControlToValidate="adminEmailConfirm" ControlToCompare="adminEmail"
                            CssClass="text-danger" ErrorMessage="Emails do not match." />
                    </div>
                    <!--"Submits" the form and redirects to admin landing page, won't function exactly like this with database-->
                    <div class="form-group">
                        <asp:Button runat="server" Text="Submit" Class="btn btn-dark" OnClick="Register"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
