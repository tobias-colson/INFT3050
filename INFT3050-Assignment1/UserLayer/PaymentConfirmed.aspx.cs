using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using INFT3050_Assignment1.BusinessLayer;

namespace INFT3050_Assignment1.UserLayer
{
    public partial class PaymentConfirmed : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Moves those "purchased" items to their history
            BusinessLogic.CartToHistory(Session["Username"].ToString());
        }
    }
}