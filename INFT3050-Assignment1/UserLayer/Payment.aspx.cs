using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using INFT3050_Assignment1.BusinessLayer;

namespace INFT3050_Assignment1.UserLayer
{
    public partial class Payment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //Takes inputs relevant to making a payment
        //Inputs aren't completely error trapped so be gentle
        //Then sends them to the function
        //Redirects to confirmation if successful, otherwise error message
        protected void MakePayment(object sender, EventArgs e)
        {
            string name = this.firstName.Text + " " + this.lastName.Text;
            string cardnum = this.cardNumber.Text;
            int cvc = Convert.ToInt32(this.CVC.Text);
            DateTime expiry = Convert.ToDateTime(this.expiry.Text);
            int result = BusinessLogic.MakePayment(name, cardnum, cvc, expiry);

            switch (result)
            {
                case 0:
                    Response.Redirect("~/UserLayer/PaymentConfirmed.aspx");
                    break;
                case 1:
                    this.timedout.Visible = false;
                    this.declined.Visible = true;
                    break;
                case 2:
                    this.timedout.Visible = false;
                    this.declined.Visible = true;
                    break;
                case 3:
                    this.timedout.Visible = false;
                    this.declined.Visible = true;
                    break;
                case 4:
                    this.timedout.Visible = true;
                    this.declined.Visible = false;
                    break;
            }

            
        }
    }
}