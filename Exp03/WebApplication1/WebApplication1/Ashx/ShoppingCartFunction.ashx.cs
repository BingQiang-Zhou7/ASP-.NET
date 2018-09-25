using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;


namespace WebApplication1.Ashx
{
    /// <summary>
    /// Summary description for AddCommodityToShoppingCart
    /// </summary>
    public class ShoppingCartFunction : IHttpHandler
    {
        private string ConnectionString 
            = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["RemoteConnectionString"].ConnectionString;

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            //context.Response.Write("Hello World");
            //System.Diagnostics.Debug.Write(context.Request.Params["CommodityID"]);
            //context.Response.Write(context.Request.Params["CommodityID"]);
            context.Response.Write(context.Request.Params["Operator"]);

            //Add Commodity
            if (context.Request.Params["Operator"].Equals("Add")) 
            {
                AddCommodity(context.Request.Params["CommodityID"]);
            }
            //Minus Commodity
            else if (context.Request.Params["Operator"].Equals("Minus"))
            {
                MinusCommodity(context.Request.Params["CommodityID"]);
            }
            //Delete Commodity
            else if (context.Request.Params["Operator"].Equals("Delete"))
            {
                DeleteCommodity(context.Request.Params["CommodityID"]);
            }
            //Purchase Commodity
            else if (context.Request.Params["Operator"].Equals("Purchase"))
            {
                PurchaseCommodity(context.Request.Params["CommodityList"]);
            }
        }

        public void AddCommodity(string ID)
        {
            SqlConnection sqlConnection = new SqlConnection(ConnectionString);
            sqlConnection.Open();
            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "Proc_AddCommodityToShoppingCart";
            command.Connection = sqlConnection;
            command.Parameters.Add(new SqlParameter("@ID", ID));
            command.ExecuteNonQuery();
            sqlConnection.Close();
        }
        public void MinusCommodity(string ID)
        {
            SqlConnection sqlConnection = new SqlConnection(ConnectionString);
            sqlConnection.Open();
            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "Proc_MinusCommodityFromShoppingCart";
            command.Connection = sqlConnection;
            command.Parameters.Add(new SqlParameter("@ID", ID));
            command.ExecuteNonQuery();
            sqlConnection.Close();
        }
        public void DeleteCommodity(string ID)
        {
            SqlConnection sqlConnection = new SqlConnection(ConnectionString);
            sqlConnection.Open();
            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "Proc_DeleteCommodityFromShoppingCart";
            command.Connection = sqlConnection;
            command.Parameters.Add(new SqlParameter("@ID", ID));
            command.ExecuteNonQuery();
            sqlConnection.Close();
        }

        public void PurchaseCommodity(string CommodityList)
        {
            string OrderNo = "O"+DateTime.Now.ToFileTimeUtc().ToString();//Generate the order number
            string[] CommodityInfo = CommodityList.Split('_');//Split single commodity from list
            SqlConnection sqlConnection = new SqlConnection(ConnectionString);
            sqlConnection.Open();
            SqlTransaction sqlTransaction = sqlConnection.BeginTransaction();
            SqlCommand command = new SqlCommand();
            command.Connection = sqlConnection;
            command.Transaction = sqlTransaction;
            foreach(string commodity in CommodityInfo)
            {
                string[] str = commodity.Split('-');
                string ID = str[0];
                string Number = str[1];
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "Proc_AddCommodityToOrder";
                command.Parameters.Add(new SqlParameter("@OrderNO", OrderNo));
                command.Parameters.Add(new SqlParameter("@ID", ID));
                command.Parameters.Add(new SqlParameter("@Number",int.Parse(Number)));
                command.ExecuteNonQuery();
                command.Parameters.Clear();
            }
            sqlTransaction.Commit();
            sqlConnection.Close();
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}