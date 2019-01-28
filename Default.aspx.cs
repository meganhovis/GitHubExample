using System;

using System.Collections.Generic;

using System.Linq;

using System.Web;

using System.Web.UI;

using System.Web.UI.WebControls;

using System.Data.SqlClient;

using System.Configuration;

using System.Net.Mail;

using System.Text;

using System.Data;
using System.Collections;

public partial class userLogin : System.Web.UI.Page

{

    protected void Page_Load(object sender, EventArgs e)

    {

    }



    protected void btnLogin_Click(object sender, EventArgs e)

    {

        // connect to database to retrieve stored password string

        try

        {

            System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();

            String cs = ConfigurationManager.ConnectionStrings["WildTekConnectionString"].ConnectionString;

            sc.ConnectionString = cs;
            sc.Open();
            System.Data.SqlClient.SqlCommand findPass = new System.Data.SqlClient.SqlCommand();
            findPass.Connection = sc;
            // SELECT PASSWORD STRING WHERE THE ENTERED USERNAME MATCHES
            findPass.CommandText = "select PasswordHash, pe.Status, pe.PersonCategory from Pass pa, Person pe where pa.username = @Username and pe.username = @Username";
            findPass.Parameters.Add(new SqlParameter("@Username", txtUsername.Text));
            SqlDataReader reader = findPass.ExecuteReader(); // create a reader
                                                             // SqlDataAdapter asda = new SqlDataAdapter();
                                                             //  DataSet ds = new DataSet();

            if (reader.HasRows) // if the username exists, it will continue
            {
                while (reader.Read()) // this will read the single record that matches the entered username

                {
                    string storedHash = reader["PasswordHash"].ToString(); // store the database password into this variable
                    if (PasswordHash.ValidatePassword(txtPassword.Text, storedHash)) // if the entered password matches what is stored, it will show success
                    {
                        string PersonStatus = "";
                        PersonStatus = reader["Status"].ToString(); // store the database password into this variable
                       
                        if (PersonStatus.Equals("Active"))
                        {
                            string storedCategory = "";
                            storedCategory = reader["PersonCategory"].ToString();
                            switch (storedCategory)
                            {
                                case "O":
                                    lblStatus.Text = "Success!";
                                    btnLogin.Enabled = false;
                                    txtUsername.Enabled = false;
                                    txtPassword.Enabled = false;
                                    Session["USER_ID"] = HttpUtility.HtmlEncode(txtUsername.Text);
                                    Response.Redirect("Programs.aspx");
                                    break;

                                case "V":
                                    lblStatus.Text = "Success!";
                                    btnLogin.Enabled = false;
                                    txtUsername.Enabled = false;
                                    txtPassword.Enabled = false;
                                    Session["USER_ID"] = HttpUtility.HtmlEncode(txtUsername.Text);

                                    Response.Redirect("NoLogInPrograms.aspx");
                                    break;
                            }

                        }
                        else
                        {
                            lblStatus.Text = "Inactive User - Please Contact Your Administrator.";
                        }
                    }
                    else
                        lblStatus.Text = "Incorrect Username or Password. Please Try again.";
                }


            }

            else // if the username doesn't exist, it will show failure

                lblStatus.Text = "Incorrect Username or Password. Please Try again.";



            sc.Close();

        }

        catch

        {

            lblStatus.Text = "Database Error.";

        }
        HttpResponse.RemoveOutputCacheItem("/Default.aspx");

    }
    //clears cache 
    public static void ClearCache()
    {
        HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);
        HttpContext.Current.Response.Cache.SetExpires(DateTime.Now);
        HttpContext.Current.Response.Cache.SetNoServerCaching();
        HttpContext.Current.Response.Cache.SetNoStore();
    }
    public void ClearCacheItems()
    {
        List<string> keys = new List<string>();
        IDictionaryEnumerator enumerator = Cache.GetEnumerator();

        while (enumerator.MoveNext())
            keys.Add(enumerator.Key.ToString());

        for (int i = 0; i < keys.Count; i++)
            Cache.Remove(keys[i]);
    }
    //lets the user reset their password
    protected void btnResetPassword_Click(object sender, EventArgs e)

    {

        string CS = ConfigurationManager.ConnectionStrings["WildTekConnectionString"].ConnectionString;

        using (SqlConnection con = new SqlConnection(CS))

        {

            SqlCommand cmd = new SqlCommand("spResetPassword", con);

            cmd.CommandType = CommandType.StoredProcedure;

            SqlParameter paramUsername = new SqlParameter("@UserName", txtUsername.Text);
            cmd.Parameters.Add(paramUsername);
            con.Open();

            SqlDataReader rdr = cmd.ExecuteReader();

            if (txtUsername.Text == "")

            {

                string script = "alert('First Enter a Username');";

                System.Web.UI.ScriptManager.RegisterClientScriptBlock(btnReset, this.GetType(), "Test", script, true);
            }

            else

            {
                while (rdr.Read())

                {

                    if (Convert.ToBoolean(rdr["ReturnCode"]))

                    {

                        SendPasswordResetEmail(rdr["Email"].ToString(), HttpUtility.HtmlEncode(txtUsername.Text), rdr["UniqueId"].ToString());

                        string script = "alert('An email with instructions to reset your password has been sent to your registered email');";

                        System.Web.UI.ScriptManager.RegisterClientScriptBlock(btnReset, this.GetType(), "Test", script, true);



                        // lblMessage.Text = "An email with instructions to reset your password is sent to your registered email";

                    }

                    else

                    {
                        string script = "alert('Username not found!');";

                        System.Web.UI.ScriptManager.RegisterClientScriptBlock(btnReset, this.GetType(), "Test", script, true);

                    }

                }

            }

        }

    }
    //sends an email if the user forgets their password 
    private void SendPasswordResetEmail(string ToEmail, string UserName, string UniqueId)

    {

        // MailMessage class is present is System.Net.Mail namespace

        MailMessage mailMessage = new MailMessage("wildtek6@gmail.com", ToEmail);

        // StringBuilder class is present in System.Text namespace

        StringBuilder sbEmailBody = new StringBuilder();

        sbEmailBody.Append("Dear " + UserName + ",<br/><br/>");

        sbEmailBody.Append("Please click on the following link to reset your password");

        sbEmailBody.Append("<br/>");

        sbEmailBody.Append("<br/>"); sbEmailBody.Append("http://wildtek.site/ChangePassword.aspx?uid=" + UniqueId);

        sbEmailBody.Append("<br/><br/>");

        mailMessage.IsBodyHtml = true;



        mailMessage.Body = sbEmailBody.ToString();

        mailMessage.Subject = "Reset Your Password";

        SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);



        smtpClient.Credentials = new System.Net.NetworkCredential()

        {

            UserName = "wildtek6@gmail.com",

            Password = "Wildlife"

        };



        smtpClient.EnableSsl = true;

        smtpClient.Send(mailMessage);

    }

    
    //Method to show password on checkbox clicked

    protected void chkShowPassword_CheckedChanged(object sender, EventArgs e)

    {

        if (chkShowPassword.Checked)

        {

            txtPassword.TextMode = TextBoxMode.SingleLine;

            this.txtPassword.Text = HttpUtility.HtmlEncode(txtPassword.Text);


        }

        else

        {

            txtPassword.TextMode = TextBoxMode.Password;

            txtPassword.Attributes.Add("value", txtPassword.Text);

            this.txtPassword.Text = HttpUtility.HtmlEncode(txtPassword.Text);

        }

    }

}