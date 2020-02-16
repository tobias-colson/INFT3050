using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace INFT3050_Assignment1.Models
{
    public class CartItems
    {
        public int cartItemsID { get; set; }
        public int productID { get; set; }
        public int quantity { get; set; }
        public int cartID { get; set; }
    }
}