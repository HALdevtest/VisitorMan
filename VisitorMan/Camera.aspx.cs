using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Services;
using System.Web.Services;
using System.Drawing;

namespace VisitorMan
{
    [ScriptService]
    public partial class Camera : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!this.IsPostBack)
            //{
            //    if (Request.InputStream.Length > 0)
            //    {
            //        using (StreamReader reader = new StreamReader(Request.InputStream))
            //        {
            //            string hexString = Server.UrlEncode(reader.ReadToEnd());
            //            string imageName = DateTime.Now.ToString("dd-MM-yy hh-mm-ss");
            //            string imagePath = string.Format("J:\\Databases\\Form1- New\\Form 1 -TEST\\Captures\\{0}.png", imageName);
            //            File.WriteAllBytes(Server.MapPath(imagePath), ConvertHexToBytes(hexString));
            //            Session["CapturedImage"] = ResolveUrl(imagePath);
            //        }
            //    }
            //}
        }

        private byte[] ConvertHexToBytes(string hex)
        {
            byte[] bytes = new byte[hex.Length / 2];
            for (int i = 0; i < hex.Length; i += 2)
            {
                bytes[i / 2] = Convert.ToByte(hex.Substring(i, 2), 16);
            }
            return bytes;
        }

        //[WebMethod(EnableSession = true)]
        //public static string GetCapturedImage()
        //{
        //    string url = HttpContext.Current.Session["CapturedImage"].ToString();
        //    HttpContext.Current.Session["CapturedImage"] = null;
        //    return url;
        //}


        protected void btnUpload_Click(object sender, EventArgs e)
        {
            //string folderPath = "UploadedImage";
            //string imageName = fileUpload.FileName;

            //string saveLocation = Server.MapPath(folderPath);
            //string ext = Path.GetExtension(imageName);
            //string name = imageName.Replace(ext, ".png");
            //saveLocation = Server.MapPath(folderPath) + name;
            //fileUpload.SaveAs(saveLocation);
            //filterimage.ImageUrl = folderPath + name;
        }

        //public Upload(string image)
        //{
        //    image = image.Substring("data:image/png;base64,".Length);
        //    var buffer = Convert.FromBase64String(image);
        //    System.IO.File.WriteAllBytes(Server.MapPath("~/app_data/capture.png"), buffer);
        //    return Json(new { success = true });
        //}

        //static string path = @"\\STN-STNSVFS1\Home\pwg350453\My Documents\Visual Studio 2015\Projects\VisitorMan\VisitorMan\Userimages\";
        static string path = @"C:\Apps\";

        [WebMethod()]
        public static void UploadImage(string imageData)
        {
            string fileNameWitPath = path + DateTime.Now.ToString().Replace("/", "-").Replace(" ", "-").Replace(":", "") + ".png";
            //Int32 unixTimestamp = (Int32)(DateTime.UtcNow.Subtract(new DateTime(1970, 1, 1))).TotalSeconds;
            //string FileName = "Photo_" + unixTimestamp + ".jpg";
           // var path = Path.Combine(Server.MapPath("~/MediaUploader"), FileName);
            using (FileStream fs = new FileStream(fileNameWitPath, FileMode.Create))
            {
                using (BinaryWriter bw = new BinaryWriter(fs))
                {
                    byte[] data = Convert.FromBase64String(imageData);
                    bw.Write(data);
                    bw.Close();
                }
            }
        }
    }
}
            //string fileNameWitPath = path + "Image" + ".png";

            //using (FileStream fs = new FileStream(fileNameWitPath, FileMode.Create))
            //{
            //    using (BinaryWriter bw = new BinaryWriter(fs))
            //    {
            //       // byte[] data = Convert.FromBase64String();
            //        //bw.Write();
            //        bw.Close();
            //    }
            //}
    
            ////string fileNameWitPath = path + DateTime.Now.ToString().Replace("/", "-").Replace(" ", "-").Replace(":", "") + ".png";
            //Int32 unixTimestamp = (Int32)(DateTime.UtcNow.Subtract(new DateTime(1970, 1, 1))).TotalSeconds;
            //string FileName = "Photo_" + unixTimestamp + ".jpg";
            //var path = Path.Combine(Server.MapPath("~/MediaUploader"), FileName);
            //using (FileStream fs = new FileStream(path, FileMode.Create))
            //{
            //    using (BinaryWriter bw = new BinaryWriter(fs))
            //    {
            //        byte[] data = Convert.FromBase64String(imageData);
            //        bw.Write(data);
            //        bw.Close();
            //    }
            //}