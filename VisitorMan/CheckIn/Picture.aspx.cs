using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VisitorMan.CheckIn
{
    public partial class Picture : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void UploadButton_Click(object sender, EventArgs e)
        {
            HttpPostedFile file = Request.Files["imgInp"];

            string folderPath = Server.MapPath("~/Files/");

            //Check whether Directory (Folder) exists.
            if (!Directory.Exists(folderPath))
            {
                //If Directory (Folder) does not exists. Create it.
                Directory.CreateDirectory(folderPath);
            }
            //100485
            //Save the File to the Directory (Folder).
            file.SaveAs(folderPath + Path.GetFileName("TEST" + file.FileName));

            //Display the success message.
            //StatusLabel.Text = Path.GetFileName(file.FileName) + " has been uploaded.";

            //HttpPostedFile file = Request.Files["imgInp"];

            //if (file != null && file.ContentLength > 0)
            //{
            //    string fname = Path.GetFileName(file.FileName);
            //    file.SaveAs(Server.MapPath(Path.Combine("~/App_Data/", fname)));
            //}
        }

        protected void btnNext_ServerClick(object sender, EventArgs e)
        {
            Response.Redirect("/CheckIn/Picture.aspx");
        }
    }
}