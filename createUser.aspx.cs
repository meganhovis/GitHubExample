using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Text.RegularExpressions;
using System.Configuration;
using System.Data;

public partial class createUser : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    { 
        //Test for session variable for secure access to page
        try
        {
            System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
            String cs = ConfigurationManager.ConnectionStrings["WildTekConnectionString"].ConnectionString;
            sc.ConnectionString = cs;
            sc.Open();
         
            SqlConnection con = new SqlConnection(cs);

            con.Open();

            System.Data.SqlClient.SqlCommand str = new System.Data.SqlClient.SqlCommand();
            str.Connection = sc;
            str.Parameters.Clear();

            str.CommandText = "select * from Person where username= @username";
            str.Parameters.AddWithValue("@username", HttpUtility.HtmlEncode(Session["USER_ID"]));
            str.ExecuteNonQuery();

            SqlDataAdapter da = new SqlDataAdapter(str);

            DataSet ds = new DataSet();

            da.Fill(ds);

        }
        catch
        {
            //redirect to the login page
           // Session.RemoveAll();
            //Response.Redirect("Default.aspx", false);

        }
    }

    //removes the session variable when the user logs in
    protected void btn_lgout_Click(object sender, EventArgs e)
    {

        Session.RemoveAll();

        Session["USER_ID"] = null;

        Response.Redirect("Default.aspx");
    }
    //determines crudentials are correct, inserts new information into the database to create a new user
    protected void btnSubmit_Click(object sender, EventArgs e)
    {

        if (txtFirstName.Text != "" && txtLastName.Text != "" && txtPassword.Text != "" && txtUsername.Text != "") // all fields must be filled out
        {
            if (validatePassword(txtPassword.Text.ToString()) == true)
            {


                // COMMIT VALUES
                try
                {

                    System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
                    String cs = ConfigurationManager.ConnectionStrings["WildTekConnectionString"].ConnectionString;
                    sc.ConnectionString = cs;
                    sc.Open();
                    

                    bool exists = false;

                    // create a command to check if the username exists
                    SqlCommand cmd = new SqlCommand("select Count(*) from [dbo].[Person] where Username = @UserName", sc);

                    cmd.Parameters.AddWithValue("@UserName", txtUsername.Text);

                    exists = (int)cmd.ExecuteScalar() > 0;

                    // if exists, show a message error
                    if (!exists)
                    {
                        System.Data.SqlClient.SqlCommand createUser = new System.Data.SqlClient.SqlCommand();
                        createUser.Connection = sc;


                        // INSERT USER RECORD
                        createUser.CommandText = "insert into[dbo].[Person] values(@FName, @LName, @Username, @Email, @Status, @PersonCategory)";
                        createUser.Parameters.Add(new SqlParameter("@FName", txtFirstName.Text));
                        createUser.Parameters.Add(new SqlParameter("@LName", txtLastName.Text));
                        createUser.Parameters.Add(new SqlParameter("@Username", txtUsername.Text));
                        createUser.Parameters.Add(new SqlParameter("@Email", txtEmail.Text));
                        createUser.Parameters.Add(new SqlParameter("@Status", "Active"));

                        switch(ddlStaffType.SelectedItem.Value.ToString())
                        {
                            case "0":
                                break;

                            case "1":
                                createUser.Parameters.Add(new SqlParameter("@PersonCategory", "O"));
                                break;

                            case "2":
                                createUser.Parameters.Add(new SqlParameter("@PersonCategory", "V"));
                                break;
                        }

                        createUser.ExecuteNonQuery();

                        System.Data.SqlClient.SqlCommand setPass = new System.Data.SqlClient.SqlCommand();
                        setPass.Connection = sc;
                        // INSERT PASSWORD RECORD AND CONNECT TO USER
                        setPass.CommandText = "insert into[dbo].[Pass] values((select max(userid) from person), @Username, @Password)";
                        setPass.Parameters.Add(new SqlParameter("@Username", txtUsername.Text));
                        setPass.Parameters.Add(new SqlParameter("@Password", PasswordHash.HashPassword(txtPassword.Text))); // hash entered password
                        setPass.ExecuteNonQuery();

                        sc.Close();


                        System.Data.SqlClient.SqlConnection sc1 = new System.Data.SqlClient.SqlConnection();
                        String cs1 = ConfigurationManager.ConnectionStrings["WildTekConnectionString"].ConnectionString;
                        sc1.ConnectionString = cs1;
                        sc1.Open();

                        switch (ddlStaffType.SelectedValue.ToString())
                        {
                            case "0":
                                break;

                            case "1":
                                System.Data.SqlClient.SqlCommand createOutreachCoordinator = new System.Data.SqlClient.SqlCommand();
                                createOutreachCoordinator.Connection = sc1;

                                //INSERT INTO table_name (column1, column2, column3, ...)
                                //VALUES(value1, value2, value3, ...);
                                string lastUpdateBy = "Wildlife Center";
                                string status = "Active";
                                string category = "O";

                                // INSERT USER RECORD
                                createOutreachCoordinator.CommandText = "insert into[dbo].[Educators] (Username, EducatorFirstName, " +
                                    "EducatorLastName, LastUpdated, LastUpdatedBy, Status, EducatorPhoneNumber, EducatorEmail," +
                                    " EducatorCategory)" +
                                    "  values (@userName, @FName, @LName, @LU, @LUB, @Status, @PhoneNum, @Email, @PersonCategory)";
                                createOutreachCoordinator.Parameters.Add(new SqlParameter("@userName", txtUsername.Text));
                                createOutreachCoordinator.Parameters.Add(new SqlParameter("@FName", txtFirstName.Text));
                                createOutreachCoordinator.Parameters.Add(new SqlParameter("@LName", txtLastName.Text));
                                createOutreachCoordinator.Parameters.Add(new SqlParameter("@LU", DateTime.Now.ToShortDateString()));
                                createOutreachCoordinator.Parameters.Add(new SqlParameter("@LUB", lastUpdateBy));
                                createOutreachCoordinator.Parameters.Add(new SqlParameter("@Status", status));
                                createOutreachCoordinator.Parameters.Add(new SqlParameter("@PhoneNum", txtPhoneNumber.Text));
                                createOutreachCoordinator.Parameters.Add(new SqlParameter("@Email", txtEmail.Text));
                                createOutreachCoordinator.Parameters.Add(new SqlParameter("@PersonCategory", category));
                                createOutreachCoordinator.ExecuteNonQuery();

                                break;

                            case "2":
                                System.Data.SqlClient.SqlCommand createVolunteer = new System.Data.SqlClient.SqlCommand();
                                createVolunteer.Connection = sc1;
                                string lastUpdateBy1 = "Wildlife Center";
                                string status1 = "Active";
                                string category1 = "V";
                                //INSERT INTO table_name (column1, column2, column3, ...)
                                //VALUES(value1, value2, value3, ...);


                                // INSERT USER RECORD
                                createVolunteer.CommandText = "insert into[dbo].[Volunteers] (Username, VolunteerFirstName, VolunteerLastName," +
                                    " VolunteerPhoneNumber, VolunteerEmail, VolunteerStatus, LastUpdated, LastUpdatedBy, VolunteerCategory)" +
                                    "  values (@userName, @FName, @LName, @PhoneNum, @Email, @Status, @LU, @LUB, @PersonCategory)";
                                createVolunteer.Parameters.Add(new SqlParameter("@userName", txtUsername.Text));
                                createVolunteer.Parameters.Add(new SqlParameter("@FName", txtFirstName.Text));
                                createVolunteer.Parameters.Add(new SqlParameter("@LName", txtLastName.Text));
                                createVolunteer.Parameters.Add(new SqlParameter("@PhoneNum", txtPhoneNumber.Text));
                                createVolunteer.Parameters.Add(new SqlParameter("@Email", txtEmail.Text));
                                createVolunteer.Parameters.Add(new SqlParameter("@Status", "Active"));
                                createVolunteer.Parameters.Add(new SqlParameter("@LU", DateTime.Now.ToShortDateString()));
                                createVolunteer.Parameters.Add(new SqlParameter("@LUB", lastUpdateBy1));
                                createVolunteer.Parameters.Add(new SqlParameter("@PersonCategory", category1));
                                createVolunteer.ExecuteNonQuery();

                                break;
                        }


                        lblStatus.Text = "User committed!";
                        txtEmail.Enabled = false;
                        txtFirstName.Enabled = false;
                        txtLastName.Enabled = false;
                        txtUsername.Enabled = false;
                        txtPassword.Enabled = false;
                        btnSubmit.Enabled = false;
                        chkShowPassword.Visible = false;
                       // Response.Redirect("Program.aspx", false);




                    }
                    else
                    {
                        lblStatus.Text = "This username " + HttpUtility.HtmlEncode(txtUsername.Text) + " has been created already.";
                    }

                }

                catch (SqlException)
                {
                   lblStatus.Text = "fix error.";
                }
                catch
                {
                   lblStatus.Text = "Database Error - User not committed.";
                }
            }
        }
        else
            lblStatus.Text = "Fill in a value for all fields.";
    }

    //protected void lnkLogin_Click(object sender, EventArgs e)
    //{
    //    Response.Redirect("createUser.aspx", false);
    //}

    //protected void lnkAnother_Click(object sender, EventArgs e)
    //{
    //    txtFirstName.Enabled = true;
    //    txtLastName.Enabled = true;
    //    txtEmail.Enabled = true;
    //    txtUsername.Enabled = true;
    //    txtPassword.Enabled = true;
    //    btnSubmit.Enabled = true;
    //    txtFirstName.Text = "";
    //    txtLastName.Text = "";
    //    txtUsername.Text = "";
    //    txtPassword.Text = "";
    //    chkShowPassword.Visible = true;
    //}

        //validates the newly created password before the user can be submitted
    private bool validatePassword(string password)
    {
        bool temp;

        // Regular expression to validate password
        string regPassword = @"^(?=.*?[A-Z])(?=(.*[a-z]){1,})(?=(.*[\d]){1,})(?=(.*[\W]){1,})(?!.*\s).{8,}$";
        // Creates an instance of Regex class
        Regex r = new Regex(regPassword);

        // Checks if given password is valid and return value
        if (r.IsMatch(password))
        {
            temp = true;
        }
        else
        {
            temp = false;
            lblStatus.Text = "Invalid password or username. Please try again.";
        }

        return temp;
    }
    //shows the password is the box is selected 
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
    //checks that the username has not been created already
    public static bool CheckUserName(string username)
    {
        bool status = false;
        //string constr = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
        String cs = ConfigurationManager.ConnectionStrings["WildTekConnectionString"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(cs))
        {
            using (SqlCommand cmd = new SqlCommand("CheckUserAvailability", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@UserName", username.Trim());
                conn.Open();
                status = Convert.ToBoolean(cmd.ExecuteScalar());
                conn.Close();
            }
        }
        return status;
    }
}