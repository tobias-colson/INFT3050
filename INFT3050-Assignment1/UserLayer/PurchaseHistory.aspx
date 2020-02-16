<%@ Page Title="Purchase History" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PurchaseHistory.aspx.cs" Inherits="INFT3050_Assignment1.UserLayer.PurchaseHistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container bg-white my-3 pb-5">
        <!--Heading-->
        <h2 class="p-5 text-center">Purchase History</h2>
        <div class="row px-5 pb-5">
            <!--Pretty formatting for headings-->
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
        <!--Items-->
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
    </div>
</asp:Content>
