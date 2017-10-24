using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace VisitorMan
{
    public partial class Keyboard : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection("Server=STN-STNSQLMIR1;Database=DEVTestDB;trusted_connection=yes");

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnNext_ServerClick(object sender, EventArgs e)
        {
            //File.WriteAllText("C:\\Apps\\Name.txt", Request.Form["write"]);

            connection.Open();

            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = "INSERT INTO tblSTNCheck(Name) VALUES(@Name)";
            string name = Request.Form["write"];
            command.Parameters.AddWithValue("@Name", name.ToString());
            command.ExecuteNonQuery();
            command.Dispose();
            connection.Close();

            Response.Redirect("/CheckIn/Signature.aspx");
        }
    }
}