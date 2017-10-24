using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Script.Services;
using System.Web.Services;
using System.IO;

namespace VisitorMan
{
    [ScriptService]
    public partial class test : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection("Server=STN-STNSQLMIR1;Database=DEVTestDB;trusted_connection=yes");
        //static string path = @"J:\Databases";

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod()]
        public static void UploadImage(string imageData)
        {
            FileStream fs = new FileStream("C:\\Downloads\\Sig.png", FileMode.Create);
            BinaryWriter bw = new BinaryWriter(fs);

            byte[] data = Convert.FromBase64String(imageData);

            bw.Write(data);
            bw.Close();
        }


        protected void but_prev2_Click(object sender, EventArgs e)
        {
            //string sig = Request.Form["json_output"];
            //string sig = HttpContext.Current.Request.Form["json_output"];

            connection.Open();

            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = "INSERT INTO tblSig(json) VALUES(@json)";
            command.Parameters.AddWithValue("@json", HttpContext.Current.Request.Form["json_output"]);

            command.ExecuteNonQuery();

            command.Dispose();
            connection.Close();
        }
    }
}