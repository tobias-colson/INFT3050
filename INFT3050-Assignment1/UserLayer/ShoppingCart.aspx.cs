using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using INFT3050_Assignment1.BusinessLayer;
using System.Data;

namespace INFT3050_Assignment1.UserLayer
{
    public partial class ShoppingCart : System.Web.UI.Page
    {
        //Total amount of all items in cart
        private decimal totalAmount = 0;

        //Get items in users cart and display them via databinding
        //Also the total cost of all items
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                List<Models.CHProduct> products = new List<Models.CHProduct>();
                products = BusinessLogic.GetCartItems(Session["username"].ToString());

                DataTable dt = new DataTable();
                DataRow dr = null;
                dt.Columns.Add("ProductName", typeof(String));
                dt.Columns.Add("ProductID", typeof(int));
                dt.Columns.Add("ImagePath", typeof(String));
                dt.Columns.Add("Quantity", typeof(int));
                dt.Columns.Add("ProductPrice", typeof(decimal));
                dt.Columns.Add("ProductManufacturer", typeof(String));
                dt.Columns.Add("Subtotal", typeof(decimal));

                decimal subtotal = 0;
               
                foreach (Models.CHProduct p in products)
                {
                    dr = dt.NewRow();
                    dr["ProductName"] = p.productName;
                    dr["ImagePath"] = p.productImage;
                    dr["ProductID"] = p.productID;
                    dr["ProductPrice"] = p.productPrice;
                    dr["ProductManufacturer"] = p.productManufacturer;
                    dr["Quantity"] = p.quantity;
                    subtotal = p.productPrice * p.quantity;
                    totalAmount += subtotal;
                    dr["Subtotal"] = subtotal;
                    dt.Rows.Add(dr);
                }

                dt.AcceptChanges();
                ProductList.DataSource = dt;
                ProductList.DataBind();
                this.Total.Text = "$ " + totalAmount.ToString();
            }
        }
        
        //Redirects to payment page
        protected void Checkout(object sender, EventArgs e)
        {
            BusinessLogic.SendTotal(totalAmount);
            Response.Redirect("/UserLayer/Payment.aspx");
        }
    }
}