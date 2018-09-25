using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication4
{
    public partial class info : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Write("Account: " + Session["account"] + "<br>");
            Response.Write("Password: " + Session["password"] + "<br>");
            Response.Write("Email : " + Session["email"] + "<br>");
        }
    }
}