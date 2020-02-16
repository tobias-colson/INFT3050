using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace INFT3050_Assignment1.Models
{
    public class UserAccount
    {
        public int userID { get; set; }
        public string userName { get; set; }
        public string userPassword { get; set; }
        public bool accountStatus { get; set; }
    }
}