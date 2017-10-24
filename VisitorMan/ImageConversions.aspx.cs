using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VisitorMan
{
    public partial class ImageConversions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string str_Photo = Request.Form["image_Data"];
            byte[] photo = Convert.FromBase64String(str_Photo);
            FileStream f_s = new FileStream("C:\\Apps\\Capture.jpg", FileMode.OpenOrCreate, FileAccess.Write);
            BinaryWriter b_r = new BinaryWriter(f_s);
            b_r.Write(photo);
            b_r.Flush();
            b_r.Close();
            f_s.Close();
        }
    }
}