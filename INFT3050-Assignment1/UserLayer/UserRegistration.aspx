<%@ Page Title="Account Registration" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserRegistration.aspx.cs" Inherits="INFT3050_Assignment1.UserLayer.UserRegistration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container py-5">
        <h2 class="text-center text-white pb-5">Register An Account</h2>
        <div class="row justify-content-center">
            <div class="col-md-6">
                <!--Register form-->
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
                        <asp:Label runat="server" AssociatedControlID="userPassReg">Password</asp:Label>
                        <asp:TextBox runat="server" class="form-control" ID="userPassReg" TextMode="Password" placeholder="Enter password" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="userPassReg"
                            CssClass="text-danger" ErrorMessage="Missing Password." />
                    </div>
                    <!--Confirm Password-->
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="userPassConfirm">Confirm Password</asp:Label>
                        <asp:TextBox runat="server" class="form-control" ID="userPassConfirm" TextMode="Password" placeholder="Enter password" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="userPassConfirm"
                            CssClass="text-danger" ErrorMessage="Missing Password." />
                        <!--Comaparator validator, checks matching passwords-->
                        <asp:CompareValidator runat="server" ControlToValidate="userPassConfirm" ControlToCompare="userPassReg"
                            CssClass="text-danger" ErrorMessage="Passwords do not match." />
                    </div>
                    <!--Registers account-->
                    <div class="form-group">
                        <asp:Button runat="server" Text="Submit" Class="btn btn-dark" OnClick="Register"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
