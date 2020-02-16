using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using INFT3050_Assignment1.BusinessLayer;
using INFT3050_Assignment1.Models;
using System.Data;

namespace INFT3050_Assignment1.UserLayer
{
    public partial class Product : System.Web.UI.Page
    {
        //On load
        //Get all the products details from db
        //Display them via databinding
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Models.Product p = new Models.Product();

                int productID = Convert.ToInt32(Request.Params["productID"]);
                p = BusinessLogic.GetProduct(productID);

                DataTable dt = new DataTable();
                DataRow dr = null;
                dt.Columns.Add("ProductName", typeof(String));
                dt.Columns.Add("ProductImage", typeof(String));
                dt.Columns.Add("ProductID", typeof(String));
                dt.Columns.Add("ProductPrice", typeof(decimal));
                dt.Columns.Add("ProductManufacturer", typeof(String));
                dt.Columns.Add("ProductDescription", typeof(String));
                dt.Columns.Add("ProductMaterial", typeof(String));

                dr = dt.NewRow();
                dr["ProductName"] = p.productName;
                dr["ProductImage"] = p.productImage;
                dr["ProductID"] = p.productID;
                dr["ProductPrice"] = p.productPrice;
                dr["ProductManufacturer"] = p.productManufacturer;
                dr["ProductDescription"] = p.productDescription;
                dr["ProductMaterial"] = p.productMaterial;
                dt.Rows.Add(dr);

                dt.AcceptChanges();
                ProductListing.DataSource = dt;
                ProductListing.DataBind();
            }
        }

        //Adds product to users cart, redirects to cart
        //If not logged in sends them to login
        protected void Addtocart(object sender, EventArgs e)
        {
            if (Session["username"] == null || Session["username"].ToString() == "")
            {
                var returnUrl = Server.UrlEncode(Request.Url.PathAndQuery);
                Response.Redirect("~/UserLayer/UserLogin.aspx?ReturnUrl=" + returnUrl, false);
            }
            else
            {
                BusinessLogic.AddToCart(Session["username"].ToString(), Convert.ToInt32(Request.Params["productID"]));
                Response.Redirect("~/UserLayer/ShoppingCart.aspx", false);
            }
        }
    }
}