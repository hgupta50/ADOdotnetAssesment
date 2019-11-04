using System;
using System.Collections.Generic;
using System.Collections;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
namespace ConnectedArchitecture
{
    class Order1
    {
        private int Quantity, PId, SId;
        private string Order_Name;
        private float Total;
        public int Quantity1 { get => Quantity; set => Quantity = value; }
        public int PId1 { get => PId; set => PId = value; }
        public int SId1 { get => SId; set => SId = value; }
        public string Order_Name1 { get => Order_Name; set => Order_Name = value; }
        public float Total1 { get => Total; set => Total = value; }
    }

    class Program
    {
        static void Main(string[] args)
        {
            int input;
            do
            {
                Console.WriteLine("WELCOME TO THE STORE");
                Console.WriteLine("Here is the product menu");
                Console.WriteLine("---------------------------------------------");
                Console.WriteLine("Product Id \t\t\t Product Name");
                DisplayProducts();
                Console.WriteLine("Enter 1 to make a purchase");
                input = int.Parse(Console.ReadLine());
                PlaceAnOrder();
            } while (input == 1);
            Console.ReadLine();
        }
        public static void DisplayProducts()
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = "data source=IN5CG9214YZW;database=Orders;integrated security=true";
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "select * from Product";
            cmd.Connection = con;
            con.Open();
            SqlDataReader rdr = cmd.ExecuteReader();
            while (rdr.Read())
            {
                Console.WriteLine($"{rdr[0]}\t\t\t\t{rdr[1]}");
            }
            con.Close();
        }
        public static void PlaceAnOrder()
        {

            Console.WriteLine("Enter your name");
            string name = Console.ReadLine();
            List<Order1> OrderList = new List<Order1>();
            string ans;
            do
            {
                Order1 order = new Order1();
                order.Order_Name1 = name;
                Console.WriteLine("Enter the product ID which you want to purchase");
                order.PId1 = int.Parse(Console.ReadLine());
                Console.WriteLine("------------------------------------------------");
                DisplaySupplier(order.PId1);
                Console.WriteLine("Enter the supplier ID from which you want to make the purchase:");
                order.SId1 = int.Parse(Console.ReadLine());
                Console.WriteLine("Enter the quantity of this product you wish to purchase:");
                order.Quantity1 = int.Parse(Console.ReadLine());
                order.Total1 = CalculatePrice(order.Quantity1, order.SId1);
                OrderList.Add(order);
                Console.WriteLine("Do you want to continue purchasing? Y or N");
                 ans =Console.ReadLine();
            } while ((ans.Equals("y"))|| (ans.Equals("Y")));

            float total = 0;
            Console.WriteLine("Product ID\tSupplier ID\tQuantity\tTotal");
            foreach (Order1 order in OrderList)
            {
                total += order.Total1;
                InsertOrders(order);
                Console.WriteLine(order.PId1 + "\t" + order.SId1 + "\t" + order.Quantity1 + "\t" + order.Total1);
                
            }
            Console.WriteLine("Grand Total: " + total);
            Console.WriteLine("Thank you " + name + "! for shopping with us!");
            Environment.Exit(0);
        }

        public static void InsertOrders(Order1 order)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = "data source=IN5CG9214YZW;database=Orders;integrated security=true";
            SqlCommand cmd = new SqlCommand();
            cmd.Parameters.AddWithValue("name", order.Order_Name1);
            cmd.Parameters.AddWithValue("quantity", order.Quantity1);
            cmd.Parameters.AddWithValue("total", order.Total1);
            cmd.Parameters.AddWithValue("pid", order.PId1);
            cmd.Parameters.AddWithValue("sid", order.SId1);
            cmd.CommandText = "insert into Order1 values(@name,@quantity,@total,@pid,@sid)";
            cmd.Connection = con;
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }

        public static void DisplaySupplier(int id)
        {

            SqlConnection con = new SqlConnection();
            con.ConnectionString = "data source=IN5CG9214YZW;database=Orders;integrated security=true";
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "select * from Supplier where PId=" + id;
            cmd.Connection = con;
            con.Open();
            SqlDataReader rdr1 = cmd.ExecuteReader();
            while (rdr1.Read())
            {
                Console.WriteLine($"{rdr1[0]}\t {rdr1[1]}\t {rdr1[2]}\t{rdr1[3]}");
            }
            con.Close();

        }
        public static float CalculatePrice(int quantity, int sid)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = "data source=IN5CG9214YZW;database=Orders;integrated security=true";
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "select * from Supplier where Supplier_ID=" + sid;
            cmd.Connection = con;
            con.Open();
            SqlDataReader rdr1 = cmd.ExecuteReader();
            float cost, bill;
            while (rdr1.Read())
            {
                cost = float.Parse($"{ rdr1[2]}");
                bill = (cost * quantity);

                con.Close();
                return bill;
            }
            return 0;
        }
    }
}
