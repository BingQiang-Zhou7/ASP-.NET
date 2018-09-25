using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace WebApplication1
{
  
    public partial class Default : System.Web.UI.Page
    {
        private string connectionstring
            = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["TestRemoteConnectionString"].ConnectionString;
        private string filePath = @"D:/ASP .NET/Exp02/images/";
        protected void Page_Load(object sender, EventArgs e)
        {
            //DetailsView1.ChangeMode(DetailsViewMode.ReadOnly);
            //DetailsView1.Visible = false;
        }

        //protected void ButtonNewItem_Click(object sender, EventArgs e)
        //{
        //    DetailsView1.Visible = true;
        //    DetailsView1.ChangeMode(DetailsViewMode.Insert);
        //}
        //protected void DetailsView1_ModeChanging(object sender, DetailsViewModeEventArgs e)
        //{
        //    //判断模式
        //    if (e.NewMode == DetailsViewMode.Insert)
        //    {
        //        DetailsView1.ChangeMode(DetailsViewMode.Insert);
        //    }
        //    else if (e.NewMode == DetailsViewMode.Edit)
        //    {
        //        DetailsView1.ChangeMode(DetailsViewMode.Edit);
        //    }
        //    else if (e.Cancel)
        //    {
        //        if (DetailsView1.CurrentMode == DetailsViewMode.Insert)
        //        {
        //            DetailsView1.ChangeMode(DetailsViewMode.ReadOnly);
        //            DetailsView1.Visible = false;
        //        }
        //        //取消编辑模式
        //        else if (DetailsView1.CurrentMode == DetailsViewMode.Edit)
        //        {
        //            DetailsView1.ChangeMode(DetailsViewMode.ReadOnly);
        //            DetailsView1.Visible = false;
        //        }
        //    }
        //    else if (e.CancelingEdit)
        //    {
        //        if (DetailsView1.CurrentMode == DetailsViewMode.Insert)
        //        {
        //            DetailsView1.ChangeMode(DetailsViewMode.ReadOnly);
        //            DetailsView1.Visible = false;
        //        }
        //        //取消编辑模式
        //        else if (DetailsView1.CurrentMode == DetailsViewMode.Edit)
        //        {
        //            DetailsView1.ChangeMode(DetailsViewMode.ReadOnly);
        //            DetailsView1.Visible = false;
        //        }
        //    }
        //}

        protected void LinkButtonNewItem_Click(object sender, EventArgs e)
        {
            GridView1.ShowFooter = true;
        }

        protected void LinkButtonConfirm_Click(object sender, EventArgs e)
        {
            Label id = (Label)GridView1.FooterRow.Cells[0].FindControl("LabelID");
            TextBox name = (TextBox)GridView1.FooterRow.Cells[1].FindControl("TextBoxName");
            DropDownList typeId = (DropDownList)GridView1.FooterRow.Cells[2].FindControl("DropDownList1");
            TextBox number = (TextBox)GridView1.FooterRow.Cells[3].FindControl("TextBoxNumber");
            TextBox price = (TextBox)GridView1.FooterRow.Cells[4].FindControl("TextBoxPrice");
            System.Diagnostics.Debug.WriteLine("{0},{1},{2},{3},{4}",
                id.Text,name.Text,typeId.Text,number.Text,price.Text);
            FileUpload fileUpload = (FileUpload)GridView1.FooterRow.Cells[5].FindControl("FileUpload1");
            string imgPath = " ";
            if (fileUpload.HasFile)
            {
                //string filePath = Server.MapPath("~/files/");
                string fileName = fileUpload.PostedFile.FileName;
                imgPath = "images/" + fileName;
                fileUpload.SaveAs(filePath + fileName);
                //label.Text = "images/" + fileName;
                //System.Diagnostics.Debug.Write("images/" + fileName);
            }

            SqlConnection sqlConnection = new SqlConnection(connectionstring);
            sqlConnection.Open();
            SqlCommand command = new SqlCommand();
            command.CommandText = "INSERT INTO [Details] ([ID], [Name], [TypeID], [Number], [Price], [ImgPath]) " +
                "VALUES (@ID, @Name, @TypeID, @Number, @Price, @ImgPath)";
            command.Connection = sqlConnection;
            command.Parameters.Add(new SqlParameter("@ID", id.Text));
            command.Parameters.Add(new SqlParameter("@Name", name.Text));
            command.Parameters.Add(new SqlParameter("@TypeID", typeId.Text));
            command.Parameters.Add(new SqlParameter("@Number",int.Parse(number.Text)));
            command.Parameters.Add(new SqlParameter("@Price", float.Parse(price.Text)));
            command.Parameters.Add(new SqlParameter("@ImgPath", imgPath));
            command.ExecuteNonQuery();
            sqlConnection.Close();

            GridView1.ShowFooter = false;
            return;
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Label labelID = (Label)GridView1.Rows[GridView1.EditIndex].Cells[0].FindControl("LabelID");
            FileUpload fileUpload= (FileUpload)GridView1.Rows[GridView1.EditIndex].Cells[5].FindControl("FileUpload1");
            Label label = (Label)GridView1.Rows[GridView1.EditIndex].Cells[5].FindControl("LabelImgPath");
            if (fileUpload.HasFile)
            {
                //string filePath = Server.MapPath("~/files/");//@"D:\ASP .NET\Exp02\images"
                //string filePath = Server.MapPath("D:\\ASP .NET\\Exp02\\images");
                string fileName = fileUpload.PostedFile.FileName;
                fileUpload.SaveAs(filePath + fileName);
                //System.Diagnostics.Debug.Write(@"E:/University course/ASP .NET/Exp02/images/" + fileName);
                label.Text = "images/" + fileName;
                //System.Diagnostics.Debug.Write(labelID.Text);
                GetData(labelID.Text, "images/" + fileName);
            }
        }
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public void GetData(string ID,string address)
        {
            SqlConnection sqlConnection = new SqlConnection(connectionstring);
            sqlConnection.Open();
            SqlCommand command = new SqlCommand();
            command.CommandText= "update details set ImgPath = @path where ID = @id";
            command.Connection = sqlConnection;
            SqlParameter path = new SqlParameter("@path", address);
            SqlParameter id = new SqlParameter("@ID", ID);
            command.Parameters.Add(path);
            command.Parameters.Add(id);
            command.ExecuteNonQuery();
            sqlConnection.Close();
            return;
            //sqlconnection sqlconnection = new sqlconnection(connectionstring);
            //sqlconnection.open();
            //sqldataadapter sqldataadapter = new sqldataadapter(sql, sqlconnection);
            //sqlparameter sqlparameter = new sqlparameter("@type", type);
            //sqldataadapter.selectcommand.parameters.add(sqlparameter);
            //dataset dataset = new dataset();
            //sqldataadapter.fill(dataset);
            //////多表多行多列的情况
            ////foreach (datatable dt in dataset.tables)   //遍历所有的datatable
            ////{
            ////    foreach (datarow dr in dt.rows)   ///遍历所有的行
            ////        foreach (datacolumn dc in dt.columns)   //遍历所有的列
            ////            system.diagnostics.debug.writeline("{0},   {1},   {2}", dt.tablename, dc.columnname, dr[dc]);   //表名,列名,单元格数据
            ////}
            //sqldataadapter.dispose();
            //sqlconnection.close();
            //return dataset;
        }

        protected void LinkButtonCancel_Click(object sender, EventArgs e)
        {
            TextBox name = (TextBox)GridView1.FooterRow.Cells[1].FindControl("TextBoxName");
            name.Text = "cancel";
            GridView1.ShowFooter = false;
        }
    }
}