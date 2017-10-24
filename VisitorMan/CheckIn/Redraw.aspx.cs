using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace VisitorMan.CheckIn
{
    public partial class Redraw : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection("Server=STN-STNSQLMIR1;Database=DEVTestDB;trusted_connection=yes");
        protected void Page_Load(object sender, EventArgs e)
        {
            connection.Open();

            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = "SELECT imagedata from tblSig";
            SqlDataReader reader = command.ExecuteReader();
            if (reader.Read())
            {
               // signatureJSON.Value = reader["imagedata"].ToString();
            }
            reader.Close();
            command.Dispose();
            connection.Close();
        }
    }
}