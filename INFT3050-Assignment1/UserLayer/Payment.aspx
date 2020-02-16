<%@ Page Title="Checkout" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="INFT3050_Assignment1.UserLayer.Payment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container py-4">
        <h2 class="text-center text-white pb-5"></h2>
        <div class="row justify-content-center">
            <div class="col-md-6">
                <!--Payment details form-->
                <div class="form-horizontal">
                    <!--Heading-->
                    <h4 class="details-heading">Billing Details</h4>
                    <!--First name control-->
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="firstName">First Name</asp:Label>
                        <asp:TextBox runat="server" class="form-control" ID="firstName" placeholder="Enter first name" />
                        <!--Required field validator-->
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="firstName"
                            CssClass="text-danger" ErrorMessage="Missing Name." />
                    </div>
                    <!--Last name-->
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="lastName">Last Name</asp:Label>
                        <asp:TextBox runat="server" class="form-control" ID="lastName" placeholder="Enter last name" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="lastName"
                            CssClass="text-danger" ErrorMessage="Missing Last Name." />
                    </div>
                    <!--Card Number-->
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="cardNumber">Card Number</asp:Label>
                        <asp:TextBox runat="server" class="form-control" ID="cardNumber" placeholder="Card Number" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="cardNumber"
                            CssClass="text-danger" ErrorMessage="Missing Card Number." />
                    </div>
                    <div class="form-group row ">
                        <!--Inline postcode control-->
                        <div class="form-group col-md-6">
                            <asp:Label runat="server" AssociatedControlID="expiry">Expiry Date</asp:Label>
                            <asp:TextBox runat="server" class="form-control" ID="expiry" placeholder="Expiry Date" TextMode="DateTime"/>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="expiry"
                                CssClass="text-danger" ErrorMessage="Missing Expiry Date." />
                        </div>
                        <!--Inline postcode control-->
                        <div class="form-group col-md-6">
                            <asp:Label runat="server" AssociatedControlID="CVC">CVC</asp:Label>
                            <asp:TextBox runat="server" class="form-control" ID="CVC" placeholder="CVC" TextMode="Number"/>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="CVC"
                                CssClass="text-danger" ErrorMessage="Missing CVC." />
                        </div>
                    </div>
                    <asp:Button runat="server" class="btn btn-dark" Text="Confirm Payment" OnClick="MakePayment"/>
                    <asp:Label runat="server" ID="declined" Visible="false" Style="color: red">Payment Declined</asp:Label><br />
                    <asp:Label runat="server" ID="timedout" Visible="false" Style="color: red">Payment Timed Out</asp:Label><br />
                    <br />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
