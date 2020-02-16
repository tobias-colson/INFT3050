using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace INFT3050_Assignment1.Models
{
    public class CHProduct //Composite of CartItem/PurchaseHistory and Product models
    {
        public int productID { get; set; }
        public string productName { get; set; }
        public string productManufacturer { get; set; }
        public decimal productPrice { get; set; }
        public string productImage { get; set; }
        public int quantity { get; set; }
    }
}