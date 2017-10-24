using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using Microsoft.AspNet.Identity;
using System.Data;

namespace VisitorMan
{
    public partial class Edit : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection("Server=STN-STNSQLMIR1;Database=DEVTestDB;trusted_connection=yes");

        protected void Page_Load(object sender, EventArgs e)
        {
            txtUsername.Text = Context.User.Identity.GetUserName();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            connection.Open();

            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = "UPDATE tblCreateVisitor SET Name = @Name, [Company Name] = @Company, [Telephone No] = @Phone, [Work Area] = @Area, [Vehicle Reg] =@Reg, " +
                "Type = @Type, Base = @Base WHERE VisitorID = @ID AND [Created By] = @Login";
            command.Parameters.AddWithValue("@Name", txtName.Text);
            command.Parameters.AddWithValue("@Company", txtCompany.Text);
            command.Parameters.AddWithValue("@Phone", txtTelephone.Text);
            command.Parameters.AddWithValue("@Area", txtArea.Text);
            command.Parameters.AddWithValue("@Reg", txtReg.Text);

            if (chkType.Text == "Airside")
            {
                command.Parameters.AddWithValue("@Type", "1");
            }
            else if (chkType.Text == "Landside")
            {
                command.Parameters.AddWithValue("@Type", "2");
            }
            else if (chkType.Text == "Con")
            {
                command.Parameters.AddWithValue("@Type", "3");
            }

            command.Parameters.AddWithValue("@Base", comboBase.Text);
            command.Parameters.AddWithValue("@ID", txtID.Text);
            
            command.Parameters.AddWithValue("@Login", txtUsername.Text);

            command.ExecuteNonQuery();

            command.Dispose();
            connection.Close();
        }

        protected void btnSelect_Click(object sender, EventArgs e)
        {
            lblName.Visible = true;   txtName.Visible = true;
            lblCompany.Visible = true; txtCompany.Visible = true;
            lblTelephone.Visible = true; txtTelephone.Visible = true;
            lblArea.Visible = true; txtArea.Visible = true;
            lblReg.Visible = true; txtReg.Visible = true;
            lblType.Visible = true; chkType.Visible = true;
            lblBase.Visible = true; comboBase.Visible = true;
            btnUpdate.Visible = true;

            connection.Open();

            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = "SELECT * FROM tblCreateVisitor WHERE Date = @Date AND Name = @Name";

            command.Parameters.AddWithValue("@Date", txtSelect.Text);
           //txtTest.Text = comboVisitor.Text;
            command.Parameters.AddWithValue("@Name", comboVisitor.Text);

            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                txtID.Text = reader["VisitorID"].ToString();
                txtName.Text = reader["Name"].ToString();
                txtCompany.Text = reader["Company Name"].ToString();
                txtTelephone.Text = reader["Telephone No"].ToString();
                txtArea.Text = reader["Work Area"].ToString();
                txtReg.Text = reader["Vehicle Reg"].ToString();
                txtType.Text = reader["Type"].ToString();
                if (txtType.Text == "1")
                {
                    chkType.SelectedIndex = 0;
                }
                else if (txtType.Text == "2")
                {
                    chkType.SelectedIndex = 1;
                }
                else if (txtType.Text == "3")
                {
                    chkType.SelectedIndex = 2;
                }
                txtBase.Text = reader["Base"].ToString();
                if (txtBase.Text == "Stansted")
                {
                    comboBase.SelectedIndex = 0;
                }
                else if (txtBase.Text == "Luton")
                {
                    comboBase.SelectedIndex = 1;
                }
                else if (txtBase.Text == "Farnborough")
                {
                    comboBase.SelectedIndex = 2;
                }
            }
            reader.Close();
            command.Dispose();
            connection.Close();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            DataTable visitors = new DataTable();
      
            string date = Convert.ToDateTime(txtSelect.Text).ToLongDateString();
            //Allow user to select from a drop down list of visitor for that day

            using (SqlConnection con = new SqlConnection("Server=STN-STNSQLMIR1;Database=DEVTestDB;trusted_connection=yes"))
            {
                try
                {
                    SqlDataAdapter adapter = new SqlDataAdapter("SELECT Name,[Company Name] FROM tblCreateVisitor WHERE [Created Date] = @Date AND [Created By] = @Login", con);
                    adapter.SelectCommand.Parameters.AddWithValue("@Date", txtSelect.Text);
                    adapter.SelectCommand.Parameters.AddWithValue("@Login", txtUsername.Text);

                    adapter.Fill(visitors);

                    comboVisitor.DataSource = visitors;
                    comboVisitor.DataTextField = "Name";
                    comboVisitor.DataValueField = "Name";
                    comboVisitor.DataBind();

                    comboVisitor.Visible = true;
                    btnSelect.Visible = true;
                }
                catch (Exception ex)
                {

                    throw;
                }
            }

            //connection.Open();

            //SqlCommand command = new SqlCommand();
            //command.Connection = connection;
            //command.CommandText = "SELECT Name,[Company Name] FROM tblCreateVisitor WHERE [Created Date] = @Date AND [Network Login] = @Login"; //SELECT FROM tblCreateVisitor
            //command.Parameters.AddWithValue("@Date", txtSelect.Text);
            //command.Parameters.AddWithValue("@Login", txtUsername.Text);

            //SqlDataReader reader = command.ExecuteReader();
            //while (reader.Read())
            //{
            //    //insert into controls
            //}
            //reader.Close();
            //command.Dispose();
            //connection.Close();
        }
    }
}