using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using INFT3050_Assignment1.BusinessLayer;
using INFT3050_Assignment1.Models;

namespace INFT3050_Assignment1.UserLayer
{
    public partial class AdminItems : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //Hides main panel, shows new listing panel
        protected void NewListing(object sender, EventArgs e)
        {
            main.Visible = false;
            newlisting.Visible = true;
        }

        //Hides main, shows update
        protected void UpdateListing(object sender, EventArgs e)
        {
            main.Visible = false;
            updatelisting.Visible = true;
        }

        //Hides main, shows delete
        protected void DeleteListing(object sender, EventArgs e)
        {
            main.Visible = false;
            deletelisting.Visible = true;
        }

        //Hides all other panels except main
        protected void Return(object sender, EventArgs e)
        {
            main.Visible = true;
            newlisting.Visible = false;
            updatelisting.Visible = false;
            deletelisting.Visible = false;
        }

        //Goes back to the landing page
        protected void Home(object sender, EventArgs e)
        {
            Response.Redirect("~/UserLayer/AdminLanding.aspx");
        }

        //Item creation
        //Takes text box values and radio button
        //Uses them in the function call parameters
        //Then uses the returned product to create the associated image's path
        //Via adding the category and id to the string
        //Then sending the string to be added to the product's db entry
        protected void Submit(object sender, EventArgs e)
        {
            Models.Product product = new Models.Product();

            string name, manufacturer, description, materials, category;
            decimal price;

            name = this.productName.Text;
            manufacturer = this.productManufacturer.Text;
            description = this.productDescription.Text;
            materials = this.productMaterials.Text;
            price = decimal.Parse(this.productPrice.Text);

            if (Mens.Checked)
            {
                category = "Men";
            }
            else
            {
                category = "Women";
            }

            product = BusinessLogic.CreateItem(name, manufacturer, description, materials, price, category);

            string strFileExtension = System.IO.Path.GetExtension(this.productImage.PostedFile.FileName);
            this.productImage.SaveAs(Server.MapPath("../images/") + category + "swatch" + product.productID + strFileExtension);

            string imagePath = "~/images/" + category + "swatch" + product.productID + strFileExtension;

            BusinessLogic.UpdateImagePath(product.productID, imagePath);

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Item Created Successfully')", true);
            Return(sender, e);
        }

        //Shows delete item, hides search
        //Also displays the products details in the labels
        //Tried to used ADO.net for this but it was acting strangely
        protected void Delete(object sender, EventArgs e)
        {
            int id = int.Parse(this.productDelete.Text);
            Models.Product product = BusinessLogic.GetProduct(id);
            Session["DeleteID"] = product.productID;

            if (product.productID == id)
            {
                deleteSearch.Visible = false;
                deleteItem.Visible = true;
                this.NoExist.Visible = false;

                this.manu.Text = "Manufacturer: " + product.productManufacturer;
                this.name.Text = "Name: " + product.productName;
                this.id.Text = "ID: " + product.productID;
            }
            else
            {
                this.NoExist.Visible = true;
            }
           
        }

        //Deletion call, alert and redirection
        protected void ConfirmDelete(object sender, EventArgs e)
        {
            int id = int.Parse(Session["DeleteID"].ToString());
            BusinessLogic.DeleteItem(id);
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Item Deleted Successfully')", true);
            Return(sender, e);
        }

        //Shows search again, hides details page
        protected void DeleteBack(object sender, EventArgs e)
        {
            deleteSearch.Visible = true;
            deleteItem.Visible = false;
        }

        //Update item, alert and redirect
        //Functions very similarly to the add new item option
        protected void Update(object sender, EventArgs e)
        {
            Models.Product product = new Models.Product();

            int id = int.Parse(Session["UpdateID"].ToString());

            string name, manufacturer, description, materials, category;
            decimal price;

            name = this.updateName.Text;
            manufacturer = this.updateManufacturer.Text;
            description = this.updateDescription.Text;
            materials = this.updateMaterials.Text;
            price = decimal.Parse(this.updatePrice.Text);

            if (Men.Checked)
            {
                category = "Men";
            }
            else
            {
                category = "Women";
            }

            product = BusinessLogic.UpdateItem(id, name, manufacturer, description, materials, price, category);

            string strFileExtension = System.IO.Path.GetExtension(this.updateImage.PostedFile.FileName);
            this.updateImage.SaveAs(Server.MapPath("../images/") + category + "swatch" + product.productID + strFileExtension);

            string imagePath = "~/images/" + category + "swatch" + product.productID + strFileExtension;

            BusinessLogic.UpdateImagePath(product.productID, imagePath);
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Item Updated Successfully')", true);
            Return(sender, e);
        }
    
        //Shows search, hides form
        protected void UpdateBack(object sender, EventArgs e)
        {
            updateSearch.Visible = true;
            updateItem.Visible = false;
        }

        //Hides search, shows form
        protected void UpdateSearch(object sender, EventArgs e)
        {
            Session["UpdateID"] = this.updateProduct.Text;
            updateSearch.Visible = false;
            updateItem.Visible = true;
        }
    }
}