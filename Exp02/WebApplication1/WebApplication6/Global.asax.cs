using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.UI;

namespace WebApplication6
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
            ScriptManager.ScriptResourceMapping.AddDefinition("jquery", new ScriptResourceDefinition
            {
                Path = "~/JS/jquery-3.3.1.min.js",
                DebugPath = "~/JS/jquery-3.3.1.js",
                CdnPath = "http://ajax.microsoft.com/ajax/jQuery/jquery-3.3.1.min.js",
                CdnDebugPath =
        "http://ajax.microsoft.com/ajax/jQuery/jquery-3.3.1.js"
            });
        }
    }
}