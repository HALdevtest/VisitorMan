using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace VisitorMan.CheckIn
{
    public partial class Signature : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection("Server=STN-STNSQLMIR1;Database=DEVTestDB;trusted_connection=yes");
        protected void Page_Load(object sender, EventArgs e)
        {
            //HS.InnerText = "SAFETY " +
            //    "" +
            //"Harrods Aviation Limited has a legal responsibility for the safety of its employees, visitors, clients and all other third parties. "  +
            //"As with all airport environments, certain parts of our business will have many high risk areas, including moving machinery and / or vehicles, chemicals etc. " +
            //"During your visit your host will point out any particular hazards contained in the areas you may be visiting.";


        }

        protected void btnNext_ServerClick(object sender, EventArgs e)
        {
            //if (cbl.ToString() == "agree" && lblCheck.ToString() != "Empty")
            //{
            //    Response.Redirect("/CheckIn/Picture.aspx");
            //}
            //else
            //{
            //    lblError.Visible = true;
            //}
            string data = Request.Form["signatureJSON"];

            connection.Open();

            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = "INSERT INTO tblSig(imagedata) VALUES(@data)";
            command.Parameters.AddWithValue("@data", data);
            command.ExecuteNonQuery();

            command.Dispose();
            connection.Close();


            Response.Redirect("/CheckIn/Picture.aspx");
        }
    }
}