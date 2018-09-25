using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList2.Items.Clear();
            switch (Convert.ToInt32(DropDownList1.SelectedValue))
            {
                case 1:
                    DropDownList2.Items.Add("ChangSha");
                    DropDownList2.Items.Add("ZhuZhou");
                    DropDownList2.Items.Add("XiangTan");
                    break;
                case 2:
                    DropDownList2.Items.Add("QingDao");
                    DropDownList2.Items.Add("JiNan");
                    DropDownList2.Items.Add("YanTai");
                    break;
            }
            System.Diagnostics.Debug.WriteLine("Changed");//output debuging informations    
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            Response.Write("you select "+DropDownList1.SelectedItem.Text+
                " and " + DropDownList2.SelectedItem.Text);
        }
    }
}