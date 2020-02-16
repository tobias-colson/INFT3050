<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="INFT3050_Assignment1.UserLayer.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-8">
                <!--Heading-->
                <h2 class="text-center text-white py-5">Contact Us</h2>
                <!--Logo-->
                <img src="/images/logo.png" style="height: 100px" class="image-fluid d-block mx-auto" />
                <h4 class="text-center text-white pt-3 pb-2">Email</h4>
                <!--Actual Uni email by the way-->
                <p class="text-center text-white-50 pb-2">tobias.colson@uon.edu.au</p>
                <!--Filler-->
                <h4 class="text-center text-white pb-2">Phone</h4>
                <p class="text-center text-white-50 pb-2">(+61) 412 345 678</p>
                <h4 class="text-center text-white pb-2">FAQ's</h4>
                <p class="text-center text-white-50 pb-2">
                    Do we ship internationally?
                    <br />
                    No.
                </p>
                <p class="text-center text-white-50 pb-2">
                    Do we ship at all?
                    <br />
                    No.
                </p>
                <p class="text-center text-white-50 pb-2">
                    How waterproof is waterproof?
                    <br />
                    Submersion to the advertised depth should be perfectly fine.
                </p>
                <p class="text-center text-white-50 pb-2">
                    How do I read an analog watch face?
                    <br />
                    Firstly, you look at the shorter "hour" hand. The number it points towards is the hour.
                        Next look at the longer "minute" hand. Each number, one to twelve, is five minutes past the hour. 
                        This means if this hand is pointing at eight then it's forty minutes past the hour.
                        Read together you get the hour and how many minutes past said hour and therefore the time.
                </p>
            </div>
        </div>
    </div>
</asp:Content>
