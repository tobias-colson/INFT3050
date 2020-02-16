using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace INFT3050_Assignment1.Models
{
    public class HistoryItems
    {
        public int historyItemsID { get; set; }
        public int productID { get; set; }
        public int quantity { get; set; }
        public int purchaseHistoryID { get; set; }
    }
}