using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;

namespace VisitorMan
{
    public partial class View : System.Web.UI.Page
    {
        SqlDataAdapter da;
        DataSet ds = new DataSet();
        StringBuilder htmlTable = new StringBuilder();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Context.User.Identity.GetUserName().StartsWith("M"))
            {
                Response.Redirect("/Account/Login");
            }
            /*
            if (!Page.IsPostBack)
            {
                BindData();
            }*/
            
            if (!this.IsPostBack)
            {

                //Populating a DataTable from database.
                DataTable dt = GetTodayData();

                //Buidling an HTML string.
                StringBuilder html = new StringBuilder();
                html.Append("<table border = '1'>");


                if (dt.Rows.Count > 0)
                {
                    // Table start.

                    //Buidling the Header row.
                    html.Append("<tr>");
                    foreach (DataColumn column in dt.Columns)
                    {
                        html.Append("<th>");
                        html.Append(column.ColumnName);
                        html.Append("</th>");
                    }
                    html.Append("</tr>");

                    //Building the Data rows.
                    foreach (DataRow row in dt.Rows)
                    {
                        html.Append("<tr>");
                        foreach (DataColumn column in dt.Columns)
                        {
                            html.Append("<td>");
                            html.Append(row[column.ColumnName]);
                            html.Append("</td>");
                        }
                        html.Append("</tr>");
                    }

                    //Table end.
                    html.Append("</table>");

                    //Append the HTML string to Placeholder.
                    PlaceHolder1.Controls.Add(new Literal { Text = html.ToString() });
                }
                else
                {
                    htmlTable.Append("<tr>");
                    htmlTable.Append("<td>There are no visitors for this day</td>");
                    htmlTable.Append("</tr>");
                }

            }

        }

        protected void btnPrint_Click(object sender, EventArgs e)
        {

        }

        protected void btnSelect_Click(object sender, EventArgs e)
        {
            //GetData();
            //Page_Load();
            
            
            

            
                //Populating a DataTable from database.
                DataTable dt = GetData();

                //Buidling an HTML string.
                StringBuilder html = new StringBuilder();
            html.Append("<table border = '1'>");


            if (dt.Rows.Count > 0)
            {
                // Table start.

                //Buidling the Header row.
                html.Append("<tr>");
                foreach (DataColumn column in dt.Columns)
                {
                    html.Append("<th>");
                    html.Append(column.ColumnName);
                    html.Append("</th>");
                }
                html.Append("</tr>");

                //Building the Data rows.
                foreach (DataRow row in dt.Rows)
                {
                    html.Append("<tr>");
                    foreach (DataColumn column in dt.Columns)
                    {
                        html.Append("<td>");
                        html.Append(row[column.ColumnName]);
                        html.Append("</td>");
                    }
                    html.Append("</tr>");
                }

                //Table end.
                html.Append("</table>");

                //Append the HTML string to Placeholder.
                PlaceHolder1.Controls.Add(new Literal { Text = html.ToString() });
            }
            else
            {
                htmlTable.Append("<tr>");
                htmlTable.Append("<td>There are no visitors for this day</td>");
                htmlTable.Append("</tr>");
            }
                
            
            
            
        }
        /*
        private void BindData()
        {
            SqlConnection connection = new SqlConnection("Server=STN-STNSQLMIR1;Database=DEVTestDB;trusted_connection=yes");
            connection.Open();
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = "SELECT * FROM tblCreateVisitor WHERE Date = @Date";
            command.Parameters.AddWithValue("@Date", txtSelect.Text);
            da = new SqlDataAdapter(command);
            da.Fill(ds);
            command.ExecuteNonQuery();
            connection.Close();

            htmlTable.Append("<table border ='1'>");
            htmlTable.Append("<tr><th>Date</th><th>Name</th><th>Company Name</th><th>Telephone No</th><th>Work Area</th><th>Vehicle Reg</th><th>Type</th><th>Created By</th></tr>");

            if (!object.Equals(ds.Tables[0], null))
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                    {
                        htmlTable.Append("<tr>");

                        htmlTable.Append("<td>" + ds.Tables[0].Rows[i]["Date"] + "</td>");
                        htmlTable.Append("<td>" + ds.Tables[0].Rows[i]["Name"] + "</td>");
                        htmlTable.Append("<td>" + ds.Tables[0].Rows[i]["Company Name"] + "</td>");
                        htmlTable.Append("<td>" + ds.Tables[0].Rows[i]["Telephone No"] + "</td>");
                        htmlTable.Append("<td>" + ds.Tables[0].Rows[i]["Work Area"] + "</td>");
                        htmlTable.Append("<td>" + ds.Tables[0].Rows[i]["Vehicle Reg"] + "</td>");
                        htmlTable.Append("<td>" + ds.Tables[0].Rows[i]["Type"] + "</td>");
                        htmlTable.Append("<td>" + ds.Tables[0].Rows[i]["Created By"] + "</td>");

                        htmlTable.Append("</tr>");
                    }
                    htmlTable.Append("</table>");
                    DBDataPlaceHolder.Controls.Add(new Literal { Text = htmlTable.ToString() });
                }
                else
                {
                    htmlTable.Append("<tr>");
                    htmlTable.Append("<td>There are no visitors for this day</td>");
                    htmlTable.Append("</tr>");
                }
            }
        }
        */

        private DataTable GetTodayData()
        {
            string today = DateTime.Today.ToShortDateString();
            string constr = "Server=STN-STNSQLMIR1;Database=DEVTestDB;trusted_connection=yes";
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM tblCreateVisitor WHERE Date = @Date"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        cmd.Parameters.AddWithValue("@Date", today);
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            return dt;
                        }
                    }
                }
            }
        }

        private DataTable GetData()
        {
            string today = DateTime.Today.ToShortDateString();
            string constr = "Server=STN-STNSQLMIR1;Database=DEVTestDB;trusted_connection=yes";
            using (SqlConnection con = new SqlConnection(constr))
            {
                if (comboBase.Text == "All")
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT * FROM tblCreateVisitor WHERE Date = @Date"))
                    {
                        using (SqlDataAdapter sda = new SqlDataAdapter())
                        {
                            cmd.Connection = con;
                            if (string.IsNullOrEmpty(txtSelect.Text) || string.IsNullOrWhiteSpace(txtSelect.Text))
                            {
                                cmd.Parameters.AddWithValue("@Date", today);

                            }
                            else
                            {
                                cmd.Parameters.AddWithValue("@Date", txtSelect.Text);
                            }
                            sda.SelectCommand = cmd;
                            using (DataTable dt = new DataTable())
                            {
                                sda.Fill(dt);
                                return dt;
                            }
                        }
                    }
                }
                else
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT * FROM tblCreateVisitor WHERE Date = @Date AND Base = @Base"))
                    {
                        using (SqlDataAdapter sda = new SqlDataAdapter())
                        {
                            cmd.Connection = con;
                            if (string.IsNullOrEmpty(txtSelect.Text) || string.IsNullOrWhiteSpace(txtSelect.Text))
                            {
                                cmd.Parameters.AddWithValue("@Date", today);
                            }
                            else
                            {
                                cmd.Parameters.AddWithValue("@Date", txtSelect.Text);
                                cmd.Parameters.AddWithValue("@Base", comboBase.Text);
                            }
                            sda.SelectCommand = cmd;
                            using (DataTable dt = new DataTable())
                            {
                                sda.Fill(dt);
                                return dt;
                            }
                        }
                    }
                }
            }
        }
    }
}