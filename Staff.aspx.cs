using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Volunteers : System.Web.UI.Page
{
    //string finalStaffCategory = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            System.Data.SqlClient.SqlConnection sc1 = new System.Data.SqlClient.SqlConnection();
            //sc.ConnectionString = @"Server=localhost;Database=WildTek;Trusted_Connection=Yes;";
            String cs1 = ConfigurationManager.ConnectionStrings["WildTekConnectionString"].ConnectionString;
            sc1.ConnectionString = cs1;
            sc1.Open();
            // lblWelcome.Text = "Welcome, " + Session["USER_ID"].ToString() + "!";

            SqlConnection con = new SqlConnection(cs1);

            con.Open();

            //string str = "select * from Person where username= @username";
            System.Data.SqlClient.SqlCommand str = new System.Data.SqlClient.SqlCommand();
            str.Connection = sc1;
            str.Parameters.Clear();

            str.CommandText = "select * from Person where username= @username and PersonCategory = 'O'";
            str.Parameters.AddWithValue("@username", Session["USER_ID"]);
            str.ExecuteNonQuery();

            //SqlCommand com = new SqlCommand(str, con);

            SqlDataAdapter da = new SqlDataAdapter(str);

            DataSet ds = new DataSet();

            da.Fill(ds);

            lblWelcome.Text = "Welcome, " + ds.Tables[0].Rows[0]["Firstname"].ToString() + " ";


        }
        catch
        {
            //Session.RemoveAll();
           // Response.Redirect("Default.aspx", false);
        }

        System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
        String cs = ConfigurationManager.ConnectionStrings["WildTekConnectionString"].ConnectionString;
        sc.ConnectionString = cs;
        sc.Open();

        System.Data.SqlClient.SqlCommand insert = new System.Data.SqlClient.SqlCommand();
        insert.Connection = sc;


        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "ModalView", "<script>$function(){ $('#myModal').modal('show');});</script>", false);
        if (!IsPostBack)
        {
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            if (con.State == System.Data.ConnectionState.Open)
            {


                //string read2 = "Select EducatorID AS UserID, EducatorCategory AS Category, EducatorFirstName AS FirstName, EducatorLastName AS LastName, EducatorPhoneNumber AS PhoneNumber, EducatorEmail AS Email, Status AS Status From Educators UNION ALL Select VolunteerID AS UserID, VolunteerCategory AS Category, VolunteerFirstName AS FirstName, VolunteerLastName AS LastName, VolunteerPhoneNumber AS PhoneNumber, VolunteerEmail AS Email, VolunteerStatus AS Status From Volunteers Order By FirstName";

            }
            //GridView2.DataBind();
            con.Close();
        }

    }
    protected void btn_lgout_Click(object sender, EventArgs e)
    {


        //Session.Clear();
        //Session.Abandon();
        Session.RemoveAll();

        Session["USER_ID"] = null;

        Response.Redirect("Default.aspx");
    }

    // THIS CODE POPULATES NAME BASED ON EMPLOYEE TYPE
    protected void ddlPopulateStaff_ddlVolunteer_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtEducatorFirst.Text = "";
        txtEducatorLast.Text = "";
        txtEducatorEmail.Text = "";
        txtEducatorPhone.Text = "";
        ddlEducatorStatus.ClearSelection();
        ddlStaffType.ClearSelection();
        GlobalVars.FinalStaffCategory = ddlPopulateStaff.SelectedValue.ToString();
        System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
        String cs = ConfigurationManager.ConnectionStrings["WildTekConnectionString"].ConnectionString;
        sc.ConnectionString = cs;
        sc.Open();

        System.Data.SqlClient.SqlCommand insert = new System.Data.SqlClient.SqlCommand();
        insert.Connection = sc;
        SqlConnection con = new SqlConnection(cs);
        con.Open();
        switch (GlobalVars.FinalStaffCategory)
        {
            case "0":
                ddlEducatorName.Items.Clear();
                ddlEducatorName.Items.Add("");
                break;

            case "O":
                GlobalVars.FinalStaffCategory = "O";
                ddlEducatorName.Items.Clear();
                ddlEducatorName.Items.Add("--Select Staff Type--");
                string read2 = "Select * from Educators";
                SqlCommand cmd2 = new SqlCommand(read2, con);

                SqlDataReader myRead2 = cmd2.ExecuteReader();

                while (myRead2.Read())
                {
                    //ddlEducatorName.Items.Add(new ListItem(myRead2["FirstName"].ToString(), ((myRead2["FirstName"].ToString() + ":" + myRead2["UserID"].ToString()))));
                    ddlEducatorName.Items.Add(new ListItem(myRead2["EducatorFirstName"].ToString(), (myRead2["EducatorID"].ToString())));

                }
                break;

            case "V":
                GlobalVars.FinalStaffCategory = "V";
                ddlEducatorName.Items.Clear();
                ddlEducatorName.Items.Add("--Select Staff Type--");
                string read = "Select * from Volunteers";
                SqlCommand cmd = new SqlCommand(read, con);
                SqlDataReader myRead = cmd.ExecuteReader();

                while (myRead.Read())
                {
                    ddlEducatorName.Items.Add(new ListItem(myRead["VolunteerFirstName"].ToString() + " " + myRead["VolunteerLastName"].ToString(), myRead["VolunteerID"].ToString()));
                }

                break;



        }
    }


    protected void ddlVolunteer_SelectedIndexChanged(object sender, EventArgs e)
    {
        System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
        // sc.ConnectionString = @"Server=localhost;Database=WildTek;Trusted_Connection=Yes;";
        String cs = ConfigurationManager.ConnectionStrings["WildTekConnectionString"].ConnectionString;
        sc.ConnectionString = cs;
        sc.Open();

        System.Data.SqlClient.SqlCommand insert = new System.Data.SqlClient.SqlCommand();
        insert.Connection = sc;


        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "ModalView", "<script>$function(){ $('#myModal').modal('show');});</script>", false);

        //call read array
        SqlConnection con = new SqlConnection(cs);

        insert.CommandText = "select VolunteerFirstName, VolunteerLastName, VolunteerPhoneNumber, VolunteerEmail, VolunteerStatus, lastUpdated, lastUpdatedBy from Volunteers where VolunteerID = @VolunteerID";

        insert.Parameters.AddWithValue("@VolunteerID", ddlVolunteerName.SelectedItem.Value);

        ddlVolunteerStatus.ClearSelection();
        try
        {
            con.Open();
            SqlDataReader sdr = insert.ExecuteReader();
            while (sdr.Read())
            {
                txtVolunteerFirstName.Text = HttpUtility.HtmlEncode(sdr[0].ToString());
                txtVolunteerLastName.Text = HttpUtility.HtmlEncode(sdr[1].ToString());
                txtVolunteerPhoneNumber.Text = HttpUtility.HtmlEncode(sdr[2].ToString());
                txtVolunteerEmail.Text = HttpUtility.HtmlEncode(sdr[3].ToString());
                for (int i = 0; i < ddlVolunteerStatus.Items.Count; i++)
                {
                    if (ddlVolunteerStatus.Items[i].ToString() == sdr[4].ToString())
                    {
                        ddlVolunteerStatus.Items[i].Selected = true;
                    }
                }
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
        con.Close();
        sc.Close();
    }
    //protected void btnUpdateVolunteer_Click(object sender, EventArgs e)
    //{
    //    System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
    //    // sc.ConnectionString = @"Server=localhost;Database=WildTek;Trusted_Connection=Yes;";
    //    String cs = ConfigurationManager.ConnectionStrings["WildTekConnectionString"].ConnectionString;
    //    sc.ConnectionString = cs;
    //    sc.Open();

    //    System.Data.SqlClient.SqlCommand update = new System.Data.SqlClient.SqlCommand();
    //    update.Connection = sc;
    //    SqlConnection con = new SqlConnection(cs);

    //    update.CommandText = "update Volunteers set VolunteerFirstName = @VolunteerFirstName, VolunteerLastName = @VolunteerLastName, VolunteerPhoneNumber = @VolunteerPhoneNumber, VolunteerEmail = @VolunteerEmail, VolunteerStatus = @VolunteerStatus," +
    //        " lastUpdated = @lastUpdated, lastUpdatedBy = @lastUpdatedBy where VolunteerID = @VolunteerID";
    //    update.Parameters.AddWithValue("@VolunteerFirstName", txtVolunteerFirstName.Text);
    //    update.Parameters.AddWithValue("@VolunteerLastName", txtVolunteerLastName.Text);
    //    update.Parameters.AddWithValue("@VolunteerPhoneNumber", txtVolunteerPhoneNumber.Text);
    //    update.Parameters.AddWithValue("@VolunteerEmail", txtVolunteerEmail.Text);
    //    update.Parameters.AddWithValue("@VolunteerStatus", ddlVolunteerStatus.SelectedItem.Value);
    //    update.Parameters.AddWithValue("@VolunteerID", ddlVolunteerName.SelectedItem.Value);
    //    update.Parameters.AddWithValue("@lastUpdated", DateTime.Today);
    //    update.Parameters.AddWithValue("@lastUpdatedBy", Session["USER_ID"].ToString());
    //    update.ExecuteNonQuery();

    //    lblLastUpdatedVolunteer.Text = "Last Updated: " + HttpUtility.HtmlEncode(DateTime.Today);
    //    lblLastUpdatedByVolunteer.Text = "Last Updated By: " + Session["USER_ID"].ToString();

    //    System.Data.SqlClient.SqlCommand insert = new System.Data.SqlClient.SqlCommand();
    //    SqlConnection con2 = new SqlConnection(cs);

    //    ddlVolunteerName.Items.Clear();
    //    //call read array
    //    con.Open();
    //    if (con.State == System.Data.ConnectionState.Open)
    //    {

    //        string read = "Select * from Volunteers";
    //        SqlCommand cmd = new SqlCommand(read, con);
    //        SqlDataReader myRead = cmd.ExecuteReader();

    //        ddlVolunteerName.Items.Add(new ListItem("--Select Volunteer--", "0"));
    //        while (myRead.Read())
    //        {
    //            ddlVolunteerName.Items.Add(new ListItem(myRead["VolunteerFirstName"].ToString() + " " + myRead["VolunteerLastName"].ToString(), myRead["VolunteerID"].ToString()));
    //        }
    //    }
    //    con.Close();
    //    sc.Close();
    //    GridView1.DataBind();
    //    //GridView2.DataBind();
    //    //GridView3.DataBind();

    //    System.Data.SqlClient.SqlCommand updatePerson = new System.Data.SqlClient.SqlCommand();
    //    updatePerson.Connection = sc;
    //    SqlConnection con1 = new SqlConnection(cs);

    //    updatePerson.CommandText = "update Person set FirstName = @VolunteerFirstName, LastName = @VolunteerLastName, Email = @VolunteerEmail, Status = @VolunteerStatus, PersonCategory = @PersonCategory" +
    //        " where UserID = @VolunteerID";


    //    updatePerson.Parameters.AddWithValue("@VolunteerFirstName", txtVolunteerFirstName.Text);
    //    updatePerson.Parameters.AddWithValue("@VolunteerLastName", txtVolunteerLastName.Text);
    //    update.Parameters.AddWithValue("@VolunteerEmail", txtVolunteerEmail.Text);
    //    update.Parameters.AddWithValue("@VolunteerStatus", ddlVolunteerStatus.SelectedItem.Value);
    //    update.Parameters.AddWithValue("@PersonCategory", ddlStaffType.SelectedItem.Value);
    //    update.Parameters.AddWithValue("@VolunteerID", ddlVolunteerName.SelectedItem.Value);
    //    //update.Parameters.AddWithValue("@lastUpdated", DateTime.Today);
    //    //update.Parameters.AddWithValue("@lastUpdatedBy", Session["USER_ID"].ToString());
    //    update.ExecuteNonQuery();

    //    lblLastUpdatedVolunteer.Text = "Last Updated: " + HttpUtility.HtmlEncode(DateTime.Today);
    //    lblLastUpdatedByVolunteer.Text = "Last Updated By: " + Session["USER_ID"].ToString();





    //    }

    //protected void btnAddEducator_Click(object sender, EventArgs e)
    //{
    //    System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();

    //    // sc.ConnectionString = @"Server=localhost;Database=WildTek;Trusted_Connection=Yes;";

    //    String cs = ConfigurationManager.ConnectionStrings["WildTekConnectionString"].ConnectionString;
    //    sc.ConnectionString = cs;
    //    System.Data.SqlClient.SqlCommand insert = new System.Data.SqlClient.SqlCommand();


    //    sc.Open();
    //    insert.Connection = sc;

    //    //String firstName = txtEducatorFirstName.Text;
    //    //String lastName = txtEducatorLastName.Text;

    //    DateTime lastUpdated = DateTime.Today;
    //    String lastUpdatedBy = HttpUtility.HtmlEncode(Session["USER_ID"].ToString());




    //   // insert.CommandText = "insert into Educators (educatorFirstName, educatorLastName, lastUpdated, lastUpdatedBy, status) values (@firstName, @lastName, @lastUpdated, @lastUpdatedBy, @status)";
    //   // insert.Parameters.AddWithValue("@firstName", firstName);
    //   // insert.Parameters.AddWithValue("@lastName", lastName);
    //   // insert.Parameters.AddWithValue("@lastUpdated", lastUpdated);
    //   // insert.Parameters.AddWithValue("@lastUpdatedBy", lastUpdatedBy);
    //   // insert.Parameters.AddWithValue("@status", "Active");
    //   // insert.ExecuteNonQuery();

    //    //lblLastUpdated.Text = "Last Updated: " + lastUpdated;
    //    //lblLastUpdatedBy.Text = "Last Updated By: " + lastUpdatedBy;

    //   // txtEducatorFirstName.Text = "";
    //    //txtEducatorLastName.Text = "";
    //    //txtEducatorEmail.Text = "";
    //    //txtEducatorPhone.Text = "";

    //    ddlEducatorName.Items.Clear();
    //    string read1 = "Select * from Educators";
    //    SqlCommand cmd1 = new SqlCommand(read1, sc);
    //    SqlDataReader myRead1 = cmd1.ExecuteReader();

    //    ddlEducatorName.Items.Add(new ListItem("--Select Educator--", "0"));
    //    while (myRead1.Read())
    //    {
    //        ddlEducatorName.Items.Add(new ListItem(myRead1["EducatorFirstName"].ToString(), myRead1["EducatorID"].ToString()));
    //    }
    //    sc.Close();
    //    GridView2.DataBind();
    //    //GridView2.DataBind();
    //    //GridView3.DataBind();
    //}

    protected void btnUpdateEducator_Click(object sender, EventArgs e)
    {
        try
        {
            System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
            // sc.ConnectionString = @"Server=localhost;Database=WildTek;Trusted_Connection=Yes;";
            String cs = ConfigurationManager.ConnectionStrings["WildTekConnectionString"].ConnectionString;
            sc.ConnectionString = cs;
            sc.Open();

            System.Data.SqlClient.SqlCommand delFK1 = new System.Data.SqlClient.SqlCommand();
            System.Data.SqlClient.SqlCommand delFK2 = new System.Data.SqlClient.SqlCommand();
            System.Data.SqlClient.SqlCommand delRecord = new System.Data.SqlClient.SqlCommand();
            System.Data.SqlClient.SqlCommand insert1 = new System.Data.SqlClient.SqlCommand();
            System.Data.SqlClient.SqlCommand insert2 = new System.Data.SqlClient.SqlCommand();
            System.Data.SqlClient.SqlCommand update1 = new System.Data.SqlClient.SqlCommand();
            System.Data.SqlClient.SqlCommand update2 = new System.Data.SqlClient.SqlCommand();


            delFK1.Connection = sc;
            delFK2.Connection = sc;
            delRecord.Connection = sc;
            insert1.Connection = sc;
            insert2.Connection = sc;
            update1.Connection = sc;
            update2.Connection = sc;


            System.Data.SqlClient.SqlCommand delFK3 = new System.Data.SqlClient.SqlCommand();
            System.Data.SqlClient.SqlCommand delFK4 = new System.Data.SqlClient.SqlCommand();
            System.Data.SqlClient.SqlCommand delRecord1 = new System.Data.SqlClient.SqlCommand();
            System.Data.SqlClient.SqlCommand insert3 = new System.Data.SqlClient.SqlCommand();
            System.Data.SqlClient.SqlCommand insert4 = new System.Data.SqlClient.SqlCommand();
            System.Data.SqlClient.SqlCommand update3 = new System.Data.SqlClient.SqlCommand();
            System.Data.SqlClient.SqlCommand update4 = new System.Data.SqlClient.SqlCommand();


            delFK3.Connection = sc;
            delFK4.Connection = sc;
            delRecord1.Connection = sc;
            insert3.Connection = sc;
            insert4.Connection = sc;
            update3.Connection = sc;
            update4.Connection = sc;





            SqlConnection con = new SqlConnection(cs);

            switch (GlobalVars.FinalStaffCategory)
            {
                case "O":

                    //Delete FK Constraint 1
                    delFK1.CommandText = "Delete from ProgramEducators where EducatorID = @educatorID";
                    delFK1.Parameters.AddWithValue("@educatorID", ddlEducatorName.SelectedItem.Value);
                    delFK1.ExecuteNonQuery();

                    //Delete FK Constraint 2
                    delFK2.CommandText = "Delete from OnlineEducators where EducatorID = @educatorID";
                    delFK2.Parameters.AddWithValue("@educatorID", ddlEducatorName.SelectedItem.Value);
                    delFK2.ExecuteNonQuery();

                    //Delete FK Constraint 2
                    delRecord.CommandText = "Delete from Educators where EducatorID = @educatorID";
                    delRecord.Parameters.AddWithValue("@educatorID", ddlEducatorName.SelectedItem.Value);
                    delRecord.ExecuteNonQuery();

                    switch (ddlStaffType.SelectedValue.ToString())
                    {
                        case "O":

                            // INSERT INTO table_name(column1, column2, column3, ...)
                            //VALUES(value1, value2, value3, ...);
                            insert1.CommandText = "Insert into Educators (Username, EducatorFirstName, EducatorLastName, LastUpdated, LastUpdatedBy, Status, EducatorPhoneNumber, EducatorEmail, EducatorCategory) values (@userName, @firstName, @lastName, @lastUpdated, @lastUpdatedBy, @status, @phoneNum, @educatorEmail, @educatorCat)";


                            insert1.Parameters.AddWithValue("@userName", GlobalVars.currentUsername);

                            //insert.CommandText = "Insert into Educators set EducatorFirstName = @firstName, EducatorLastName = @lastName, LastUpdated = @lastUpdated, LastUpdatedBy = @lastUpdated, Status = @status, EducatorPhoneNumber = @phoneNum, EducatorEmail = @educatorEmail, EducatorCategory = @educatorCat where educatorID = @educatorID";
                            insert1.Parameters.AddWithValue("@firstName", txtEducatorFirst.Text);
                            insert1.Parameters.AddWithValue("@lastName", txtEducatorLast.Text);
                            //insert1.Parameters.AddWithValue("@educatorID", ddlEducatorName.SelectedItem.Value);
                            insert1.Parameters.AddWithValue("@lastUpdated", DateTime.Today);
                            //update.Parameters.AddWithValue("@lastUpdatedBy", Session["USER_ID"].ToString());
                            insert1.Parameters.AddWithValue("@lastUpdatedBy", "Wildlife Center of VA");
                            insert1.Parameters.AddWithValue("@status", ddlEducatorStatus.SelectedItem.Value);
                            insert1.Parameters.AddWithValue("@phoneNum", txtEducatorPhone.Text);
                            insert1.Parameters.AddWithValue("@educatorEmail", txtEducatorEmail.Text);
                            insert1.Parameters.AddWithValue("@educatorCat", "O");
                            insert1.ExecuteNonQuery();

                            update1.CommandText = "Update Person set FirstName = @FN, LastName = @LN, Email = @Email, Status = @Status, PersonCategory = @pCat";
                            update1.Parameters.AddWithValue("@FN", txtEducatorFirst.Text);
                            update1.Parameters.AddWithValue("@LN", txtEducatorLast.Text);
                            update1.Parameters.AddWithValue("@Email", txtEducatorEmail.Text);
                            update1.Parameters.AddWithValue("@Status", ddlEducatorStatus.SelectedItem.Value);
                            update1.Parameters.AddWithValue("@pCat", "O");
                            update1.ExecuteNonQuery();

                            GlobalVars.FinalStaffCategory = "";
                            GlobalVars.currentUsername = "";

                            //update1.CommandText = "Update Person set PersonCategory = 'O' where 


                            break;


                        case "V":
                            insert2.CommandText = "Insert into Volunteers (Username, VolunteerFirstName, VolunteerLastName, VolunteerPhoneNumber, VolunteerEmail, VolunteerStatus, LastUpdated, LastUpdatedBy, VolunteerCategory) values (@userName, @VolunteerFirstName, @VolunteerLastName, @VolunteerPhoneNumber, @VolunteerEmail, @VolunteerStatus, @LastUpdated, @LastUpdatedBy, @VolunteerCategory)";
                            //insert.CommandText = "Insert into Educators set EducatorFirstName = @firstName, EducatorLastName = @lastName, LastUpdated = @lastUpdated, LastUpdatedBy = @lastUpdated, Status = @status, EducatorPhoneNumber = @phoneNum, EducatorEmail = @educatorEmail, EducatorCategory = @educatorCat where educatorID = @educatorID";
                            insert2.Parameters.AddWithValue("@userName", GlobalVars.currentUsername);

                            insert2.Parameters.AddWithValue("@VolunteerFirstName", GlobalVars.currentUsername);
                            insert2.Parameters.AddWithValue("@VolunteerLastName", txtEducatorLast.Text);
                            //insert2.Parameters.AddWithValue("@educatorID", ddlEducatorName.SelectedItem.Value);
                            insert2.Parameters.AddWithValue("@LastUpdated", DateTime.Today);
                            //update.Parameters.AddWithValue("@lastUpdatedBy", Session["USER_ID"].ToString());
                            insert2.Parameters.AddWithValue("@LastUpdatedBy", "Wildlife Center of VA");
                            insert2.Parameters.AddWithValue("@VolunteerStatus", ddlEducatorStatus.SelectedItem.Value);
                            insert2.Parameters.AddWithValue("@VolunteerPhoneNumber", txtEducatorPhone.Text);
                            insert2.Parameters.AddWithValue("@VolunteerEmail", txtEducatorEmail.Text);
                            insert2.Parameters.AddWithValue("@VolunteerCategory", "V");
                            insert2.ExecuteNonQuery();


                            update2.CommandText = "Update Person set Username = @userName, FirstName = @FN, LastName = @LN, Email = @Email, Status = @Status, PersonCategory = @pCat";
                            update2.Parameters.AddWithValue("@userName", txtEducatorFirst.Text);
                            update2.Parameters.AddWithValue("@FN", txtEducatorFirst.Text);
                            update2.Parameters.AddWithValue("@LN", txtEducatorLast.Text);
                            update2.Parameters.AddWithValue("@Email", txtEducatorEmail.Text);
                            update2.Parameters.AddWithValue("@Status", ddlEducatorStatus.SelectedItem.Value);
                            update2.Parameters.AddWithValue("@pCat", "V");
                            update2.ExecuteNonQuery();



                            GlobalVars.FinalStaffCategory = "";
                            GlobalVars.currentUsername = "";

                            break;


                    }

                    break;



                case "V":
                    //Delete FK Constraint 1
                    delFK3.CommandText = "Delete from ProgramVolunteers where VolunteerID = @volunteerID";
                    delFK3.Parameters.AddWithValue("@volunteerID", ddlEducatorName.SelectedItem.Value);
                    delFK3.ExecuteNonQuery();

                    //Delete FK Constraint 2
                    delFK4.CommandText = "Delete from OnlineVolunteers where VolunteerID = @volunteerID";
                    delFK4.Parameters.AddWithValue("@volunteerID", ddlEducatorName.SelectedItem.Value);
                    delFK4.ExecuteNonQuery();

                    //Delete FK Constraint 2
                    delRecord1.CommandText = "Delete from Volunteers where VolunteerID = @volunteerID";
                    delRecord1.Parameters.AddWithValue("@volunteerID", ddlEducatorName.SelectedItem.Value);
                    delRecord1.ExecuteNonQuery();

                    switch (ddlStaffType.SelectedValue.ToString())
                    {
                        case "O":

                            // INSERT INTO table_name(column1, column2, column3, ...)
                            //VALUES(value1, value2, value3, ...);
                            insert3.CommandText = "Insert into Educators (Username, EducatorFirstName, EducatorLastName, LastUpdated, LastUpdatedBy, Status, EducatorPhoneNumber, EducatorEmail, EducatorCategory) values (@userName, @firstName, @lastName, @lastUpdated, @lastUpdatedBy, @status, @phoneNum, @educatorEmail, @educatorCat)";
                            insert3.Parameters.AddWithValue("@userName", GlobalVars.currentUsername);

                            //insert.CommandText = "Insert into Educators set EducatorFirstName = @firstName, EducatorLastName = @lastName, LastUpdated = @lastUpdated, LastUpdatedBy = @lastUpdated, Status = @status, EducatorPhoneNumber = @phoneNum, EducatorEmail = @educatorEmail, EducatorCategory = @educatorCat where educatorID = @educatorID";
                            insert3.Parameters.AddWithValue("@firstName", txtEducatorFirst.Text);
                            insert3.Parameters.AddWithValue("@lastName", txtEducatorLast.Text);
                            //insert1.Parameters.AddWithValue("@educatorID", ddlEducatorName.SelectedItem.Value);
                            insert3.Parameters.AddWithValue("@lastUpdated", DateTime.Today);
                            //update.Parameters.AddWithValue("@lastUpdatedBy", Session["USER_ID"].ToString());
                            insert3.Parameters.AddWithValue("@lastUpdatedBy", "Wildlife Center of VA");
                            insert3.Parameters.AddWithValue("@status", ddlEducatorStatus.SelectedItem.Value);
                            insert3.Parameters.AddWithValue("@phoneNum", txtEducatorPhone.Text);
                            insert3.Parameters.AddWithValue("@educatorEmail", txtEducatorEmail.Text);
                            insert3.Parameters.AddWithValue("@educatorCat", "O");
                            insert3.ExecuteNonQuery();

                            update3.CommandText = "Update Person set FirstName = @FN, LastName = @LN, Email = @Email, Status = @Status, PersonCategory = @pCat";
                            update3.Parameters.AddWithValue("@FN", txtEducatorFirst.Text);
                            update3.Parameters.AddWithValue("@LN", txtEducatorLast.Text);
                            update3.Parameters.AddWithValue("@Email", txtEducatorEmail.Text);
                            update3.Parameters.AddWithValue("@Status", ddlEducatorStatus.SelectedItem.Value);
                            update3.Parameters.AddWithValue("@pCat", "O");
                            update3.ExecuteNonQuery();

                            GlobalVars.FinalStaffCategory = "";
                            GlobalVars.currentUsername = "";

                            break;


                        case "V":
                            insert4.CommandText = "Insert into Volunteers (Username, VolunteerFirstName, VolunteerLastName, VolunteerPhoneNumber, VolunteerEmail, VolunteerStatus, LastUpdated, LastUpdatedBy, VolunteerCategory) values (@userName, @VolunteerFirstName, @VolunteerLastName, @VolunteerPhoneNumber, @VolunteerEmail, @VolunteerStatus, @LastUpdated, @LastUpdatedBy, @VolunteerCategory)";
                            insert4.Parameters.AddWithValue("@userName", GlobalVars.currentUsername);

                            //insert.CommandText = "Insert into Educators set EducatorFirstName = @firstName, EducatorLastName = @lastName, LastUpdated = @lastUpdated, LastUpdatedBy = @lastUpdated, Status = @status, EducatorPhoneNumber = @phoneNum, EducatorEmail = @educatorEmail, EducatorCategory = @educatorCat where educatorID = @educatorID";
                            insert4.Parameters.AddWithValue("@VolunteerFirstName", txtEducatorFirst.Text);
                            insert4.Parameters.AddWithValue("@VolunteerLastName", txtEducatorLast.Text);
                            //insert2.Parameters.AddWithValue("@educatorID", ddlEducatorName.SelectedItem.Value);
                            insert4.Parameters.AddWithValue("@LastUpdated", DateTime.Today);
                            //update.Parameters.AddWithValue("@lastUpdatedBy", Session["USER_ID"].ToString());
                            insert4.Parameters.AddWithValue("@LastUpdatedBy", "Wildlife Center of VA");
                            insert4.Parameters.AddWithValue("@VolunteerStatus", ddlEducatorStatus.SelectedItem.Value);
                            insert4.Parameters.AddWithValue("@VolunteerPhoneNumber", txtEducatorPhone.Text);
                            insert4.Parameters.AddWithValue("@VolunteerEmail", txtEducatorEmail.Text);
                            insert4.Parameters.AddWithValue("@VolunteerCategory", "V");
                            insert4.ExecuteNonQuery();

                            update4.CommandText = "Update Person set FirstName = @FN, LastName = @LN, Email = @Email, Status = @Status, PersonCategory = @pCat";
                            update4.Parameters.AddWithValue("@FN", txtEducatorFirst.Text);
                            update4.Parameters.AddWithValue("@LN", txtEducatorLast.Text);
                            update4.Parameters.AddWithValue("@Email", txtEducatorEmail.Text);
                            update4.Parameters.AddWithValue("@Status", ddlEducatorStatus.SelectedItem.Value);
                            update4.Parameters.AddWithValue("@pCat", "V");
                            update4.ExecuteNonQuery();

                            GlobalVars.FinalStaffCategory = "";
                            GlobalVars.currentUsername = "";

                            break;


                    }


                    break;
            }
        } catch
        {
            Response.Redirect("Staff.aspx");
        }



       }


    protected void ddlEducator_SelectedIndexChanged1(object sender, EventArgs e)
    {
        txtEducatorFirst.Text = "";
        txtEducatorLast.Text = "";
        txtEducatorEmail.Text = "";
        txtEducatorPhone.Text = "";
        ddlEducatorStatus.ClearSelection();
        ddlStaffType.ClearSelection();

        System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
        // sc.ConnectionString = @"Server=localhost;Database=WildTek;Trusted_Connection=Yes;";
        String cs = ConfigurationManager.ConnectionStrings["WildTekConnectionString"].ConnectionString;
        sc.ConnectionString = cs;
        sc.Open();

        System.Data.SqlClient.SqlCommand insert = new System.Data.SqlClient.SqlCommand();
        insert.Connection = sc;


        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "ModalView", "<script>$function(){ $('#myModal').modal('show');});</script>", false);

        //call read array
        SqlConnection con = new SqlConnection(cs);

        switch (GlobalVars.FinalStaffCategory)
        {
            case "0":
                //string script = "alert('File Successfully Exported to Desktop');";
                //System.Web.UI.ScriptManager.RegisterClientScriptBlock(btnExportLive, this.GetType(), "Test", script, true);
                break;

            case "O":
                txtEducatorLast.Text = "";
                txtEducatorLast.Text = "";
                txtEducatorEmail.Text = "";
                txtEducatorPhone.Text = "";
                ddlEducatorStatus.ClearSelection();
                ddlStaffType.ClearSelection();
                insert.CommandText = "select EducatorFirstName, EducatorLastName, lastUpdated, lastUpdatedBy, Status, EducatorPhoneNumber, EducatorEmail, EducatorCategory, Username from Educators where educatorID = @educatorID";

                insert.Parameters.AddWithValue("@educatorID", ddlEducatorName.SelectedItem.Value);
                ddlEducatorStatus.ClearSelection();
                try
                {
                    con.Open();
                    SqlDataReader sdr = insert.ExecuteReader();
                    while (sdr.Read())
                    {
                        txtEducatorFirst.Text = HttpUtility.HtmlEncode(sdr[0].ToString());
                        txtEducatorLast.Text = HttpUtility.HtmlEncode(sdr[1].ToString());
                        txtEducatorEmail.Text = HttpUtility.HtmlEncode(sdr[6].ToString());
                        txtEducatorPhone.Text = HttpUtility.HtmlEncode(sdr[5].ToString());
                        GlobalVars.currentUsername = HttpUtility.HtmlEncode(sdr[8].ToString());
                        //lblLastUpdated.Text = "Last Updated: " + sdr["LastUpdated"].ToString();
                        //lblLastUpdatedBy.Text = "Last Updated By: " + sdr["LastUpdatedBy"].ToString();
                        //ddlEducatorStatus.SelectedItem.Value = sdr[4].ToString();


                        for (int i = 0; i < ddlEducatorStatus.Items.Count; i++)
                        {
                            if (ddlEducatorStatus.Items[i].ToString() == sdr[4].ToString())
                            {
                                ddlEducatorStatus.Items[i].Selected = true;
                            }
                        }

                        string tempState = sdr[7].ToString();
                        switch (tempState)
                        {
                            case "O":
                                ddlStaffType.SelectedValue = "O";
                                break;
                            case "V":
                                ddlStaffType.SelectedValue = "V";
                                
                                break;
                        }

                    }


                    con.Close();
                }
                catch (Exception ex)
                {
                    throw ex;
                }
                break;

            case "V":
                txtEducatorFirst.Text = "";
                txtEducatorLast.Text = "";
                txtEducatorEmail.Text = "";
                txtEducatorPhone.Text = "";
                ddlEducatorStatus.ClearSelection();
                ddlStaffType.ClearSelection();
                insert.CommandText = "select VolunteerFirstName, VolunteerLastName, lastUpdated, lastUpdatedBy, VolunteerStatus, VolunteerPhoneNumber, VolunteerEmail, VolunteerCategory, Username from Volunteers where VolunteerID = @volunteerID";

                insert.Parameters.AddWithValue("@volunteerID", ddlEducatorName.SelectedItem.Value);
                ddlEducatorStatus.ClearSelection();
                try
                {
                    con.Open();
                    SqlDataReader sdr = insert.ExecuteReader();
                    while (sdr.Read())
                    {
                        txtEducatorFirst.Text = HttpUtility.HtmlEncode(sdr[0].ToString());
                        txtEducatorLast.Text = HttpUtility.HtmlEncode(sdr[1].ToString());
                        txtEducatorEmail.Text = HttpUtility.HtmlEncode(sdr[6].ToString());
                        txtEducatorPhone.Text = HttpUtility.HtmlEncode(sdr[5].ToString());
                        GlobalVars.currentUsername = HttpUtility.HtmlEncode(sdr[8].ToString());

                        //lblLastUpdated.Text = "Last Updated: " + sdr["LastUpdated"].ToString();
                        //lblLastUpdatedBy.Text = "Last Updated By: " + sdr["LastUpdatedBy"].ToString();
                        //ddlEducatorStatus.SelectedItem.Value = sdr[4].ToString();


                        for (int i = 0; i < ddlEducatorStatus.Items.Count; i++)
                        {
                            if (ddlEducatorStatus.Items[i].ToString() == sdr[4].ToString())
                            {
                                ddlEducatorStatus.Items[i].Selected = true;
                            }
                        }

                        string tempState = sdr[7].ToString();
                        switch (tempState)
                        {
                            case "0":
                                ddlStaffType.SelectedValue = "O";
                                break;
                            case "V":
                                ddlStaffType.SelectedValue = "V";
                                break;
                        }

                    }



                    con.Close();
                }
                catch (Exception ex)
                {
                    throw ex;
                }
                break;

        }



        sc.Close();
    }


}