<%@ Page Title="Login" Language="C#"  AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="VisitorMan.Account.Login" %>
<%--<%@ Import Namespace="VisitorMan" %>
<%@ Import Namespace="System.Data.SqlClient" %>--%>



<html>
    <head runat="server">
        <title>Home - Visitor Management</title>
        <style>
            img.center {
                display: block;
                margin: 0 auto;
            }
            .panelColor{
                border-top: 1px solid #000;
                border-left: 1px solid #000;
                border-right: 1px solid #000;
                border-bottom: 1px solid #000;
            }
            text.center{
                display: block;
                margin: 0 auto;
            }
        </style>
    </head>
        
  <body style="height: 50px;">
      <form id="Login" method="post" runat="server">
          <h1>
              <img src="../Content/Aviation-logo.png" alt="Harrods Aviation" id="logo" class="center" />
          </h1>
          <hr  style="display:block; border-style: inset; border-width: 1px; width:99.2%;"/>
      <asp:Panel runat="server" height="332px" Width="600px" class="panelColor" style="margin-left:auto; margin-right:auto; margin-top:200px;">
          <div style="text-align: center;">
              <div style="margin-left:auto; margin-right:auto; margin-top: 100px; width:400px;">
      <asp:Label ID="Label2" Runat="server" style="margin-bottom:10px;" >Username:</asp:Label>
      <asp:TextBox ID=txtUsername Runat="server" class="center" style="margin-left:10px; margin-right:1px;"></asp:TextBox><br />
                  <div style="height:5px;"></div>
      <asp:Label ID="Label3" Runat="server" >Password:</asp:Label>
      <asp:TextBox ID="txtPassword" Runat="server" TextMode=Password style="margin-left:15px; margin-right:1px;"></asp:TextBox><br>
                  <div style="height:5px;"></div>
      <asp:Button ID="btnLogin" Runat="server" Text="Login" OnClick="Login_Click" style="margin-left:208px; margin-right:1px;"></asp:Button><br>
      <asp:Label ID="errorLabel" Runat="server" ForeColor=#ff3300></asp:Label><br>
      <asp:TextBox ID="txtCount" runat="server" Visible="false"></asp:TextBox>
     <%-- <asp:CheckBox ID=chkPersist Runat="server" Text="Persist Cookie" />--%>
          </div>
              </div>
      </asp:Panel>
    </form>
  </body>
</html>
<%--<script runat=server>
    void Login_Click(Object sender, EventArgs e)
    {

        //SqlConnection connection = new SqlConnection("Server=STN-STNSQLMIR1;Database=DEVTestDB;trusted_connection=yes");
        //connection.Open();

        //SqlCommand select = new SqlCommand();
        //select.Connection = connection;
        //select.CommandText = "SELECT Count FROM tblLogs";
        //SqlDataReader reader = select.ExecuteReader();
        //while (reader.Read())
        //{
        //    txtCount.Text = reader["Count"].ToString();
        //}
        //reader.Close();

        //int num = int.Parse(txtCount.Text);
        //num++;
        //txtCount.Text = num.ToString();

        //string date = DateTime.Today.ToLongDateString();

        //SqlCommand command = new SqlCommand();
        //command.Connection = connection;
        //command.CommandText = "UPDATE tblLogs SET Count = @Count, [Last Login] = @last WHERE [Network Login] =@login";
        //command.Parameters.AddWithValue("@Count", txtCount.Text);
        //command.Parameters.AddWithValue("@last", date.ToString());
        //command.Parameters.AddWithValue("@login", txtUsername.Text);

        //command.Dispose();
        //connection.Close();


        //String adPath = "LDAP://harrodsaviation.com"; //Fully-qualified Domain Name
        //LdapAuthentication adAuth = new LdapAuthentication(adPath,"mamd1", txtUsername.Text, txtPassword.Text);
        //try
        //{
        //    //"mamd1", txtUsername.Text, txtPassword.Text
        //    if(true == adAuth.IsAuthenticated())
        //    {
        //        String groups = adAuth.GetGroups();

        //        //Create the ticket, and add the groups.
        //        //bool isCookiePersistent = chkPersist.Checked;
        //        FormsAuthenticationTicket authTicket = new FormsAuthenticationTicket(1,  txtUsername.Text,
        //  DateTime.Now, DateTime.Now.AddMinutes(60), false, groups);

        //        //Encrypt the ticket.
        //        String encryptedTicket = FormsAuthentication.Encrypt(authTicket);

        //        //Create a cookie, and then add the encrypted ticket to the cookie as data.
        //        HttpCookie authCookie = new HttpCookie(FormsAuthentication.FormsCookieName, encryptedTicket);

        //        // if(true == isCookiePersistent)
        //        //authCookie.Expires = authTicket.Expiration;

        //        //Add the cookie to the outgoing cookies collection.
        //        Response.Cookies.Add(authCookie);

        //        //You can redirect now.
        //        Response.Redirect(FormsAuthentication.GetRedirectUrl(txtUsername.Text, false));
        //    }
        //    else
        //    {
        //        errorLabel.Text = "Authentication did not succeed. Check user name and password.";
        //    }
        //}
        //catch(Exception ex)
        //{
        //    errorLabel.Text = "Error authenticating. " + ex.Message;
        //}
    }
</script>--%>

  <%--<asp:Label ID="Label1" Runat=server >Domain:</asp:Label>
      <asp:TextBox ID="txtDomain" Runat=server ></asp:TextBox><br>--%>