using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using System.Windows.Media.Capture;
//using System.Windows.storage 

namespace VisitorMan
{
    public partial class VisView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DateTime dt = DateTime.Today;

            Date.InnerText = string.Format("{0:ddd, MMMM d yyyy}", dt);
        }

        protected void btnCheckIn_Click(object sender, EventArgs e)
        {
            
           // Response.Redirect("Check.aspx");
        }

        protected void btnCheckOut_Click(object sender, EventArgs e)
        {

        }
    }
}