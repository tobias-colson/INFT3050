<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="INFT3050_Assignment1.UserLayer.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row justify-content-center">

            <div id="watches" class="carousel slide" data-ride="carousel" data-interval="10000">

                <!-- Indicators -->
                <ul class="carousel-indicators">
                    <li data-target="#watches" data-slide-to="0" class="active"></li>
                    <li data-target="#watches" data-slide-to="1"></li>
                    <li data-target="#watches" data-slide-to="2"></li>
                </ul>

                <!-- The slideshow(carousel) -->
                <div class="carousel-inner">
                    <!--Item on load-->
                    <div class="carousel-item active">
                        <img src="/images/carousel-watch1.png" alt="watch1" class="img-fluid min-vw-100">
                        <div class="container">
                            <div class="carousel-caption text-right">
                                <h3>See the latest looks for men.</h3>
                                <p>Enjoy the latest designs from some of the finest brands.</p>
                                <!--Goes to men's watches page-->
                                <p><asp:HyperLink runat="server" class="btn btn-dark" NavigateUrl="~/UserLayer/MensWatches.aspx" role="button">Browse Now</asp:HyperLink></p>
                            </div>
                        </div>
                    </div>

                    <div class="carousel-item">
                        <img src="/images/carousel-watch4.png" alt="watch2" class="img-fluid min-vw-100">
                        <div class="carousel-caption text-right">
                            <h3>Watch your favourites.</h3>
                            <p>Create an account today.</p>
                            <!--Login page-->
                            <p><asp:HyperLink runat="server" class="btn btn-dark" NavigateUrl="~/UserLayer/UserLogin.aspx" role="button">Sign Up</asp:HyperLink></p>
                        </div>
                    </div>

                    <div class="carousel-item">
                        <img src="/images/carousel-watch3.png" alt="watch3" class="img-fluid min-vw-100">
                        <div class="carousel-caption text-right">
                            <h3>Find the perfect accessory.</h3>
                            <p>Women's watches we think you'll love.</p>
                            <!--Women's watches page-->
                            <p><asp:HyperLink runat="server" class="btn btn-dark" NavigateUrl="~/UserLayer/WomensWatches.aspx" role="button">Browse Now</asp:HyperLink></p>
                        </div>
                    </div>
                </div>

                <!-- Left and right controls -->
                <a class="carousel-control-prev" href="#watches" data-slide="prev">
                    <span class="carousel-control-prev-icon"></span>
                </a>
                <a class="carousel-control-next" href="#watches" data-slide="next">
                    <span class="carousel-control-next-icon"></span>
                </a>
            </div>
        </div>
    </div>

</asp:Content>
