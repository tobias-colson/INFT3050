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
    public partial class PurchaseHistory : System.Web.UI.Page
    {
        //On load get the user's purchase history as a list of CHProduct objects
        //Display them via databinding
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                List<Models.CHProduct> products = new List<Models.CHProduct>();
                products = BusinessLogic.GetHistoryItems(Session["username"].ToString());

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
                    dr["Subtotal"] = subtotal;
                    dt.Rows.Add(dr);
                }

                dt.AcceptChanges();
                ProductList.DataSource = dt;
                ProductList.DataBind();
            }
        }
    }
}