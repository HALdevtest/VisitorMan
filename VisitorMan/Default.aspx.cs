using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;

namespace VisitorMan
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Context.User.Identity.GetUserName().StartsWith("M"))
            {
                Response.Redirect("/Account/Login");
            }
        }
    }
}