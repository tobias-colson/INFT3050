<%@ Page Title="Admin User Management" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminUserManagement.aspx.cs" Inherits="INFT3050_Assignment1.UserLayer.AdminUserManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container py-5">
        <h2 class="text-center text-white pb-5">User Account Management</h2>
        <div class="row justify-content-center">
            <!--Search for user to manage via username-->
            <asp:Panel runat="server" ID="userSearch">
                <div class="form-horizontal">
                    <!--Search control for username-->
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="searchUser">Username</asp:Label>
                        <asp:TextBox runat="server" class="form-control" ID="searchUser" placeholder="Username" Width="400px" />
                        <!--Required field validator-->
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="searchUser" CssClass="text-danger" ErrorMessage="Field Required." />
                        <asp:Label runat="server" ID="NoExist" Visible="false" class="text-danger">User Account Not Found</asp:Label>
                    </div>
                    <!--Hides search, shows user management panel-->
                    <div class="form-group">
                        <asp:Button runat="server" Text="Search" Class="btn btn-dark" OnClick="UserSearch" />
                    </div>
                    <asp:Button runat="server" Text="Return" class="admin-button" OnClick="Return" CausesValidation="false" />
                </div>
            </asp:Panel>
            <!--User account details and account "suspension"-->
            <asp:Panel runat="server" ID="userAccount" Visible="false">
                <div class="container bg-white my-3 px-5 pb-5">
                    <h2 class="py-4 text-center">User Account</h2>
                    <!--Accounts username, currently set when searched for, will function differently with database obviously-->
                    <h4>Username:</h4>
                    <asp:Label runat="server" ID="Username"><%: Session["UserAccount"] %></asp:Label><br />
                    <br />
                    <!--Local string variable that is changed via the suspend button below-->
                    <h4>Account Status:</h4>
                    <asp:Label runat="server" ID="status" Text=""></asp:Label><br />
                    <br />
                    <!--Changes account status between normal and suspended-->
                    <asp:Button runat="server" Text="Reinstate Account" ID="reinstatebtn" Class="btn btn-dark" OnClick="Reinstate" Visible="false" />
                    <asp:Button runat="server" Text="Suspend Account" ID="suspendbtn" Class="btn btn-dark" OnClick="Suspend" Visible="false" /><br />
                    <br />
                    <!--Users purchase history-->
                    <h4>Purchase History</h4>
                    <br />
                    <!--Pretty formatting for headings-->
                    <div class="row px-5 pb-5">
                        <div class="col-6">
                            <h5>Product</h5>
                        </div>
                        <svg height="40" width="2">
                            <line x1="0" y1="0" x2="0" y2="40" style="stroke: rgb(128, 128, 128); stroke-width: 2" />
                        </svg>
                        <div class="col">
                            <h5>Price</h5>
                        </div>
                        <svg height="40" width="2">
                            <line x1="0" y1="0" x2="0" y2="40" style="stroke: rgb(128, 128, 128); stroke-width: 2" />
                        </svg>
                        <div class="col">
                            <h5>Quantity</h5>
                        </div>
                        <svg height="40" width="2">
                            <line x1="0" y1="0" x2="0" y2="40" style="stroke: rgb(128, 128, 128); stroke-width: 2" />
                        </svg>
                        <div class="col">
                            <h5>Total</h5>
                        </div>
                    </div>
                    <!--Product in the user's purchase history-->
                    <!--Item details-->
                    <asp:ListView ID="ProductList" runat="server" GroupItemCount="1">
                        <LayoutTemplate>
                            <div class="row px-5">
                                <div runat="server" id="groupPlaceholder">
                                </div>
                            </div>
                        </LayoutTemplate>
                        <GroupTemplate>
                            <div runat="server" id="ItemPlaceholder">
                            </div>
                        </GroupTemplate>
                        <GroupSeparatorTemplate>
                            <hr />
                        </GroupSeparatorTemplate>
                        <ItemTemplate>
                            <!--Product div, contains image, name, manufacturer and price-->
                            <div class="col-2 pb-3">
                                <!--Image-->
                                <asp:Image runat="server" ID="Image" ImageUrl='<%# Eval("ImagePath")%>' AlternateText="img" Style="max-height: 75px; min-height: 75px" />
                            </div>
                            <div class="col-4 pb-3">
                                <br />
                                <!--Product link-->
                                <asp:Label runat="server" ID="Product"><%# Eval("ProductName")%> - <%# Eval("ProductManufacturer")%></asp:Label>
                            </div>
                            <div class="col-2 pb-3">
                                <br />
                                <!--Price-->
                                <asp:Label runat="server" ID="Price">$ <%# Eval("ProductPrice")%></asp:Label>
                            </div>
                            <div class="col-2 pb-3">
                                <br />
                                <!--Quantity-->
                                <asp:Label runat="server" ID="Quantity">X <%# Eval("Quantity")%></asp:Label>
                            </div>
                            <div class="col-2 pb-3">
                                <br />
                                <!--Total price-->
                                <asp:Label runat="server" ID="Subtotal">$ <%# Eval("Subtotal")%></asp:Label>
                            </div>
                        </ItemTemplate>
                    </asp:ListView>

                    <!--Returns to landing page-->
                    <asp:Button runat="server" Text="Return" class="admin-button" OnClick="Back" />
                </div>
            </asp:Panel>

        </div>
    </div>
</asp:Content>
