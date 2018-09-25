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
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GridView2.SelectRow(0);
            }
            int index = GridView2.SelectedIndex;
            System.Diagnostics.Debug.WriteLine(GridView2.Rows[index].Cells[1].Text.ToString());
            DataSet dataset = GetData(GridView2.Rows[index].Cells[1].Text.ToString());
            GridView1.DataSource = dataset;
            GridView1.DataBind();
        }

        private String connectionString
            = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["TestRemoteConnectionString2"].ConnectionString;
        private string sql = "Select * from details " +
            "join dbo.Type on Type.TypeID = Details.TypeID " +
            "where Type.TypeID = @type";
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public DataSet GetData(string type)
        {
            SqlConnection sqlConnection = new SqlConnection(connectionString);
            sqlConnection.Open();
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sql, sqlConnection);
            SqlParameter sqlParameter = new SqlParameter("@type", type);
            sqlDataAdapter.SelectCommand.Parameters.Add(sqlParameter);
            DataSet dataSet = new DataSet();
            sqlDataAdapter.Fill(dataSet);
            ////多表多行多列的情况
            //foreach (DataTable dt in dataSet.Tables)   //遍历所有的datatable
            //{
            //    foreach (DataRow dr in dt.Rows)   ///遍历所有的行
            //        foreach (DataColumn dc in dt.Columns)   //遍历所有的列
            //            System.Diagnostics.Debug.WriteLine("{0},   {1},   {2}", dt.TableName, dc.ColumnName, dr[dc]);   //表名,列名,单元格数据
            //}
            sqlDataAdapter.Dispose();
            sqlConnection.Close();
            return dataSet;
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            int index = GridView2.SelectedIndex;
            DataSet dataset = GetData(GridView2.Rows[index].Cells[1].Text.ToString());
            GridView1.DataSource = dataset;
            GridView1.DataBind();
        }
    }
}