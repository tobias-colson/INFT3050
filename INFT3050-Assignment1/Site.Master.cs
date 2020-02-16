using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace INFT3050_Assignment1
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //If Session variable username isn't null or an empty string
            if (Session["username"] != null && Session["username"].ToString() != String.Empty)
            {
                //show the logout and account links
                loggedin.Visible = true;
                loggedout.Visible = false;
            }
            else
            {
                //else don't
                loggedin.Visible = false;
                loggedout.Visible = true;
            }
        }

        //Logout clears the username stored in session and refreshes page
        protected void Logout(object sender, EventArgs e)
        {
            Session["username"] = "";
            Page.Response.Redirect("~/UserLayer/Home.aspx", false);
        }

        protected void Login(object sender, EventArgs e)
        {
            var returnUrl = Server.UrlEncode(Request.Url.PathAndQuery);
            Response.Redirect("~/UserLayer/UserLogin.aspx?ReturnUrl=" + returnUrl, false);
        }
    }
}