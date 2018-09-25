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
            //DetailsView1.ChangeMode(DetailsViewMode.ReadOnly);
            DetailsView1.Visible = false;
        }

        protected void ButtonNewItem_Click(object sender, EventArgs e)
        {
            DetailsView1.Visible = true;
            DetailsView1.ChangeMode(DetailsViewMode.Insert);
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
                    DetailsView1.Visible = false;
                }
                //取消编辑模式
                else if (DetailsView1.CurrentMode == DetailsViewMode.Edit)
                {
                    DetailsView1.ChangeMode(DetailsViewMode.ReadOnly);
                    DetailsView1.Visible = false;
                }
            }
            else if (e.CancelingEdit)
            {
                if (DetailsView1.CurrentMode == DetailsViewMode.Insert)
                {
                    DetailsView1.ChangeMode(DetailsViewMode.ReadOnly);
                    DetailsView1.Visible = false;
                }
                //取消编辑模式
                else if (DetailsView1.CurrentMode == DetailsViewMode.Edit)
                {
                    DetailsView1.ChangeMode(DetailsViewMode.ReadOnly);
                    DetailsView1.Visible = false;
                }
            }
        }
    }
}