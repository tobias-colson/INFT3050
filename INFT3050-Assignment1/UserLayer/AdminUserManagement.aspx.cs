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
    public partial class AdminUserManagement : System.Web.UI.Page
    {
        //String holding user account status
        protected string AccountStatus = "Normal";

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //Goes back to the landing page
        protected void Return(object sender, EventArgs e)
        {
            Response.Redirect("~/UserLayer/AdminLanding.aspx");
        }

        //Hides the account, shows search
        protected void Back(object sender, EventArgs e)
        {
            userSearch.Visible = true;
            userAccount.Visible = false;
        }

        //Searches user, sets username to be displayed and shows account panel
        //Gets their product history and displays with ADO.net table
        //Also gets account status and displays appropriate button for changing it
        protected void UserSearch(object sender, EventArgs e)
        {
            UserAccount user = BusinessLogic.GetUser(searchUser.Text);

            if (user.userName == searchUser.Text)
            {
                Session["UserAccount"] = searchUser.Text;
                userSearch.Visible = false;
                userAccount.Visible = true;

                List<Models.CHProduct> products = new List<Models.CHProduct>();
                products = BusinessLogic.GetHistoryItems(searchUser.Text);

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

                if (!user.accountStatus)
                {
                    this.status.Text = "Suspended";
                    suspendbtn.Visible = false;
                    reinstatebtn.Visible = true;
                }
                else
                {
                    this.status.Text = "Active";
                    suspendbtn.Visible = true;
                    reinstatebtn.Visible = false;
                }
            }
            else
            {
                this.NoExist.Visible = true;
            }
        }

        //Suspends account of user
        protected void Suspend(object sender, EventArgs e)
        {
            BusinessLogic.SuspendAccount(Session["UserAccount"].ToString());
            UserAccount user = BusinessLogic.GetUser(Session["UserAccount"].ToString());
            if (!user.accountStatus)
            {
                this.status.Text = "Suspended";
            }
            suspendbtn.Visible = false;
            reinstatebtn.Visible = true;
        }

        //Reinstates account
        protected void Reinstate(object sender, EventArgs e)
        {
            BusinessLogic.ReinstateAccount(Session["UserAccount"].ToString());
            UserAccount user = BusinessLogic.GetUser(Session["UserAccount"].ToString());
            if (user.accountStatus)
            {
                this.status.Text = "Active";
            }

            suspendbtn.Visible = true;
            reinstatebtn.Visible = false;
        }
    }
}