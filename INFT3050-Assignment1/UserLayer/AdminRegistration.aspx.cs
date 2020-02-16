using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using INFT3050_Assignment1.BusinessLayer;

namespace INFT3050_Assignment1.UserLayer
{
    public partial class AdminRegistration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //Adds admin account, sessions username and redirects to landing page
        //Queries db to do so
        protected void Register(object sender, EventArgs e)
        {

            string username = adminUsername.Text;
            string password = adminPassReg.Text;
            string email = adminEmail.Text;

            BusinessLogic.AddAdmin(username, password, email);
            Session.Add("username", username);
            Response.Redirect("~/UserLayer/AdminLanding.aspx");
        }
    }
}