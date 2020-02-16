<%@ Page Title="Women's Watches" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WomensWatches.aspx.cs" Inherits="INFT3050_Assignment1.UserLayer.WomensWatches" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container pb-5 bg-white">
        <!--Heading-->
        <h2 class="text-center py-5 text-black-50">Women's Watches</h2>
        <hr />
        <asp:ListView ID="ProductList" runat="server" GroupItemCount="3">
           <LayoutTemplate>
                <div runat="server" class="flex-row">
                    <asp:PlaceHolder runat="server" ID="groupPlaceholder"></asp:PlaceHolder>
                </div>
            </LayoutTemplate>

            <GroupTemplate>
                <div class="row text-center">
                    <asp:PlaceHolder runat="server" ID="itemPlaceHolder"></asp:PlaceHolder>
                </div>
            </GroupTemplate>

            <ItemTemplate>
                <!--Product div, contains image, name, manufacturer and price-->
                <div class="product col-md-4">
                        <asp:HyperLink ID="productImage" NavigateUrl='<%# "/UserLayer/Product.aspx?productID="+Eval("ProductID")%>' ImageUrl='<%# Eval("ImagePath")%>' ImageHeight="200px" runat="server"></asp:HyperLink>
                        <asp:HyperLink ID="productName" NavigateUrl='<%# "/UserLayer/Product.aspx?productID="+Eval("ProductID")%>' Text='<%# Eval("ProductName")%>' runat="server" class="product-link"></asp:HyperLink>
                        <asp:Label runat="server" ID="manufacturerID" class="manufacturer"><%# Eval("ProductManufacturer") %></asp:Label>
                        <asp:Label runat="server" ID="productPrice" class="product-price">$<%# Eval("ProductPrice") %></asp:Label>
                    </div>
            </ItemTemplate>
        </asp:ListView>
    </div>
</asp:Content>
