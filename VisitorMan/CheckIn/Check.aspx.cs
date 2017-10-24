using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Runtime.InteropServices;
using Outlook = Microsoft.Office.Interop.Outlook;
using System.Net.Mail;
using System.Net;
using EASendMail;
using System.Xml.Linq;

namespace VisitorMan
{
    public partial class Check : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection("Server=STN-STNSQLMIR1;Database=DEVTestDB;trusted_connection=yes");
       // Outlook.Application app;

        protected void Page_Load(object sender, EventArgs e)
        {
            // object missing = Type.Missing; 
            // app = new Microsoft.Office.Interop.Outlook.Application();

            // app.Session.Logon("mamd1\\devtest", "ExecJet1", missing, missing);
            string today = DateTime.Today.ToShortDateString();

            txtDate.Text = today;

        }

        protected void SendMail()
        {
            //var fromAddress = "dev.test@harrodsaviation.com";
            //var toAddress = "william.groom@harrodsaviation.com";

            //const string fromPassword = "ExecJet1";

            //string subject = "Your visitor has checked in";

            //var smtp = new System.Net.Mail.SmtpClient();
            //{
            //}
        }

        //Outlook.MailItem mail = null;

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            connection.Open();

            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = "UPDATE tblCreateVisitor SET CheckedIn = 3 WHERE Name LIKE '%' + @Surname + '%' AND Date = @Date";
            command.Parameters.AddWithValue("@Surname", txtSurname.Text);
            command.Parameters.AddWithValue("@Date", txtDate.Text);

            command.ExecuteNonQuery();

            command.Dispose();

            SqlCommand select = new SqlCommand();
            select.Connection = connection;
            select.CommandText = "SELECT CheckedIn,Name FROM tblCreateVisitor WHERE Name LIKE '%' + @Surname + '%' AND Date = @Date";
            select.Parameters.AddWithValue("@Surname", txtSurname.Text);
            select.Parameters.AddWithValue("@Date", txtDate.Text);
            SqlDataReader reader = select.ExecuteReader();
            while (reader.Read())
            {
                txtCheck.Text = reader["CheckedIn"].ToString();
            }

            if (txtCheck.Text == "3")
            {
                lblComplete.Text = "You have successfully checked out.";
            }
            reader.Close();
            select.Dispose();

            connection.Close();
            txtCheck.Text = "";
        }

        protected void btnCheck_Click(object sender, EventArgs e)
        {
            connection.Open();

            SqlCommand select = new SqlCommand();
            select.Connection = connection;
            select.CommandText = "SELECT CheckedIn,Name,[Company Name],Email FROM tblCreateVisitor WHERE Name LIKE '%' + @Surname + '%' AND Date = @Date";
            select.Parameters.AddWithValue("@Surname", txtSurname.Text);
            select.Parameters.AddWithValue("@Date", txtDate.Text);
            SqlDataReader reader = select.ExecuteReader();
            while (reader.Read())
            {
                txtname.Text = reader["Name"].ToString();
                txtcompany.Text = reader["Company Name"].ToString();
                txtEmail.Text = reader["Email"].ToString();
                txtCheck.Text = reader["CheckedIn"].ToString();
            }

            reader.Close();
            select.Dispose();


            if (txtCheck.Text == "1")
            {
                lblComplete.Text = "You have already checked in.";

                txtCheck.Text = "";
            }
            else if (txtCheck.Text == "0")
            {
                SqlCommand command = new SqlCommand();
                command.Connection = connection;
                command.CommandText = "UPDATE tblCreateVisitor SET CheckedIn = 1 WHERE Name LIKE '%' + @Surname + '%' AND Date = @Date";
                command.Parameters.AddWithValue("@Surname", txtSurname.Text);
                command.Parameters.AddWithValue("@Date", txtDate.Text);

                //port 25
                command.ExecuteNonQuery();

                command.Dispose();

                lblComplete.Text = "Check in successful.";

                //Outlook.Account account = app.Session.Accounts["dev.test@harrodsaviation.com"];

                //mail = this.app.CreateItem(Microsoft.Office.Interop.Outlook.OlItemType.olMailItem) as Outlook.MailItem;
                //mail.SendUsingAccount = account;
                //mail.Subject = "Your visitor - " + txtname.Text + " from " + txtcompany.Text + " has checked in";
                //mail.To = txtEmail.Text;
                //mail.Send();

                SmtpMail oMail = new SmtpMail("TryIt");
                EASendMail.SmtpClient oSmtp = new EASendMail.SmtpClient();

                oMail.From = "dev.test@harrodsaviation.com";

                oMail.To = txtEmail.Text;

                oMail.Subject = "Your Visitor - " + txtname.Text + " from " + txtcompany.Text + " has checked in";

                oMail.TextBody = "";

                SmtpServer oServer = new SmtpServer("casarray.harrodsaviation.com");

                oServer.User = "STNAdmin@harrodsaviation.com";
                oServer.Password = "01H@rrM@md1s";

                oServer.Port = 25;

                oServer.ConnectType = SmtpConnectType.ConnectSSLAuto;

                oSmtp.SendMail(oServer, oMail);

                txtCheck.Text = "";
                //using (var mail2 = new System.Net.Mail.MailMessage())
                //{
                //    mail2.From = new System.Net.Mail.MailAddress("dev.test@harrodsaviation.com");
                //    mail2.Subject = "Your visitor - " + txtname.Text + " from " + txtcompany.Text + " has checked in";
                //    mail2.Body = "";
                //    mail2.To.Add(txtEmail.Text);

                //    using (var smtp = new System.Net.Mail.SmtpClient("webmail.emailmyname.com", 145))
                //    {
                //        smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                //        smtp.UseDefaultCredentials = false;
                //        smtp.Credentials = new NetworkCredential("mamd1\\pwg350453", );

                //        smtp.Send(mail2);
                //    }
                //}
            }
            else if (string.IsNullOrEmpty(txtCheck.Text) || string.IsNullOrWhiteSpace(txtCheck.Text))
            {
                lblComplete.Text = "Visitor not found";
            }
            connection.Close();
        }
    }
}