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
    public partial class MensWatches : System.Web.UI.Page
    {
        //On load get all the watches that are men category
        //Display them with datatable binding
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                List<Models.Product> products = new List<Models.Product>();
                products = BusinessLogic.GetMensProducts();

                DataTable dt = new DataTable();
                DataRow dr = null;
                dt.Columns.Add("ProductName", typeof(String));
                dt.Columns.Add("ImagePath", typeof(String));
                dt.Columns.Add("ProductID", typeof(String));
                dt.Columns.Add("ProductPrice", typeof(decimal));
                dt.Columns.Add("ProductManufacturer", typeof(String));

                foreach (Models.Product p in products)
                {
                    dr = dt.NewRow();
                    dr["ProductName"] = p.productName;
                    dr["ImagePath"] = p.productImage;
                    dr["ProductID"] = p.productID;
                    dr["ProductPrice"] = p.productPrice;
                    dr["ProductManufacturer"] = p.productManufacturer;
                    dt.Rows.Add(dr);
                }

                dt.AcceptChanges();
                ProductList.DataSource = dt;
                ProductList.DataBind();
            }
        }
    }
}