using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace WebApplication1.Ashx
{
    /// <summary>
    /// Summary description for OrderFunction
    /// </summary>
    public class OrderFunction : IHttpHandler
    {
        string ConnectionString 
            = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["RemoteConnectionString"].ConnectionString;

        public void ProcessRequest(HttpContext context)
        {
            //context.Response.ContentType = "text/plain";
            //context.Response.Write("Hello World");
            DeleteOrder(context.Request.Params["OrderID"]);
        }

        private void DeleteOrder(string id)
        {
            SqlConnection sqlConnection = new SqlConnection(ConnectionString);
            sqlConnection.Open();
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnection;
            sqlCommand.CommandType = System.Data.CommandType.StoredProcedure;
            sqlCommand.CommandText = "Proc_DeleteOrderInfo";
            SqlParameter sqlParameter = new SqlParameter("@ID", id);
            sqlCommand.Parameters.Add(sqlParameter);
            sqlCommand.ExecuteNonQuery();
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