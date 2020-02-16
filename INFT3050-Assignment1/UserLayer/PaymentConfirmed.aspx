<%@ Page Title="Payment Confirmed" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PaymentConfirmed.aspx.cs" Inherits="INFT3050_Assignment1.UserLayer.PaymentConfirmed" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container h-100">
        <!--Literally just a confirmation page with a link home-->
        <h2 class="payment-success">Payment Successful</h2>
        <asp:HyperLink runat="server" class="payment-return" NavigateUrl="/UserLayer/Home.aspx"><h3>Click here to return</h3></asp:HyperLink>
    </div>
</asp:Content>
