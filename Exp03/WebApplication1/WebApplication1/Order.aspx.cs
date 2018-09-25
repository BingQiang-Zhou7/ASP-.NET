using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class Order : System.Web.UI.Page
    {
        private string ConnectionString
            = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["RemoteConnectionString"].ConnectionString;

        public Dictionary<string, OrderList> OrderInfoList;
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Title = "Exp03--Order";
            BuildOrderInfoList(GetOrderInfo());
            //foreach (var item in OrderInfoList)
            //{
            //    System.Diagnostics.Debug.Write(item.Key);
            //    foreach (var info in item.Value.CommodityList)
            //    {
            //        System.Diagnostics.Debug.WriteLine(info.CommodityID + " " + info.CommodityName + " " +
            //            info.CommodityPrice + info.CommodityImage + info.CommodityAmount);
            //    }
            //}
        }

        public DataSet GetOrderInfo()
        {
            SqlConnection sqlConnection = new SqlConnection(ConnectionString);
            sqlConnection.Open();
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter("EXEC Proc_SelectOrderInfo", sqlConnection);
            DataSet dataSet = new DataSet();
            sqlDataAdapter.Fill(dataSet);
            sqlDataAdapter.Dispose();
            sqlConnection.Close();
            return dataSet;
        }

        public void BuildOrderInfoList(DataSet dataSet)
        {
            OrderInfoList = new Dictionary<string, OrderList>();
            DataTable dataTable = dataSet.Tables[0];
            DataRowCollection dataRow= dataTable.Rows;
            foreach(DataRow row in dataRow)
            {
                string commodityID = (string)row["CommodityID"];
                string commodityName = (string)row["Name"];
                string commodityImage = (string)row["Image"];
                double commodityPrice = (double)row["Price"];
                int commodityAmount = (int)row["Amount"];
                CommodityInfo commodity = new CommodityInfo(commodityID, commodityName, commodityImage, commodityPrice, commodityAmount);

                if (OrderInfoList.ContainsKey((string)row["OrderID"]) == false)
                {
                    OrderList orderList = new OrderList();
                    orderList.CommodityList.Add(commodity);
                    OrderInfoList.Add((string)row["OrderID"], orderList);
                }
                else
                {
                    OrderList orderList = OrderInfoList[(string)row["OrderID"]];
                    orderList.CommodityList.Add(commodity);
                    OrderInfoList[(string)row["OrderID"]] = orderList;
                }
            }
        }

        public class OrderList
        {
            private List<CommodityInfo> Commodities = new List<CommodityInfo>();

            public List<CommodityInfo> CommodityList { get => Commodities; set => Commodities = value; }

            
        }
        public class CommodityInfo
        {
            private string commodityID;
            private string commodityName;
            private string commodityImage;
            private double commodityPrice;
            private int commodityAmount;

            public string CommodityID { get => commodityID; set => commodityID = value; }
            public string CommodityName { get => commodityName; set => commodityName = value; }
            public string CommodityImage { get => commodityImage; set => commodityImage = value; }
            public double CommodityPrice { get => commodityPrice; set => commodityPrice = value; }
            public int CommodityAmount { get => commodityAmount; set => commodityAmount = value; }

            public CommodityInfo(string commodityID, string commodityName, string commodityImage, double commodityPrice, int commodityAmount)
            {
                CommodityID = commodityID;
                CommodityName = commodityName;
                CommodityImage = commodityImage;
                CommodityPrice = commodityPrice;
                CommodityAmount = commodityAmount;
            }   
        }
    }
}