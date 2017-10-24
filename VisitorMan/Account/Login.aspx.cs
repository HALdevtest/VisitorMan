using System;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using System.Data.SqlClient;
using System.Web.Security;
//using VisitorMan.Models;

namespace VisitorMan.Account
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //RegisterHyperLink.NavigateUrl = "Register";
            //// Enable this once you have account confirmation enabled for password reset functionality
            ////ForgotPasswordHyperLink.NavigateUrl = "Forgot";
            //OpenAuthLogin.ReturnUrl = Request.QueryString["ReturnUrl"];
            //var returnUrl = HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
            //if (!String.IsNullOrEmpty(returnUrl))
            //{
            //    RegisterHyperLink.NavigateUrl += "?ReturnUrl=" + returnUrl;
            //}
        }

        protected void Login_Click(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection("Server=STN-STNSQLMIR1;Database=DEVTestDB;trusted_connection=yes");
            connection.Open();

            SqlCommand cmdCount = new SqlCommand();
            cmdCount.Connection = connection;
            cmdCount.CommandText = "SELECT count(*) FROM tblLogs WHERE [Network Login] = @login";
            cmdCount.Parameters.AddWithValue("@login", txtUsername.Text);
            int count = (int)cmdCount.ExecuteScalar();

            if (count > 0)
            {
                SqlCommand select = new SqlCommand();
                select.Connection = connection;
                select.CommandText = "SELECT Count FROM tblLogs WHERE [Network Login] = @login";
                select.Parameters.AddWithValue("@login", txtUsername.Text);
                SqlDataReader reader = select.ExecuteReader();
                while (reader.Read())
                {
                    txtCount.Text = reader["Count"].ToString();
                }
                reader.Close();

                int num = int.Parse(txtCount.Text);
                num++;
                txtCount.Text = num.ToString();

                string date = DateTime.Now.ToString();
                // string time = DateTime.Now.ToShortTimeString();

                SqlCommand command = new SqlCommand();
                command.Connection = connection;
                command.CommandText = "UPDATE tblLogs SET Count = @Count, [Last Login] = @last WHERE [Network Login] = @login";
                command.Parameters.AddWithValue("@Count", txtCount.Text);
                command.Parameters.AddWithValue("@last", date.ToString());

                command.Parameters.AddWithValue("@login", txtUsername.Text);

                command.ExecuteNonQuery();

                command.Dispose();
            }
            else
            {
                string date = DateTime.Now.ToString();

                SqlCommand insert = new SqlCommand();
                insert.Connection = connection;
                insert.CommandText = "INSERT INTO tblLogs([Network Login],[Last Login],[Count]) VALUES(@login,@last,@count)";
                insert.Parameters.AddWithValue("@login", txtUsername.Text);
                insert.Parameters.AddWithValue("@last", date.ToString());
                insert.Parameters.AddWithValue("@count", "1");

                insert.ExecuteNonQuery();

                insert.Dispose();
            }

            connection.Close();

            String adPath = "LDAP://harrodsaviation.com"; //Fully-qualified Domain Name
            LdapAuthentication adAuth = new LdapAuthentication(adPath, "mamd1", txtUsername.Text, txtPassword.Text);
            try
            {
                //"mamd1", txtUsername.Text, txtPassword.Text
                if (true == adAuth.IsAuthenticated())
                {
                    String groups = adAuth.GetGroups();

                    //Create the ticket, and add the groups.
                    //bool isCookiePersistent = chkPersist.Checked;
                    FormsAuthenticationTicket authTicket = new FormsAuthenticationTicket(1, txtUsername.Text,
                    DateTime.Now, DateTime.Now.AddMinutes(60), false, groups);

                    //Encrypt the ticket.
                    String encryptedTicket = FormsAuthentication.Encrypt(authTicket);

                    //Create a cookie, and then add the encrypted ticket to the cookie as data.
                    HttpCookie authCookie = new HttpCookie(FormsAuthentication.FormsCookieName, encryptedTicket);

                    // if(true == isCookiePersistent)
                    //authCookie.Expires = authTicket.Expiration;

                    //Add the cookie to the outgoing cookies collection.
                    Response.Cookies.Add(authCookie);

                    //You can redirect now.
                    if (txtUsername.Text == "devtest")
                    {
                        Response.Redirect("~/Default.aspx");
                    }
                    else
                    {
                        Response.Redirect(FormsAuthentication.GetRedirectUrl(txtUsername.Text, false));
                    }
                }
                else
                {
                    errorLabel.Text = "Authentication did not succeed. Check user name and password.";
                }
            }
            catch (Exception ex)
            {
                errorLabel.Text = "Error authenticating. " + ex.Message;
            }
        }
    

        protected void LogIn(object sender, EventArgs e)
        {
            //if (IsValid)
            //{
            //    // Validate the user password
            //    var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            //    var signinManager = Context.GetOwinContext().GetUserManager<ApplicationSignInManager>();

            //    // This doen't count login failures towards account lockout
            //    // To enable password failures to trigger lockout, change to shouldLockout: true
            //    var result = signinManager.PasswordSignIn(Email.Text, Password.Text, RememberMe.Checked, shouldLockout: false);

            //    switch (result)
            //    {
            //        case SignInStatus.Success:
            //            IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
            //            break;
            //        case SignInStatus.LockedOut:
            //            Response.Redirect("/Account/Lockout");
            //            break;
            //        case SignInStatus.RequiresVerification:
            //            Response.Redirect(String.Format("/Account/TwoFactorAuthenticationSignIn?ReturnUrl={0}&RememberMe={1}", 
            //                                            Request.QueryString["ReturnUrl"],
            //                                            RememberMe.Checked),
            //                              true);
            //            break;
            //        case SignInStatus.Failure:
            //        default:
            //            FailureText.Text = "Invalid login attempt";
            //            ErrorMessage.Visible = true;
            //            break;
            //    }
            //}
        }
    }
}