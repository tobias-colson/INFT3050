<%@ Page Title="Product" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="INFT3050_Assignment1.UserLayer.Product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container bg-white my-3">
        <asp:ListView runat="server" ID="ProductListing">
            <ItemTemplate>
                <!--Product Image-->
                <div class="col p-5 text-center">
                    <asp:Image runat="server" ImageUrl='<%# Eval("ProductImage") %>' alt="img" Style="max-height: 300px; min-height: 300px" />
                </div>
                <!--Product details like name, manufacturer price etc.-->
                <div class="col px-5">
                    <asp:Label runat="server" ID="Label1" class="h3 d-block"><%# Eval("ProductName") %></asp:Label>
                    <asp:Label runat="server" ID="manufacturer" class="h4"><%# Eval("ProductManufacturer") %></asp:Label>
                    <hr />
                    <asp:Label runat="server" ID="price" class="pb-3">$ <%# Eval("ProductPrice") %></asp:Label><br />
                    <asp:Label runat="server" class="pb-3">In Stock</asp:Label><br />
                    <div class="btn-group">
                        <!--"Adds" to cart, actually just a simple redirect to the shopping cart page, will function by sending details when linked to DB-->
                        <asp:Button runat="server" Text="Add To Cart" Class="btn btn-dark" OnClick="Addtocart" />
                    </div>
                </div>
                <hr />
                <div>
                    <h3 class="px-5">Product Description</h3>
                </div>
                <!--Description and materials section-->
                <div class="row px-5 pb-5">
                    <div class="col-6 ">
                        <asp:Label runat="server" ID="description">
                    <%# Eval("ProductDescription") %>
                        </asp:Label>
                    </div>
                    <div class="col">
                        <ul>
                            <li>
                                <asp:Label runat="server" ID="materials">
                    <%# Eval("ProductMaterial") %>
                                </asp:Label>
                            </li>
                        </ul>
                    </div>
                </div>
            </ItemTemplate>
        </asp:ListView>
    </div>
</asp:Content>

