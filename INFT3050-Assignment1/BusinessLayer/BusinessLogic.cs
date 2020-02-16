using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using INFT3050_Assignment1.DataAcessLayer;
using INFT3050_Assignment1.Models;
using INFT3050.PaymentSystem;

namespace INFT3050_Assignment1.BusinessLayer
{
    public class BusinessLogic
    {
        private static decimal total = 0;        

        //Returns an integer representing a success/failure condition
        //2 is successful
        //1 is disabled account
        //0 is doesn't exist
        public static int LoginAttempt (string username, string password)
        {
            int result = DataAccessLogic.LoginAttempt(username, password);
            if (result == 2)
            {
                return 2;
            }
            else if (result == 1)
            {
                return 1;
            }
            else
            {
                return 0;
            }
        }

        //Same but for admin accounts
        public static int AdminLogin (string username, string password)
        {
            int result = DataAccessLogic.AdminLogin(username, password);
            if (result == 2)
            {
                return 2;
            }
            else if (result == 1)
            {
                return 1;
            }
            else
            {
                return 0;
            }
        }

        //Returns a list of men's products from the DAL to be displayed in the user layer
        public static List<Product> GetMensProducts()
        {
            List<Product> products = new List<Product>();
            products = DataAccessLogic.GetMensProducts();
            return products;
        }

        //Same but womens
        public static List<Product> GetWomensProducts()
        {
            List<Product> products = new List<Product>();
            products = DataAccessLogic.GetWomensProducts();
            return products;
        }

        //Returns a single product model to be displayed
        public static Product GetProduct(int productID)
        {
            Product product = new Product();
            product = DataAccessLogic.GetProduct(productID);
            return product;
        }

        //Passes a user's credentials to be added to the database in the DAL
        public static void AddUser (string username, string password)
        {
            DataAccessLogic.AddUser(username, password);
            return;
        }

        //Same but admin
        public static void AddAdmin(string username, string password, string email)
        {
            DataAccessLogic.AddAdmin(username, password, email);
            return;
        }

        //Adds a product matching the ID to the users cart
        public static void AddToCart(string username, int productID)
        {
            DataAccessLogic.AddToCart(username, productID);
            return;
        }

        //Gets all the items in a users cart
        public static List<CHProduct> GetCartItems(string username)
        {
            List<CHProduct> products = new List<CHProduct>();
            products = DataAccessLogic.GetCartItems(username);
            return products;
        }

        //Gets all the items in a users purchase history
        public static List<CHProduct> GetHistoryItems(string username)
        {
            List<CHProduct> products = new List<CHProduct>();
            products = DataAccessLogic.GetHistoryItems(username);
            return products;
        }

        //Get's a user account
        public static UserAccount GetUser(string username)
        {
            UserAccount user = new UserAccount();
            user = DataAccessLogic.GetUser(username);
            return user;
        }

        //Suspends a user's account
        public static void SuspendAccount(string username)
        {
            DataAccessLogic.SuspendAccount(username);
            return;
        }

        //Reactivates the account
        public static void ReinstateAccount(string username)
        {
            DataAccessLogic.ReinstateAccount(username);
            return;
        }

        //Deletes an item from the database
        public static void DeleteItem(int productID)
        {
            DataAccessLogic.DeleteItem(productID);
            return;
        }

        //Creates a new item in the database
        public static Product CreateItem(string name, string manufacturer, string description, string materials, decimal price, string category)
        {
            Product product = DataAccessLogic.CreateItem(name, manufacturer, description, materials, price, category);
            return product;
        }

        //Updates a item matching the productID with provided details
        public static Product UpdateItem(int id, string name, string manufacturer, string description, string materials, decimal price, string category)
        {
            Product product = DataAccessLogic.UpdateItem(id, name, manufacturer, description, materials, price, category);
            return product;
        }

        //Updates the stored imagepath to be consistent with others
        public static void UpdateImagePath(int productID, string imagePath)
        {
            DataAccessLogic.UpdateImagePath(productID, imagePath);
            return;
        }

        //Used to store the total of a shopping cart in the private business logic value
        public static void SendTotal(decimal tot)
        {
            total = tot;
            return;
        }

        //The super janky payment function. Not sure if this how it's supposed to work but it seems to?
        public static int MakePayment(string name, string cardnum, int cvc, DateTime expiry)
        {
            IPaymentSystem paymentSystem = INFT3050PaymentFactory.Create();
            PaymentRequest payment = new PaymentRequest();

            payment.CardName = name;
            payment.CardNumber = cardnum;
            payment.CVC = cvc;
            payment.Expiry = expiry;
            payment.Amount = total;
            payment.Description = "Lotsa Watches";
            var task = paymentSystem.MakePayment(payment);
            System.Threading.Thread.Sleep(5000);
            if (task.IsCompleted)
            {
                var result = Convert.ToInt32(task.Result.TransactionResult);

                switch (result)
                {
                    case 0:
                        return 0;
                    case 1:
                        return 1;
                    case 2:
                        return 2;
                    case 3:
                        return 3;
                    case 4:
                        return 4;
                    default:
                        return 4;
                }
            }
            else
            {
                return 4;
            }
        }

        //Moves the user's cart to history upon successful checkout
        public static void CartToHistory(string username)
        {
            DataAccessLogic.CartToHistory(username);
            return;
        }
    }
}