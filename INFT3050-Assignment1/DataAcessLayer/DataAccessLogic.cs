using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;
using INFT3050_Assignment1.Models;


namespace INFT3050_Assignment1.DataAcessLayer
{
    public class DataAccessLogic
    {
        //The db connection and sql command variables to be used throughout
        static SqlConnection dbConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["ApolloWatches"].ConnectionString);
        static SqlCommand command;

        //Queries the database for a user matching the provided credentials
        //Returns an int 0-2 dependent on result
        public static int LoginAttempt(string username, string password)
        {
            if (dbConnection != null && dbConnection.State == ConnectionState.Closed) //No open connections or error
            {
                dbConnection.Open(); //Opens connection
            }
            password = GetHashString(password); //MD5 hashes the password

            string checkUser = " SELECT * FROM UserAccount WHERE userName = @username AND userPassword = @password";  //Query String

            command = new SqlCommand(checkUser, dbConnection); //Initialised command using string

            command.Parameters.AddWithValue("@username", username); //Adds parameters, stops injection
            command.Parameters.AddWithValue("@password", password);

            string id = null; 
            string enabled = "false";

            SqlDataReader results = command.ExecuteReader(); //Runs command
            while (results.Read()) //Reads results
            {
                id = results.GetValue(0).ToString();
                enabled = results.GetValue(3).ToString();
            }

            dbConnection.Close(); //closes connection

            if (id != null && enabled == "True") //Exists and enabled
            {
                return 2;
            }
            else if (id != null && enabled == "False") //Disabled
            {
                return 1;
            }
            else //No existing user
            {
                return 0;
            }
        }

        //Same as user but querying the admin account table instead
        public static int AdminLogin(string username, string password)
        {
            if (dbConnection != null && dbConnection.State == ConnectionState.Closed)
            {
                dbConnection.Open();
            }
            password = GetHashString(password);

            string checkUser = " SELECT * FROM AdminAccount WHERE adminName = @username AND adminPassword = @password";

            command = new SqlCommand(checkUser, dbConnection);

            command.Parameters.AddWithValue("@username", username);
            command.Parameters.AddWithValue("@password", password);

            string id = null;
            string enabled = "True";

            SqlDataReader results = command.ExecuteReader();
            while (results.Read())
            {
                id = results.GetValue(0).ToString();
            }

            dbConnection.Close();

            if (id != null && enabled == "True")
            {
                return 2;
            }
            else if (id != null && enabled == "False")
            {
                return 1;
            }
            else
            {
                return 0;
            }
        }

        //Returns a list of products that have category "Men"
        //Queries the db, adds the results one at a time to a temporary product object
        //Inserts object into list
        //That list is returned
        public static List<Product> GetMensProducts()
        {
            List<Product> products = new List<Product>();
            Product product = null;

            if (dbConnection != null && dbConnection.State == ConnectionState.Closed)
            {
                dbConnection.Open();
            }
            command = new SqlCommand("SELECT * FROM Product", dbConnection);

            SqlDataReader reader = command.ExecuteReader();

            while (reader.Read())
            {
                if (reader.GetString(7) == "Men")
                {
                    product = new Product();
                    product.productID = Convert.ToInt32(reader.GetValue(0));
                    product.productName = reader.GetString(1);
                    product.productManufacturer = reader.GetString(2);
                    product.productPrice = reader.GetDecimal(3);
                    product.productDescription = reader.GetString(4);
                    product.productMaterial = reader.GetString(5);
                    product.productImage = reader.GetString(6);
                    product.productCategory = reader.GetString(7);
                    products.Add(product);
                }
            }
            dbConnection.Close();
            return products;
        }

        //Same as above except for category "Women"
        public static List<Product> GetWomensProducts()
        {
            List<Product> products = new List<Product>();
            Product product = null;

            if (dbConnection != null && dbConnection.State == ConnectionState.Closed)
            {
                dbConnection.Open();
            }
            command = new SqlCommand("SELECT * FROM Product", dbConnection);

            SqlDataReader reader = command.ExecuteReader();

            while (reader.Read())
            {
                if (reader.GetString(7) == "Women")
                {
                    product = new Product();
                    product.productID = Convert.ToInt32(reader.GetValue(0));
                    product.productName = reader.GetString(1);
                    product.productManufacturer = reader.GetString(2);
                    product.productPrice = reader.GetDecimal(3);
                    product.productDescription = reader.GetString(4);
                    product.productMaterial = reader.GetString(5);
                    product.productImage = reader.GetString(6);
                    product.productCategory = reader.GetString(7);
                    products.Add(product);
                }
            }
            dbConnection.Close();
            return products;
        }

        //Queries the database for a single product matching the ID
        public static Product GetProduct(int productID)
        {
            Product product = new Product();
            if (dbConnection != null && dbConnection.State == ConnectionState.Closed)
            {
                dbConnection.Open();
            }
            string checkUser = " SELECT * FROM Product WHERE productID = @productID";

            command = new SqlCommand(checkUser, dbConnection);

            command.Parameters.AddWithValue("@productID", productID);

            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                product.productID = Convert.ToInt32(reader.GetValue(0));
                product.productName = reader.GetString(1);
                product.productManufacturer = reader.GetString(2);
                product.productPrice = reader.GetDecimal(3);
                product.productDescription = reader.GetString(4);
                product.productMaterial = reader.GetString(5);
                product.productImage = reader.GetString(6);
                product.productCategory = reader.GetString(7);
            }

            dbConnection.Close();
            return product;
        }

        //Adds a user to the database
        //Doesn't require a unique user name, probably should
        //Creates a UserAccount, ShoppingCart and PurchaseHistory entry for the user
        public static void AddUser(string username, string password)
        {
            if (dbConnection != null && dbConnection.State == ConnectionState.Closed)
            {
                dbConnection.Open();
            }

            password = GetHashString(password);

            string addUser = "INSERT INTO UserAccount (userName, userPassword, accountStatus) VALUES (@username, @password, @status)";

            command = new SqlCommand(addUser, dbConnection);

            command.Parameters.AddWithValue("@username", username);
            command.Parameters.AddWithValue("@password", password);
            command.Parameters.AddWithValue("@status", true);

            command.ExecuteNonQuery();

            UserAccount user = GetUser(username);

            string createCart = "INSERT INTO ShoppingCart (userID) VALUES (@userID)";

            command = new SqlCommand(createCart, dbConnection);

            command.Parameters.AddWithValue("@userID", user.userID);

            command.ExecuteNonQuery();

            string createHistory = "INSERT INTO PurchaseHistory (userID) VALUES (@userID)";

            command = new SqlCommand(createHistory, dbConnection);

            command.Parameters.AddWithValue("@userID", user.userID);

            command.ExecuteNonQuery();

            dbConnection.Close();

            return;
        }

        //Returns a user matching the username
        //Hence why I should have made the usernames have a unique requirement
        public static UserAccount GetUser(string username)
        {
            if (dbConnection != null && dbConnection.State == ConnectionState.Closed)
            {
                dbConnection.Open();
            }

            UserAccount user = new UserAccount();
            
            string checkUser = " SELECT * FROM UserAccount WHERE userName = @username";

            command = new SqlCommand(checkUser, dbConnection);

            command.Parameters.AddWithValue("@username", username);

            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                user.userID = Convert.ToInt32(reader.GetValue(0));
                user.userName = reader.GetString(1);
                user.userPassword = reader.GetString(2);
                user.accountStatus = reader.GetBoolean(3);
            }

            reader.Close();

            return user;
        }

        //Adds an admin account, no purchase history or cart though
        public static void AddAdmin(string username, string password, string email)
        {
            if (dbConnection != null && dbConnection.State == ConnectionState.Closed)
            {
                dbConnection.Open();
            }

            password = GetHashString(password);

            string addUser = "INSERT INTO AdminAccount (adminName, adminPassword, adminEmail) VALUES (@username, @password, @email)";

            command = new SqlCommand(addUser, dbConnection);

            command.Parameters.AddWithValue("@username", username);
            command.Parameters.AddWithValue("@password", password);
            command.Parameters.AddWithValue("@email", email);

            command.ExecuteNonQuery();

            dbConnection.Close();

            return;
        }

        //Adds a product via ID to a user's cart items
        //Does this by adding entry to CartItems
        //Entry has cartID attached to userID, productID for product and quantity = number in cart already + 1
        public static void AddToCart(string username, int productID)
        {
            if (dbConnection != null && dbConnection.State == ConnectionState.Closed)
            {
                dbConnection.Open();
            }

            UserAccount user = GetUser(username);
            ShoppingCart cart = GetCart(user.userID);
            CartItems items = GetCartItem(cart.cartID, productID);
            string addItem;

            if (items.cartItemsID != 0)
            {
                addItem = "UPDATE CartItems SET quantity = @quantity WHERE cartID = @cartID AND productID = @productID";
                command = new SqlCommand(addItem, dbConnection);

                int quantity = items.quantity + 1;
                command.Parameters.AddWithValue("@quantity", quantity);
                command.Parameters.AddWithValue("@productID", productID);
                command.Parameters.AddWithValue("@cartID", cart.cartID);

                command.ExecuteNonQuery();
            }
            else
            {
                addItem = "INSERT INTO CartItems (productID, quantity, cartID) VALUES (@productID, 1, @cartID)";
                command = new SqlCommand(addItem, dbConnection);

                command.Parameters.AddWithValue("@productID", productID);
                command.Parameters.AddWithValue("@cartID", cart.cartID);

                command.ExecuteNonQuery();
            }

            dbConnection.Close();

            return;
        }

        //Private function to return a user's shopping cart entry
        //Mostly used for the cart ID to update items in associated CartItems entries
        private static ShoppingCart GetCart(int userID)
        {
            ShoppingCart cart = new ShoppingCart();

            string getCart = " SELECT * FROM ShoppingCart WHERE userID = @userid";

            command = new SqlCommand(getCart, dbConnection);

            command.Parameters.AddWithValue("@userid", userID);

            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                cart.cartID = Convert.ToInt32(reader.GetValue(0));
                cart.userID = Convert.ToInt32(reader.GetValue(1));
            }

            reader.Close();

            return cart;
        }

        //Private function to return the item in a user's cart matching ID's
        private static CartItems GetCartItem(int cartID, int productID)
        {
            CartItems items = new CartItems();

            string getItems = " SELECT * FROM CartItems WHERE cartID = @cartID AND productID = @productID";

            command = new SqlCommand(getItems, dbConnection);

            command.Parameters.AddWithValue("@cartID", cartID);
            command.Parameters.AddWithValue("@productID", productID);

            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                items.cartItemsID = Convert.ToInt32(reader.GetValue(0));
                items.productID = Convert.ToInt32(reader.GetValue(1));
                items.quantity = Convert.ToInt32(reader.GetValue(2));
                items.cartID = Convert.ToInt32(reader.GetValue(3));
            }

            reader.Close();

            return items;
        }

        //Returns a composite object of product and cart item, so all the details of the product and the quantity in cart
        //Needed to populate the shopping cart properly
        public static List<CHProduct> GetCartItems(string username)
        {
            List<CHProduct> products = new List<CHProduct>();

            if (dbConnection != null && dbConnection.State == ConnectionState.Closed)
            {
                dbConnection.Open();
            }

            UserAccount user = GetUser(username);
            ShoppingCart cart = GetCart(user.userID);
            List<CartItems> items = GetUserCart(cart.cartID);

            foreach(CartItems item in items)
            {
                CHProduct chProduct = new CHProduct();
                chProduct.quantity = item.quantity;
                Product product = GetProduct(item.productID);
                chProduct.productID = product.productID;
                chProduct.productName = product.productName;
                chProduct.productManufacturer = product.productManufacturer;
                chProduct.productPrice = product.productPrice;
                chProduct.productImage = product.productImage;

                products.Add(chProduct);
            }

            dbConnection.Close();

            return products;
        }

        //Does the same but for the items in the purchase history
        public static List<CHProduct> GetHistoryItems(string username)
        {
            List<CHProduct> products = new List<CHProduct>();

            if (dbConnection != null && dbConnection.State == ConnectionState.Closed)
            {
                dbConnection.Open();
            }

            UserAccount user = GetUser(username);
            PurchaseHistory history = GetPurchaseHistory(user.userID);
            List<HistoryItems> items = GetUserHistory(history.purchaseHistoryID);

            foreach (HistoryItems item in items)
            {
                CHProduct chProduct = new CHProduct();
                chProduct.quantity = item.quantity;
                Product product = GetProduct(item.productID);
                chProduct.productID = product.productID;
                chProduct.productName = product.productName;
                chProduct.productManufacturer = product.productManufacturer;
                chProduct.productPrice = product.productPrice;
                chProduct.productImage = product.productImage;

                products.Add(chProduct);
            }

            dbConnection.Close();

            return products;
        }

        //Gets all the items associated with a singular shopping cart ID
        //Used in the GetCartItems function to create the lists using the productID values
        private static List<CartItems> GetUserCart(int cartID)
        {
            List<CartItems> items = new List<CartItems>();

            string getItems = " SELECT * FROM CartItems WHERE cartID = @cartID";

            command = new SqlCommand(getItems, dbConnection);

            command.Parameters.AddWithValue("@cartID", cartID);

            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                CartItems item = new CartItems();
                item.cartItemsID = Convert.ToInt32(reader.GetValue(0));
                item.productID = Convert.ToInt32(reader.GetValue(1));
                item.quantity = Convert.ToInt32(reader.GetValue(2));
                item.cartID = Convert.ToInt32(reader.GetValue(3));
                items.Add(item);
            }

            reader.Close();

            return items;
        }

        //Same for GetHistoryItems
        private static List<HistoryItems> GetUserHistory(int historyID)
        {
            List<HistoryItems> items = new List<HistoryItems>();

            string getItems = " SELECT * FROM HistoryItems WHERE purchaseHistoryID = @historyID";

            command = new SqlCommand(getItems, dbConnection);

            command.Parameters.AddWithValue("@historyID", historyID);

            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                HistoryItems item = new HistoryItems();
                item.historyItemsID = Convert.ToInt32(reader.GetValue(0));
                item.productID = Convert.ToInt32(reader.GetValue(1));
                item.quantity = Convert.ToInt32(reader.GetValue(2));
                item.purchaseHistoryID = Convert.ToInt32(reader.GetValue(3));
                items.Add(item);
            }

            reader.Close();

            return items;
        }

        //Converts the items in a user's shopping cart i.e all CartItems with same cartID to purchase history
        //Does this by getting all associated items, placing them inside a list
        //Iterating the list and inserting into HistoryItems a matching entry
        //Then deleting the items from the CartItems table
        public static void CartToHistory(string username)
        {
            if (dbConnection != null && dbConnection.State == ConnectionState.Closed)
            {
                dbConnection.Open();
            }

            UserAccount user = GetUser(username);
            PurchaseHistory history = GetPurchaseHistory(user.userID);
            ShoppingCart cart = GetCart(user.userID);
            List<CartItems> cartItems = GetUserCart(cart.cartID);

            string addItem = "INSERT INTO HistoryItems(productID, quantity, purchaseHistoryID) VALUES(@productID, @quantity, @purchaseHistoryID)";

            foreach (CartItems ci in cartItems)
            {
                command = new SqlCommand(addItem, dbConnection);

                command.Parameters.AddWithValue("@quantity", ci.quantity);
                command.Parameters.AddWithValue("@productID", ci.productID);
                command.Parameters.AddWithValue("@purchaseHistoryID", history.purchaseHistoryID);

                command.ExecuteNonQuery();
            }

            string delete = "DELETE FROM CartItems WHERE cartID = @cartID";

            command = new SqlCommand(delete, dbConnection);

            command.Parameters.AddWithValue("@cartID", cart.cartID);
            
            command.ExecuteNonQuery();

            dbConnection.Close();

            return;
        }

        //Gets a user's purchase history, mostly for the ID
        private static PurchaseHistory GetPurchaseHistory(int userID)
        {
            PurchaseHistory history = new PurchaseHistory();

            string getHistory = " SELECT * FROM PurchaseHistory WHERE userID = @userid";

            command = new SqlCommand(getHistory, dbConnection);

            command.Parameters.AddWithValue("@userid", userID);

            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                history.purchaseHistoryID = Convert.ToInt32(reader.GetValue(0));
                history.userID = Convert.ToInt32(reader.GetValue(1));
            }

            reader.Close();

            return history;
        }

        //Changes the account status of a user to suspended
        public static void SuspendAccount(string username)
        {
            if (dbConnection != null && dbConnection.State == ConnectionState.Closed)
            {
                dbConnection.Open();
            }

            UserAccount user = GetUser(username);
            string status = "UPDATE UserAccount SET accountStatus = 'false' WHERE userID = @userID";
            command = new SqlCommand(status, dbConnection);
            
            command.Parameters.AddWithValue("@userID", user.userID);

            command.ExecuteNonQuery(); 
            dbConnection.Close();
            return;
        }

        //Reactivates an account that is disabled
        public static void ReinstateAccount(string username)
        {
            if (dbConnection != null && dbConnection.State == ConnectionState.Closed)
            {
                dbConnection.Open();
            }

            UserAccount user = GetUser(username);
            string status = "UPDATE UserAccount SET accountStatus = 'true' WHERE userID = @userID";
            command = new SqlCommand(status, dbConnection);

            command.Parameters.AddWithValue("@userID", user.userID);

            command.ExecuteNonQuery();
            dbConnection.Close();
            return;
        }

        //Removes an item from the database
        public static void DeleteItem(int productID)
        {
            if (dbConnection != null && dbConnection.State == ConnectionState.Closed)
            {
                dbConnection.Open();
            }

            string status = "DELETE FROM Product WHERE productID = @productID";
            command = new SqlCommand(status, dbConnection);

            command.Parameters.AddWithValue("@productID", productID);

            command.ExecuteNonQuery();
            dbConnection.Close();
            return;
        }

        //Adds a new item to the database
        //Takes in values and initialises query to them
        //Then gets that created product and returns it for use in creating the image path string
        public static Product CreateItem(string name, string manufacturer, string description, string materials, decimal price, string category)
        {
            Product product = new Product();

            if (dbConnection != null && dbConnection.State == ConnectionState.Closed)
            {
                dbConnection.Open();
            }

            string status = "INSERT INTO Product(productName, productManufacturer, productPrice, productDescription," +
                "productMaterials, productImage, productCategory) VALUES (@productName, @productManufacturer, @productPrice, " +
                "@productDescription, @productMaterials, '', @productCategory)";

            command = new SqlCommand(status, dbConnection);

            command.Parameters.AddWithValue("@productName", name);
            command.Parameters.AddWithValue("@productManufacturer", manufacturer);
            command.Parameters.AddWithValue("@productPrice", price);
            command.Parameters.AddWithValue("@productDescription", description);
            command.Parameters.AddWithValue("@productMaterials", materials);
            command.Parameters.AddWithValue("@productCategory", category);

            command.ExecuteNonQuery();

            string newItem = " SELECT MAX(productID) FROM Product";

            command = new SqlCommand(newItem, dbConnection);

            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                product.productID = Convert.ToInt32(reader.GetValue(0));
            }

            reader.Close();

            product = GetProduct(product.productID);

            dbConnection.Close();

            return product;
        }

        //Does the same as create item except updates an existing entry 
        public static Product UpdateItem(int id, string name, string manufacturer, string description, string materials, decimal price, string category)
        {
            Product product = new Product();

            if (dbConnection != null && dbConnection.State == ConnectionState.Closed)
            {
                dbConnection.Open();
            }

            string status = "UPDATE Product SET productName = @productName, productManufacturer = @productManufacturer, " +
                "productPrice = @productPrice, productDescription = @productDescription," +
                "productMaterials = @productMaterials, productImage = '', productCategory = @productCategory WHERE productID = @productID";

            command = new SqlCommand(status, dbConnection);

            command.Parameters.AddWithValue("@productName", name);
            command.Parameters.AddWithValue("@productManufacturer", manufacturer);
            command.Parameters.AddWithValue("@productPrice", price);
            command.Parameters.AddWithValue("@productDescription", description);
            command.Parameters.AddWithValue("@productMaterials", materials);
            command.Parameters.AddWithValue("@productCategory", category);
            command.Parameters.AddWithValue("@productID", id);

            command.ExecuteNonQuery();

            product = GetProduct(id);

            dbConnection.Close();

            return product;
        }

        //Updates newly created/updated entries with a correct image path string
        //A mildly annoying way to do it but it works
        public static void UpdateImagePath(int productID, string imagePath)
        {
            if (dbConnection != null && dbConnection.State == ConnectionState.Closed)
            {
                dbConnection.Open();
            }

            string status = "UPDATE Product SET productImage = @imagePath WHERE productID = @productID";
            command = new SqlCommand(status, dbConnection);

            command.Parameters.AddWithValue("@productID", productID);
            command.Parameters.AddWithValue("@imagePath", imagePath);

            command.ExecuteNonQuery();
            dbConnection.Close();
            return;
        }

        //Hashes the password as MD5
        private static byte[] GetHash(string inputString)
        {
            HashAlgorithm algorithm = MD5.Create();
            return algorithm.ComputeHash(Encoding.UTF8.GetBytes(inputString));
        }

        //Same
        private static string GetHashString(string inputString)
        {
            StringBuilder sb = new StringBuilder();
            foreach (byte b in GetHash(inputString))
                sb.Append(b.ToString("X2"));

            return sb.ToString();
        }

    }
}