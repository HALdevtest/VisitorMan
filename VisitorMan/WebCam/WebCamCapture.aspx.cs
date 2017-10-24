using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace VisitorMan.WebCam
{
    public partial class WebCamCapture : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection("Server=STN-STNSQLMIR1;Database=DEVTestDB;trusted_connection=yes");

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
            //    connection.Open();

            //    SqlCommand command = new SqlCommand("Usp_InsertImageDT",connection);
            //    command.CommandType = System.Data.CommandType.StoredProcedure;
            //    command.Parameters.AddWithValue("@UserImagename", null);
            //    command.Parameters.AddWithValue("@UserImagePath", null);
            //    command.Parameters.AddWithValue("@UserID", 0);
            //    command.Parameters.AddWithValue("@QueryID", 2);
            //    DataSet ds = new DataSet();
            //    SqlDataAdapter da = new SqlDataAdapter();
            //    da.SelectCommand = command;
            //    da.Fill(ds);
            //    if (ds.Tables[0].Rows.Count > 0)
            //    {
            //        img.ImageUrl = ds.Tables[0].Rows[0]["UserImagePath"].ToString();
            //    }
            //}    
        }

        protected void Linkbutton1_Click(object sender, EventArgs e)
        {
            string url = "/WebCam/Captureimage.aspx";
            string s = "window.open('" + url + "', 'popup_window', 'width=900,height=460,left=100,top=100,resizable=no');";
            ClientScript.RegisterStartupScript(this.GetType(), "script", s, true);
        }
    }
}