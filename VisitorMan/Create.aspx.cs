using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using Microsoft.AspNet.Identity;
using System.DirectoryServices;
using System.Text;

namespace VisitorMan
{
    public partial class Create : Page
    {
        SqlConnection connection = new SqlConnection("Server=STN-STNSQLMIR1;Database=DEVTestDB;User ID=testadmin;Password=pass");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Context.User.Identity.GetUserName().StartsWith("M"))
            {
                Response.Redirect("/Account/Login");
            }
            txtLogin.Text = Context.User.Identity.GetUserName();
        }

        public static DirectoryEntry GetDirectoryEntry(string DomainReference)
        {
            string ADFullPath = "LDAP://harrodsaviation.com";
            DirectoryEntry de = new DirectoryEntry(ADFullPath + DomainReference, "pwg350453", "Poppy2014", AuthenticationTypes.Secure);
            return de;
        }

        private static string GetLDAPDomain()
        {
            StringBuilder LDAPDomain = new StringBuilder();
            string[] LDAPDC = "harrodsaviation.com".Split('.');
            for (int i = 0; i < LDAPDC.GetUpperBound(0) + 1; i++)
            {
                LDAPDomain.Append("DC=" + LDAPDC[i]);
                if (i < LDAPDC.GetUpperBound(0))
                {
                    LDAPDomain.Append(",");
                }
            }
            return LDAPDomain.ToString();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {

            if (/*string.IsNullOrEmpty(txtDate.Text) || string.IsNullOrWhiteSpace(txtDate.Text) ||*/
                string.IsNullOrEmpty(txtName.Text) || string.IsNullOrWhiteSpace(txtName.Text) ||
                string.IsNullOrEmpty(txtCompany.Text) || string.IsNullOrWhiteSpace(txtCompany.Text) ||
                string.IsNullOrEmpty(txtTelephone.Text) || string.IsNullOrWhiteSpace(txtTelephone.Text) ||
                string.IsNullOrEmpty(txtArea.Text) || string.IsNullOrWhiteSpace(txtArea.Text) ||
                string.IsNullOrEmpty(chkType.Text) || string.IsNullOrWhiteSpace(chkType.Text) ||
                string.IsNullOrEmpty(comboBase.Text) || string.IsNullOrWhiteSpace(comboBase.Text))
            {
                lblError.Visible = true;
                lblComplete.Visible = false;
            }
            else
            {
                lblError.Visible = false; 
                  
                DirectoryEntry entry = GetDirectoryEntry("/" + GetLDAPDomain());
                DirectorySearcher search = new DirectorySearcher(entry);
                search.Filter = "(SAMAccountName=" + txtLogin.Text + ")";
                search.PropertiesToLoad.Add("mail");
                SearchResult result = search.FindOne();
                if (result != null)
                {
                    txtEmail.Text = result.Properties["mail"][0].ToString();
                }

                DateTime dob = DateTime.Parse(Request.Form[txtDate.UniqueID]);
                string date = dob.ToShortDateString();
                txtCDate.Text = DateTime.Today.ToShortDateString();

                connection.Open();

                SqlCommand key = new SqlCommand();
                key.Connection = connection;
                key.CommandText = "SELECT TOP 1 VisitorID FROM tblCreateVisitor ORDER BY VisitorID DESC";
                SqlDataReader reader = key.ExecuteReader();
                while (reader.Read())
                {
                    txtID.Text = reader["VisitorID"].ToString();
                }
                reader.Close();
                key.Dispose();

                int num = int.Parse(txtID.Text);
                num++;
                txtID.Text = num.ToString();
                //
                //
                SqlCommand command = new SqlCommand();
                command.Connection = connection;
                command.CommandText =
                    "SET IDENTITY_INSERT tblCreateVisitor ON " +
                    "INSERT INTO [tblCreateVisitor] (VisitorID,Date,Name,[Company Name],[Telephone No],[Work Area],[Vehicle Reg],Type,[Created By],[Created Date],CheckedIn,Email,Base)" +
                    "VALUES(@ID,@Date,@Name,@Company,@Phone,@Area,@Reg,@Type,@CBy,@CDate,@Checked,@Email,@Base) " +
                    "SET IDENTITY_INSERT tblCreateVisitor OFF ";


                command.Parameters.AddWithValue("@ID", txtID.Text);
                command.Parameters.AddWithValue("@Date", date.ToString());
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
                command.Parameters.AddWithValue("@CBy", txtLogin.Text);
                command.Parameters.AddWithValue("@CDate", txtCDate.Text);
                command.Parameters.AddWithValue("@Checked", "0");
                command.Parameters.AddWithValue("@Email", txtEmail.Text);

                //Luton = 1. Stansted = 2. Farn = 3.
                if (comboBase.Text == "Stansted")
                {
                    command.Parameters.AddWithValue("@Base", "Stansted");
                }
                else if (comboBase.Text == "Luton")
                {
                    command.Parameters.AddWithValue("@Base", "Luton");
                }
                else if (comboBase.Text == "Farnborough")
                {
                    command.Parameters.AddWithValue("@Base", "Farnborough");
                }

                command.ExecuteNonQuery();

                command.Dispose();
                connection.Close();

                lblComplete.Visible = true;

                txtName.Text = "";
                txtCompany.Text = "";
                txtTelephone.Text = "";
                txtArea.Text = "";
                txtReg.Text = "";
                chkType.ClearSelection();
            }
        }
    }
}