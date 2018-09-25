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

        private String connectionString
            = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["TestRemoteConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GridView2.SelectRow(0);
            }
            int index = GridView2.SelectedIndex;
            //System.Diagnostics.Debug.WriteLine(GridView2.Rows[index].Cells[1].Text.ToString());
            DataSet dataset = GetData(GridView2.Rows[index].Cells[1].Text.ToString());
            GridView1.DataSource = dataset;
            GridView1.DataBind();
        }
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public DataSet GetData(string type)
        {
            string sql = "Select * from details " +
            "join dbo.Type on Type.TypeID = Details.TypeID " +
            "where Type.TypeID = @Type";
        SqlConnection sqlConnection = new SqlConnection(connectionString);
            sqlConnection.Open();
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sql, sqlConnection);
            SqlParameter sqlParameter = new SqlParameter("@Type", type);
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

        public DataSet GetDetailData(string name)
        {
            string sql = "Select * from details " +
            "where Name = @name";
            SqlConnection sqlConnection = new SqlConnection(connectionString);
            sqlConnection.Open();
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sql, sqlConnection);
            SqlParameter sqlParameter = new SqlParameter("@name", name);
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

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int index = GridView1.SelectedIndex;
            DataSet dataset = GetDetailData(GridView1.Rows[index].Cells[1].Text.Trim());
           // System.Diagnostics.Debug.WriteLine(GridView1.Rows[index].Cells[1].Text.ToString());
            //DetailsView1.DataSource = dataset;
            //DetailsView1.DataBind();
        }

        protected void DetailsView1_ModeChanging(object sender, DetailsViewModeEventArgs e)
        {
            //判断模式
            if (e.NewMode == DetailsViewMode.Insert)
            {
                DetailsView1.ChangeMode(DetailsViewMode.Insert);
            }
            else if (e.NewMode == DetailsViewMode.Edit)
            {
                DetailsView1.ChangeMode(DetailsViewMode.Edit);
            }
            else if (e.Cancel)
            {
                if (DetailsView1.CurrentMode == DetailsViewMode.Insert)
                {
                    DetailsView1.ChangeMode(DetailsViewMode.ReadOnly);
                }
                //取消编辑模式
                else if (DetailsView1.CurrentMode == DetailsViewMode.Edit)
                {
                    DetailsView1.ChangeMode(DetailsViewMode.ReadOnly);
                }

            }
            else if (e.CancelingEdit)
            {
                
                if (DetailsView1.CurrentMode == DetailsViewMode.Insert)
                {
                    DetailsView1.ChangeMode(DetailsViewMode.ReadOnly);
                }
                //取消编辑模式
                else if (DetailsView1.CurrentMode == DetailsViewMode.Edit)
                {
                    DetailsView1.ChangeMode(DetailsViewMode.ReadOnly);
                }

            }
        }

        protected void DetailsView1_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            Page_Load(sender,e);
        }

        protected void DetailsView1_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            Page_Load(sender, e);
        }
    }
}