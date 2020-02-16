using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace INFT3050_Assignment1.Models
{
    public class AdminAccount
    {
        public int adminID { get; set; }
        public string adminName { get; set; }
        public string adminPassword { get; set; }
        public string adminEmail { get; set; }
    }
}