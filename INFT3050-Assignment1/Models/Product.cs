using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace INFT3050_Assignment1.Models
{
    public class Product
    {
        public int productID { get; set; }
        public string productName { get; set; }
        public string productManufacturer { get; set; }
        public decimal productPrice { get; set; }
        public string productDescription { get; set; }
        public string productMaterial { get; set; }
        public string productImage { get; set; }
        public string productCategory { get; set; }
    }
}