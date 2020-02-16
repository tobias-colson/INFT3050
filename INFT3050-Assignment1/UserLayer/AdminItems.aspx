<%@ Page Title="Inventory Management" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminItems.aspx.cs" Inherits="INFT3050_Assignment1.UserLayer.AdminItems" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container py-5">
        <!--Heading-->
        <h2 class="text-center text-white pb-5">Inventory Management</h2>
        <!--Main selection screen that appears first-->
        <asp:Panel runat="server" ID="main">
            <div class="row justify-content-center text-center bg-light py-5">
                <div class="col-md-5">
                    <!--Button shows new listing panel-->
                    <asp:Button runat="server" Text="Create New Item Listing" class="admin-button" OnClick="NewListing" />
                    <br />
                    <br />
                    <!--Shows update panel-->
                    <asp:Button runat="server" Text="Update Existing Item Listing" class="admin-button" OnClick="UpdateListing" />
                    <br />
                    <br />
                    <!--Shows delete item panel-->
                    <asp:Button runat="server" Text="Delete Item Listing" class="admin-button" OnClick="DeleteListing" />
                    <br />
                    <br />
                    <!--Returns to the admin landing page-->
                    <asp:Button runat="server" Text="Return" class="admin-button" OnClick="Home" />
                </div>
            </div>
        </asp:Panel>
        <!--New listing panel, invisible until selected-->
        <asp:Panel runat="server" ID="newlisting" Visible="false">
            <div class="row justify-content-center pb-5">
                <div class="col-md-6">
                    <!--Form styling/grouping-->
                    <div class="form-horizontal">
                        <!--Control for entering product name-->
                        <div class="form-group">
                            <asp:Label runat="server" AssociatedControlID="productName">Product Name</asp:Label>
                            <asp:TextBox runat="server" class="form-control" ID="productName" placeholder="Product Name" />
                            <!--Required field validator-->
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="productName"
                                CssClass="text-danger" ErrorMessage="Field Required." />
                        </div>
                        <!--Control for product manufacturer-->
                        <div class="form-group">
                            <asp:Label runat="server" AssociatedControlID="productManufacturer">Manufacturer</asp:Label>
                            <asp:TextBox runat="server" class="form-control" ID="productManufacturer" placeholder="Manufacturer" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="productManufacturer"
                                CssClass="text-danger" ErrorMessage="Field Required." />
                        </div>
                        <!--Price control-->
                        <div class="form-group">
                            <asp:Label runat="server" AssociatedControlID="productPrice">Price</asp:Label>
                            <asp:TextBox runat="server" class="form-control" ID="productPrice" TextMode="Number" placeholder="Price" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="productPrice"
                                CssClass="text-danger" ErrorMessage="Field Required." />
                        </div>
                        <!--Description control-->
                        <div class="form-group">
                            <asp:Label runat="server" AssociatedControlID="productDescription">Product Description</asp:Label>
                            <asp:TextBox runat="server" class="form-control" ID="productDescription" TextMode="MultiLine" placeholder="Description" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="productDescription"
                                CssClass="text-danger" ErrorMessage="Field Required." />
                        </div>
                        <!--Material control-->
                        <div class="form-group">
                            <asp:Label runat="server" AssociatedControlID="productMaterials">Product Materials</asp:Label>
                            <asp:TextBox runat="server" class="form-control" ID="productMaterials" placeholder="Materials" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="productMaterials"
                                CssClass="text-danger" ErrorMessage="Field Required." />
                        </div>
                        <!--Category control-->
                        <div class="form-group">
                            <asp:Label runat="server">Product Category</asp:Label><br />
                            <asp:RadioButton runat="server" ID="Mens" Text="Mens" Checked="true" GroupName="category" /><br />
                            <asp:RadioButton runat="server" ID="Womens" Text="Womens" GroupName="category" />
                        </div>
                        <!--Image upload control-->
                        <div class="form-group">
                            <asp:Label runat="server" AssociatedControlID="productImage">Product Image</asp:Label><br />
                            <asp:FileUpload ID="productImage" accept="image/*" multiple="false" runat="server" BorderStyle="None" /><br />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="productImage"
                                CssClass="text-danger" ErrorMessage="Field Required." />
                            <!--Validator to restrict file upload to only image types-->
                            <asp:RegularExpressionValidator ID="rexp" runat="server" ControlToValidate="productImage"
                                ErrorMessage="Only .gif, .jpg, .png, .tiff and .jpeg"
                                ValidationExpression="(.*\.([Gg][Ii][Ff])|.*\.([Jj][Pp][Gg])|.*\.([Bb][Mm][Pp])|.*\.([pP][nN][gG])|.*\.([tT][iI][iI][fF])$)"></asp:RegularExpressionValidator>
                        </div>
                        <div class="form-group">
                            <!--"Submits" new item to nowhere currently, database eventually-->
                            <asp:Button runat="server" Text="Submit" Class="btn btn-dark" OnClick="Submit" />
                        </div>
                        <!--Goes back to main panel, escapes validation-->
                        <asp:Button runat="server" Text="Return" CausesValidation="false" Class="admin-button" OnClick="Return" />
                    </div>
                </div>
            </div>
        </asp:Panel>

        <!--Update listing panel-->
        <asp:Panel runat="server" ID="updatelisting" Visible="false">
            <div class="row justify-content-center pb-5">
                <div class="col-md-6">

                    <!--Panel to search for item by item ID-->
                    <asp:Panel runat="server" ID="updateSearch">
                        <div class="form-horizontal">
                            <div class="form-group">
                                <!--Search Control-->
                                <asp:Label runat="server" AssociatedControlID="updateProduct">Product ID</asp:Label>
                                <asp:TextBox runat="server" class="form-control" TextMode="Number" ID="updateProduct" placeholder="Product ID" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="updateProduct"
                                    CssClass="text-danger" ErrorMessage="Field Required." />
                            </div>
                            <!--Hides this panel, shows update form-->
                            <div class="form-group">
                                <asp:Button runat="server" Text="Search" Class="btn btn-dark" OnClick="UpdateSearch" />
                            </div>
                            <asp:Button runat="server" Text="Return" class="admin-button" OnClick="Return" CausesValidation="false" />
                        </div>
                    </asp:Panel>

                    <!--Panel that appears after search with form to update item listing if found-->
                    <asp:Panel runat="server" ID="updateItem" Visible="false">
                        <div class="form-horizontal">
                            <!--Updates object name-->
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="updateName">Product Name</asp:Label>
                                <asp:TextBox runat="server" class="form-control" ID="updateName" placeholder="Product Name" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="updateName"
                                    CssClass="text-danger" ErrorMessage="Field Required." />
                            </div>
                            <!--Updates manufacturer-->
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="updateManufacturer">Manufacturer</asp:Label>
                                <asp:TextBox runat="server" class="form-control" ID="updateManufacturer" placeholder="Manufacturer" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="updateManufacturer"
                                    CssClass="text-danger" ErrorMessage="Field Required." />
                            </div>
                            <!--Updates price-->
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="updatePrice">Price</asp:Label>
                                <asp:TextBox runat="server" class="form-control" ID="updatePrice" TextMode="Number" placeholder="Price" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="updatePrice"
                                    CssClass="text-danger" ErrorMessage="Field Required." />
                            </div>
                            <!--Updates description-->
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="updateDescription">Product Description</asp:Label>
                                <asp:TextBox runat="server" class="form-control" ID="updateDescription" TextMode="MultiLine" placeholder="Description" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="updateDescription"
                                    CssClass="text-danger" ErrorMessage="Field Required." />
                            </div>
                            <!--Updates materials-->
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="updateMaterials">Product Materials</asp:Label>
                                <asp:TextBox runat="server" class="form-control" ID="updateMaterials" placeholder="Materials" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="updateMaterials"
                                    CssClass="text-danger" ErrorMessage="Field Required." />
                            </div>
                            <!--Category control-->
                            <div class="form-group">
                                <asp:Label runat="server">Product Category</asp:Label><br />
                                <asp:RadioButton runat="server" ID="Men" Text="Mens" Checked="true" GroupName="category2" /><br />
                                <asp:RadioButton runat="server" ID="Women" Text="Womens" GroupName="category2" />
                            </div>
                            <!--Updates image, with image only validator again-->
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="updateImage">Product Image</asp:Label><br />
                                <asp:FileUpload ID="updateImage" accept="image/*" multiple="false" runat="server" BorderStyle="None" /><br />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="updateImage"
                                    CssClass="text-danger" ErrorMessage="Field Required." />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="updateImage"
                                    ErrorMessage="Only .gif, .jpg, .png, .tiff and .jpeg"
                                    ValidationExpression="(.*\.([Gg][Ii][Ff])|.*\.([Jj][Pp][Gg])|.*\.([Bb][Mm][Pp])|.*\.([pP][nN][gG])|.*\.([tT][iI][iI][fF])$)"></asp:RegularExpressionValidator>
                            </div>
                            <div class="form-group">
                                <!--Again does nothing but will with database inclusion-->
                                <asp:Button runat="server" Text="Submit" Class="btn btn-dark" OnClick="Update" />
                            </div>
                            <asp:Button runat="server" Text="Return" CausesValidation="false" Class="admin-button" OnClick="UpdateBack" />
                        </div>
                    </asp:Panel>
                </div>
            </div>
        </asp:Panel>

        <!--Delete Lising Panel-->
        <asp:Panel runat="server" ID="deletelisting" Visible="false">
            <div class="row justify-content-center pb-5">
                <div class="col-md-6">
                    <!--Search by item ID panel, redirects to panel showing product details and delete confirm-->
                    <asp:Panel runat="server" ID="deleteSearch">
                        <div class="form-horizontal">
                            <div class="form-group">
                                <!--Search control-->
                                <asp:Label runat="server" AssociatedControlID="productDelete">Product ID</asp:Label>
                                <asp:TextBox runat="server" class="form-control" TextMode="Number" ID="productDelete" placeholder="Product ID" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="productDelete"
                                    CssClass="text-danger" ErrorMessage="Field Required." />
                                <asp:Label runat="server" Text="Item Doesn't Exist" ID="NoExist" Visible="false" CssClass="text-danger"></asp:Label>
                            </div>
                            <!--Goes to confirm panel-->
                            <div class="form-group">
                                <asp:Button runat="server" Text="Search" Class="btn btn-dark" OnClick="Delete" />
                            </div>
                            <!--Goes back-->
                            <asp:Button runat="server" Text="Return" class="admin-button" OnClick="Return" CausesValidation="false" />
                        </div>
                    </asp:Panel>
                    <!--Product details and a confirmation to delete item-->
                    <asp:Panel runat="server" ID="deleteItem" Visible="false">
                        <div class="form-horizontal">
                            <!--Hard coded details-->
                            <div class="form-group">
                                <asp:Label runat="server" ID="id"></asp:Label><br />
                                <asp:Label runat="server" ID="name"></asp:Label>
                                <br />
                                <asp:Label runat="server" ID="manu"></asp:Label>
                            </div>
                            <div class="form-group">
                                <asp:Button runat="server" Text="Delete" Class="btn btn-dark" OnClick="ConfirmDelete" />
                            </div>
                            <asp:Button runat="server" Text="Return" class="admin-button" OnClick="DeleteBack" CausesValidation="false" />
                        </div>
                    </asp:Panel>
                </div>
            </div>
        </asp:Panel>
    </div>
</asp:Content>
