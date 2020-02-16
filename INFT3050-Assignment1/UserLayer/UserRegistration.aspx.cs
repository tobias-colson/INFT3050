using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using INFT3050_Assignment1.BusinessLayer;

namespace INFT3050_Assignment1.UserLayer
{
    public partial class UserRegistration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //Onclick that adds user to db and redirects
        protected void Register(object sender, EventArgs e)
        {
            string username = userUsername.Text;
            string password = userPassReg.Text;
            
            BusinessLogic.AddUser(username, password);

            Session.Add("username", userUsername.Text);
            Response.Redirect("~/UserLayer/Home.aspx");
        }
    }
}