using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using INFT3050_Assignment1.BusinessLayer;

namespace INFT3050_Assignment1.UserLayer
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //Redirects to the admin landing page, adds username to Session for display in nav bar
        //Finds admin in the database
        //Either logs in or shows pertinent error message depending
        //Privilege does nothing, had intended to create content lock outs but ran out of time
        protected void LogIn(object sender, EventArgs e)
        {
            string user = this.adminUsername.Text;
            string pass = this.adminPassword.Text;
            int result = BusinessLogic.AdminLogin(user, pass);
            if (result == 2)
            {
                Session["username"] = user;
                Session["privilege"] = 0;
                this.errorMessage.Visible = false;
                this.disabledMessage.Visible = false;
                Response.Redirect("~/UserLayer/AdminLanding.aspx");
            }
            else if (result == 1)
            {
                this.errorMessage.Visible = false;
                this.disabledMessage.Visible = true;
            }
            else
            {
                this.disabledMessage.Visible = false;
                this.errorMessage.Visible = true;
            }
        }
    }
}