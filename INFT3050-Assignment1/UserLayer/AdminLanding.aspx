<%@ Page Title="Site Administration" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminLanding.aspx.cs" Inherits="INFT3050_Assignment1.UserLayer.AdminLanding" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!--Landing page after admin login, shows inventory and user management links-->
    <div class="container py-5">
        <!--Heading-->
        <h2 class="text-center pb-5 text-white">Site Administration</h2>
        <div class="row justify-content-center text-center bg-light py-5">
            <div class="col-md-4">
                <!--User management link-->
                <asp:HyperLink runat="server" class="text-decoration-none" NavigateUrl="AdminUserManagement.aspx">
                    <h5>User Account Management</h5>
                </asp:HyperLink>
                <br />
                <!--Item management link-->
                <asp:HyperLink runat="server" class="text-decoration-none" NavigateUrl="AdminItems.aspx">
                    <h5>Inventory Management</h5>
                </asp:HyperLink>
            </div>
        </div>
    </div>
</asp:Content>
