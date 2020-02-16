using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using INFT3050_Assignment1.BusinessLayer;

namespace INFT3050_Assignment1.UserLayer
{
    public partial class UserLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //Find user in db
        //If exists and allowed to login redirect
        //Otherwise error message
        protected void LogIn(object sender, EventArgs e)
        {
            string user = this.userUsername.Text;
            string pass = this.userPassword.Text;
            int result = BusinessLogic.LoginAttempt(user, pass);
            if (result == 2)
            {
                Session["username"] = user;
                Session["privilege"] = 0;
                this.errorMessage.Visible = false;
                this.disabledMessage.Visible = false;
                var returnUrl = Request.QueryString["ReturnURL"];
                if (string.IsNullOrEmpty(returnUrl))
                {
                    returnUrl = "~/UserLayer/Home.aspx";
                }
                Response.Redirect(returnUrl, false);
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