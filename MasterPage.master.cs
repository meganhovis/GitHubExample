using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.IO;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
        String cs = ConfigurationManager.ConnectionStrings["WildTekConnectionString"].ConnectionString;
        sc.ConnectionString = cs;
        sc.Open();

        System.Data.SqlClient.SqlCommand insert = new System.Data.SqlClient.SqlCommand();
        insert.Connection = sc;

        try
        {
            //lblWelcome.Text = "Welcome, " + Session["USER_ID"].ToString() + " ";

        }
        catch
        {
            Session.RemoveAll();
            Response.Redirect("Default.aspx", false);
        }
        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "ModalView", "<script>$function(){ $('#myModal').modal('show');});</script>", false);
        if (!IsPostBack)
        {



            //call read array
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            if (con.State == System.Data.ConnectionState.Open)
            {

                string read = "Select * from Organization";
                string read1 = "Select * from Educators";

                SqlCommand cmd1 = new SqlCommand(read1, con);
                SqlDataReader myRead1 = cmd1.ExecuteReader();

                while (myRead1.Read())
                {

                    ddlEducatorName.Items.Add(new ListItem(myRead1["EducatorFirstName"].ToString(), myRead1["EducatorID"].ToString()));
                }



                SqlCommand cmd = new SqlCommand(read, con);
                SqlDataReader myRead = cmd.ExecuteReader();
                while (myRead.Read())
                {

                    ddlOrganization.Items.Add(new ListItem(myRead["OrgName"].ToString(), myRead["OrgID"].ToString()));
                }

                string read2 = "Select * from Animal";
                SqlCommand cmd2 = new SqlCommand(read2, con);
                SqlDataReader myRead9 = cmd2.ExecuteReader();

                while (myRead9.Read())
                {

                    ddlAnimal.Items.Add(new ListItem(myRead9["AnimalName"].ToString(), myRead9["AnimalID"].ToString()));
                }
                string read3 = "Select * from PaymentRecord";

                SqlCommand cmd3 = new SqlCommand(read3, con);

                SqlDataReader myRead3 = cmd3.ExecuteReader();

                //ddlInvoiceNumber.Items.Add(new ListItem("--Select Invoice Number--", "0"));

                while (myRead3.Read())

                {

                    ddlInvoiceNumber.Items.Add(new ListItem(myRead3["Invoice"].ToString(), myRead3["PaymentID"].ToString()));

                }

                //string read10 = "select * from programtype pt inner join program p on pt.programtypeid = p.programtypeid inner join paymentrecord r on p.paymentid = r.paymentid";
                //SqlCommand cmd10 = new SqlCommand(read10, con);
                //SqlDataReader myRead10 = cmd10.ExecuteReader();

                //while (myRead10.Read())
                //{

                //    ddlProgramName.Items.Add(new ListItem(myRead9["programName"].ToString(), myRead9["programTypeID"].ToString()));
                //}
                //string read12 = "Select * from organization o inner join program p on o.orgid = p.orgid inner join paymentrecord r on p.paymentid = r.paymentid";
                //SqlCommand cmd12 = new SqlCommand(read12, con);
                //SqlDataReader myRead12 = cmd12.ExecuteReader();

                //while (myRead12.Read())
                //{

                //    ddlOrganizationName.Items.Add(new ListItem(myRead12["OrganizationName"].ToString(), myRead12["OrgID"].ToString()));
                //}
                ddlOrganization.DataBind();
                ddlEducatorName.DataBind();
                ddlAnimal.DataBind();
                ddlOrganization.DataBind();
                ddlProgramThemeName.DataBind();




                ////call read array
                //SqlConnection conAnimal = new SqlConnection(cs);
                //conAnimal.Open();
                //if (conAnimal.State == System.Data.ConnectionState.Open)
                //{
                //    string animalRead = "Select * from Animal";
                //    SqlCommand animalcmd = new SqlCommand(animalRead, conAnimal);
                //    SqlDataReader myAnimalRead = animalcmd.ExecuteReader();

                //    while (myAnimalRead.Read())
                //    {
                //        ddlAnimal.Items.Add(new ListItem(myRead["AnimalName"].ToString(), myRead["AnimalID"].ToString()));
                //    }
                //    // ddlAnimal.DataBind();
                //}
                con.Close();
            }
            con.Close();
            //call read array
            SqlConnection conAnimal = new SqlConnection(cs);
            conAnimal.Open();
            if (conAnimal.State == System.Data.ConnectionState.Open)
            {
                string read = "Select * from Animal";
                SqlCommand cmd = new SqlCommand(read, conAnimal);
                SqlDataReader myRead = cmd.ExecuteReader();

                while (myRead.Read())
                {
                    ddlAnimal.Items.Add(new ListItem(myRead["AnimalName"].ToString(), myRead["AnimalID"].ToString()));
                }
                // ddlAnimal.DataBind();
            }



            //call read array
            con.Open();
            if (con.State == System.Data.ConnectionState.Open)
            {

                string read = "Select * from Volunteers";
                SqlCommand cmd = new SqlCommand(read, con);
                SqlDataReader myRead = cmd.ExecuteReader();

                while (myRead.Read())
                {
                    ddlVolunteerName.Items.Add(new ListItem(myRead["VolunteerFirstName"].ToString() + " " + myRead["VolunteerLastName"].ToString(), myRead["VolunteerID"].ToString()));
                }
            }
            con.Close();
        }





    }
    // THIS COMMENT BLOCK IS FROM GG-Style
    /*
     protected void ddlOrganization_SelectedIndexChanged1(object sender, EventArgs e)
     {
         System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
         // sc.ConnectionString = @"Server=localhost;Database=WildTek;Trusted_Connection=Yes;";
         String cs = ConfigurationManager.ConnectionStrings["WildTekConnectionString"].ConnectionString;
         sc.ConnectionString = cs;
         sc.Open();
         System.Data.SqlClient.SqlCommand insert = new System.Data.SqlClient.SqlCommand();
         System.Data.SqlClient.SqlCommand pullContactName = new System.Data.SqlClient.SqlCommand();
         insert.Connection = sc;
         pullContactName.Connection = sc;
         insert.Parameters.Clear();
         pullContactName.Parameters.Clear();
         ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "ModalView", "<script>$function(){ $('#myModal').modal('show');});</script>", false);
         //call read array
         SqlConnection con = new SqlConnection(cs);
         insert.CommandText = "select OrgName, City, County, StreetAddress, PostalCode from Organization where" +
                           " OrgID = @OrgID";
         insert.Parameters.AddWithValue("@OrgID", ddlOrganization.SelectedItem.Value);
         pullContactName.CommandText = "select ContactID, ContactFirstName + ' ' + ContactLastName as 'Contact Name' from ContactInformation where" +
           " OrgID = @OrgID";
         pullContactName.Parameters.AddWithValue("@OrgID", ddlOrganization.SelectedItem.Value);
         SqlDataReader readContacts = pullContactName.ExecuteReader();
         ddlContacts.Items.Clear();
         ddlContacts.Items.Add(new ListItem("--Select Primary Contact--", "0"));
         while (readContacts.Read())
         {
             ddlContacts.Items.Add(new ListItem(readContacts["Contact Name"].ToString(), readContacts["ContactID"].ToString()));
         }
         try
         {
             con.Open();
             SqlDataReader sdr = insert.ExecuteReader();
             while (sdr.Read())
             {
                 txtOrgName.Text = HttpUtility.HtmlEncode(sdr[0].ToString());
                 txtCity.Text = HttpUtility.HtmlEncode(sdr[1].ToString());
                 txtCounty.Text = HttpUtility.HtmlEncode(sdr[2].ToString());
                 txtStreetAddress2.Text = HttpUtility.HtmlEncode(sdr[3].ToString());
                 txtPostalCode2.Text = HttpUtility.HtmlEncode(sdr[4].ToString());
                 //txtContactFirstName2.Text = HttpUtility.HtmlEncode(sdr[5].ToString());
                 //txtContactLastName2.Text = HttpUtility.HtmlEncode(sdr[6].ToString());
                 //txtPhoneNumber2.Text = HttpUtility.HtmlEncode(sdr[7].ToString());
                 //txtEmail2.Text = HttpUtility.HtmlEncode(sdr[8].ToString());
                 //txtSecondaryEmail2.Text = HttpUtility.HtmlEncode(sdr[9].ToString());
                 //lblLastUpdated.Text = "Last Updated: " + sdr["LastUpdated"].ToString();
                 // lblLastUpdatedBy.Text = "Last Updated By: " + sdr["LastUpdatedBy"].ToString();
             }
             System.Data.SqlClient.SqlCommand selectContact = new System.Data.SqlClient.SqlCommand();
             selectContact.Connection = sc;
             selectContact.Parameters.Clear();
             selectContact.CommandText = "SELECT ContactFirstName + ' ' + ContactLastName as 'Contact Name' From ContactInformation WHERE PrimaryContact = 'Y' and OrgID = @OrgID";
             selectContact.Parameters.AddWithValue("@OrgID", ddlOrganization.SelectedItem.Value);
             String tempContact = (String)selectContact.ExecuteScalar();
             ddlContacts.ClearSelection();
             for (int i = 0; i < ddlContacts.Items.Count; i++)
             {
                 if (ddlContacts.Items[i].Text == tempContact)
                 {
                     ddlContacts.Items[i].Selected = true;
                 }
             }
             System.Data.SqlClient.SqlCommand selectState = new System.Data.SqlClient.SqlCommand();
             selectState.Connection = sc;
             selectState.Parameters.Clear();
             selectState.CommandText = "SELECT State From Organization WHERE OrgID = @OrgID";
             selectState.Parameters.AddWithValue("@OrgID", ddlOrganization.SelectedItem.Value);
             String tempState = (String)selectState.ExecuteScalar();
             ddlState2.ClearSelection();
             for (int i = 0; i < ddlState2.Items.Count; i++)
             {
                 if (ddlState2.Items[i].Value == tempState)
                 {
                     ddlState2.Items[i].Selected = true;
                 }
             }
             con.Close();
         }
         catch (Exception ex)
         {
             throw ex;
         }
         sc.Close();
     } */

    protected void btnUpdatePayment_Click(object sender, EventArgs e)

    {

        System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();

        // sc.ConnectionString = @"Server=localhost;Database=WildTek;Trusted_Connection=Yes;";

        String cs = ConfigurationManager.ConnectionStrings["WildTekConnectionString"].ConnectionString;

        sc.ConnectionString = cs;

        sc.Open();

        System.Data.SqlClient.SqlCommand update = new System.Data.SqlClient.SqlCommand();

        update.Connection = sc;

        SqlConnection con = new SqlConnection(cs);

        con.Open();

        update.CommandText = "update PaymentRecord set PaymentAmount = @PaymentAmount, PaymentDate = @PaymentDate,  CheckNumber = @CheckNumber, PaymentType = @PaymentType, Paid = @Paid, CancelledInvoices = @CancelledInvoices," +
            " lastUpdated = @lastUpdated, lastUpdatedBy = @lastUpdatedBy where PaymentID = @PaymentID";

        update.Parameters.AddWithValue("@PaymentID", ddlInvoiceNumber.SelectedItem.Value);
        update.Parameters.AddWithValue("@PaymentDate", txtPaymentDate.Text);
        //update.Parameters.AddWithValue("@ProgramName", ddlProgramName.SelectedItem.Value);
        //update.Parameters.AddWithValue("@OrgnizationName", ddlOrganizationName.SelectedItem.Value);
        update.Parameters.AddWithValue("@PaymentAmount", txtPaymentAmount.Text);
        update.Parameters.AddWithValue("@PaymentType", ddlPaymentType.Text);
        update.Parameters.AddWithValue("@CheckNumber", txtCheckNumber.Text);

        update.Parameters.AddWithValue("@Paid", ddlPaid.SelectedItem.Value);
        update.Parameters.AddWithValue("@CancelledInvoices", ddlCancelledInvoices.SelectedItem.Value);
        update.Parameters.AddWithValue("@lastUpdated", DateTime.Today);
        update.Parameters.AddWithValue("@lastUpdatedBy", HttpUtility.HtmlEncode(Session["USER_ID"]));

        update.ExecuteNonQuery();

        string read4 = "Select * from PaymentRecord";

        SqlCommand cmd4 = new SqlCommand(read4, con);

        SqlDataReader myRead4 = cmd4.ExecuteReader();



        ddlInvoiceNumber.Items.Add(new ListItem("--Select Invoice Number--", "0"));

        while (myRead4.Read())

        {

            ddlInvoiceNumber.Items.Add(new ListItem(myRead4["Invoice"].ToString(), myRead4["PaymentID"].ToString()));

        }
        ddlInvoiceNumber.DataBind();
        sc.Close();
        con.Close();

        ddlInvoiceNumber.ClearSelection();
        txtPaymentDate.Text = "";
        txtPaymentAmount.Text = "";
        ddlPaymentType.ClearSelection();
        txtCheckNumber.Text = "";
        ddlPaid.ClearSelection();
        ddlCancelledInvoices.ClearSelection();

    }
    protected void ddlInvoiceNumber_SelectedIndexChanged(object sender, EventArgs e)
    {
        System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
        // sc.ConnectionString = @"Server=localhost;Database=WildTek;Trusted_Connection=Yes;";
        String cs = ConfigurationManager.ConnectionStrings["WildTekConnectionString"].ConnectionString;
        sc.ConnectionString = cs;
        sc.Open();

        System.Data.SqlClient.SqlCommand insert = new System.Data.SqlClient.SqlCommand();
        insert.Connection = sc;
        insert.Parameters.Clear();


        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "ModalView", "<script>$function(){ $('#myModal').modal('show');});</script>", false);

        //call read array
        SqlConnection con = new SqlConnection(cs);

        insert.CommandText = "select convert(varchar, PaymentDate,101) as PaymentDate, PaymentAmount, CheckNumber from PaymentRecord where" +
                          " PaymentID = @PaymentID";

        insert.Parameters.AddWithValue("@PaymentID", ddlInvoiceNumber.SelectedItem.Value);

        try
        {
            con.Open();
            SqlDataReader sdr = insert.ExecuteReader();
            while (sdr.Read())
            {
                txtPaymentDate.Text = HttpUtility.HtmlEncode(sdr[0].ToString());
                txtPaymentAmount.Text = HttpUtility.HtmlEncode(sdr[1].ToString());
                txtCheckNumber.Text = HttpUtility.HtmlEncode(sdr[2].ToString());
            }
            System.Data.SqlClient.SqlCommand selection = new System.Data.SqlClient.SqlCommand();
            selection.Connection = sc;

            selection.Parameters.Clear();

            selection.CommandText = "select paymentType from PaymentRecord where PaymentID = @PaymentID";
            selection.Parameters.AddWithValue("@PaymentID", ddlInvoiceNumber.SelectedItem.Value);
            String tempState = (String)selection.ExecuteScalar();

            ddlPaymentType.ClearSelection();
            for (int i = 0; i < ddlPaymentType.Items.Count; i++)
            {
                if (ddlPaymentType.Items[i].Value == tempState)
                {
                    ddlPaymentType.Items[i].Selected = true;
                }
            }





            ddlProgramName.Items.Clear();
            //program category
            string read3 = "select * from programtype";
            //selection.Parameters.AddWithValue("@PaymentID", ddlInvoiceNumber.SelectedItem.Value);
            SqlCommand cmd3 = new SqlCommand(read3, con);
            SqlDataReader myRead3 = cmd3.ExecuteReader();
            String tempState7 = (String)selection.ExecuteScalar();
            // ddlProgramName.Items.Add("-- Program Name --");
            while (myRead3.Read())
            {

                ddlProgramName.Items.Add(new ListItem(myRead3["ProgramName"].ToString(), myRead3["ProgramTypeID"].ToString()));

            }
            ddlProgramName.ClearSelection();

            for (int i = 0; i < ddlProgramName.Items.Count; i++)
            {
                if (ddlProgramName.Items[i].Value == tempState7)
                {
                    ddlProgramName.Items[i].Selected = true;
                }
            }





            ddlOrganizationName.Items.Clear();
            ////program category
            string read4 = "select * from organization";
            // selection.Parameters.AddWithValue("@PaymentID", ddlInvoiceNumber.SelectedItem.Value);
            SqlCommand cmd4 = new SqlCommand(read4, con);
            SqlDataReader myRead4 = cmd4.ExecuteReader();
            String tempState8 = (String)selection.ExecuteScalar();
            //// ddlProgramName.Items.Add("-- Program Name --");
            while (myRead4.Read())
            {

                ddlOrganizationName.Items.Add(new ListItem(myRead4["OrgName"].ToString(), myRead4["OrgID"].ToString()));

            }
            ddlOrganizationName.ClearSelection();
            for (int i = 0; i < ddlOrganizationName.Items.Count; i++)
            {
                if (ddlOrganizationName.Items[i].Value == tempState8)
                {
                    ddlOrganizationName.Items[i].Selected = true;
                }
            }



            System.Data.SqlClient.SqlCommand selection2 = new System.Data.SqlClient.SqlCommand();
            selection2.Connection = sc;

            selection2.Parameters.Clear();
            selection2.CommandText = "select Paid from PaymentRecord where PaymentID = @PaymentID";
            selection2.Parameters.AddWithValue("@PaymentID", ddlInvoiceNumber.SelectedItem.Value);
            String tempState2 = (String)selection2.ExecuteScalar();
            ddlPaid.ClearSelection();
            for (int i = 0; i < ddlPaid.Items.Count; i++)
            {
                if (ddlPaid.Items[i].Value == tempState2)
                {
                    ddlPaid.Items[i].Selected = true;
                }
            }

            System.Data.SqlClient.SqlCommand selection3 = new System.Data.SqlClient.SqlCommand();
            selection3.Connection = sc;

            selection3.Parameters.Clear();
            selection3.CommandText = "select  CancelledInvoices from PaymentRecord where PaymentID = @PaymentID";
            selection3.Parameters.AddWithValue("@PaymentID", ddlInvoiceNumber.SelectedItem.Value);
            String tempState3 = (String)selection3.ExecuteScalar();
            ddlCancelledInvoices.ClearSelection();
            for (int i = 0; i < ddlCancelledInvoices.Items.Count; i++)
            {
                if (ddlCancelledInvoices.Items[i].Value == tempState3)
                {
                    ddlCancelledInvoices.Items[i].Selected = true;
                }
            }

            con.Close();
        }

        catch (Exception ex)
        {
            throw ex;
        }
        sc.Close();
    }
    protected void btnUpdateOrganization_Click(object sender, EventArgs e)
    {
        System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
        // sc.ConnectionString = @"Server=localhost;Database=WildTek;Trusted_Connection=Yes;";
        String cs = ConfigurationManager.ConnectionStrings["WildTekConnectionString"].ConnectionString;
        sc.ConnectionString = cs;
        sc.Open();

        System.Data.SqlClient.SqlCommand update = new System.Data.SqlClient.SqlCommand();
        update.Connection = sc;
        SqlConnection con = new SqlConnection(cs);

        System.Data.SqlClient.SqlCommand updatePrimaryContact = new System.Data.SqlClient.SqlCommand();
        updatePrimaryContact.Connection = sc;

        System.Data.SqlClient.SqlCommand updateContact = new System.Data.SqlClient.SqlCommand();
        updateContact.Connection = sc;

        update.CommandText = "update organization set orgName = @orgName, city = @city, county = @county, lastUpdated = @lastUpdated, lastUpdatedBy = @lastUpdatedBy, streetAddress = @streetAddress, state = @state, postalCode = @postalCode where orgID = @orgID";
        update.Parameters.AddWithValue("@orgName", txtOrgName.Text);
        update.Parameters.AddWithValue("@city", txtCity.Text);
        update.Parameters.AddWithValue("@county", txtCounty.Text);
        update.Parameters.AddWithValue("@orgID", ddlOrganization.SelectedItem.Value);
        update.Parameters.AddWithValue("@lastUpdated", DateTime.Today);
        update.Parameters.AddWithValue("@lastUpdatedBy", HttpUtility.HtmlEncode(Session["USER_ID"]));
        update.Parameters.AddWithValue("@streetAddress", txtStreetAddress2.Text);
        update.Parameters.AddWithValue("@state", ddlState2.SelectedItem.Value);
        update.Parameters.AddWithValue("@postalCode", txtPostalCode2.Text);
        //update.Parameters.AddWithValue("@contactFirstName", txtContactFirstName2.Text);
        //update.Parameters.AddWithValue("@contactLastName", txtContactLastName2.Text);
        //update.Parameters.AddWithValue("@phoneNumber", txtPhoneNumber2.Text);
        //update.Parameters.AddWithValue("@email", txtEmail2.Text);
        //update.Parameters.AddWithValue("@secondaryEmail", txtSecondaryEmail2.Text);
        update.ExecuteNonQuery();

        updatePrimaryContact.Parameters.Clear();
        updatePrimaryContact.CommandText = "update ContactInformation set PrimaryContact='N' where OrgID = @orgID";
        updatePrimaryContact.Parameters.AddWithValue("@orgID", ddlOrganization.SelectedItem.Value);
        updatePrimaryContact.ExecuteNonQuery();

        updateContact.Parameters.Clear();
        updateContact.CommandText = "update ContactInformation set PrimaryContact='Y' where ContactID = @contactID";
        updateContact.Parameters.AddWithValue("@contactID", ddlContacts.SelectedValue);
        updateContact.ExecuteNonQuery();

        // lblLastUpdated.Text = "Last Updated: " + DateTime.Today;
        // lblLastUpdatedBy.Text = "Last Updated By: " + "WildTek Developers";

        string read = "Select * from Organization";
        SqlCommand cmd = new SqlCommand(read, sc);
        SqlDataReader myRead = cmd.ExecuteReader();

        ddlOrganization.Items.Clear();
        ddlOrganization.Items.Add(new ListItem("--Select Organization--", "0"));
        while (myRead.Read())
        {
            ddlOrganization.Items.Add(new ListItem(myRead["OrgName"].ToString(), myRead["OrgID"].ToString()));
        }
        ddlOrganization.DataBind();

        txtOrgName.Text = "";
        txtCity.Text = "";
        txtCounty.Text = "";
        txtStreetAddress2.Text = "";
        ddlState2.SelectedIndex = 0;
        ddlOrganization.SelectedIndex = 0;
        txtPostalCode2.Text = "";
        ddlContacts.ClearSelection();
        //txtContactFirstName.Text = "";
        //txtContactLastName.Text = "";
        //txtPhoneNumber.Text = "";
        //txtEmail.Text = "";
        //txtSecondaryEmail.Text = "";

        sc.Close();
    }


    protected void btnAddProgramType_Click(object sender, EventArgs e)
    {
        System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();

        // sc.ConnectionString = @"Server=localhost;Database=WildTek;Trusted_Connection=Yes;";

        String cs = ConfigurationManager.ConnectionStrings["WildTekConnectionString"].ConnectionString;
        sc.ConnectionString = cs;
        System.Data.SqlClient.SqlCommand insert = new System.Data.SqlClient.SqlCommand();


        sc.Open();
        insert.Connection = sc;

        String programName = txtProgramName.Text;
        DateTime lastUpdated = DateTime.Today;
        String lastUpdatedBy = HttpUtility.HtmlEncode(Session["USER_ID"]);

        String category = ddlThemeCategory.SelectedValue;

        if (category.Equals("Online Program"))
        {
            ProgramType newProgram = new ProgramType(programName);
            insert.CommandText = "insert into OnlineProgramType (onlineProgramTypeName, lastUpdated, lastUpdatedBy, status) values (@onlineProgramTypeName, @lastUpdated, @lastUpdatedBy, @status)";
            insert.Parameters.AddWithValue("@onlineProgramTypeName", newProgram.getProgramName());
            insert.Parameters.AddWithValue("@lastUpdated", lastUpdated);
            insert.Parameters.AddWithValue("@lastUpdatedBy", lastUpdatedBy);
            insert.Parameters.AddWithValue("@status", "Active");
            insert.ExecuteNonQuery();
        }

        else
        {
            ProgramType newProgram = new ProgramType(programName);
            insert.CommandText = "insert into ProgramType (programName, lastUpdated, lastUpdatedBy, status) values (@programName, @lastUpdated, @lastUpdatedBy, @status)";
            insert.Parameters.AddWithValue("@programName", newProgram.getProgramName());
            insert.Parameters.AddWithValue("@lastUpdated", lastUpdated);
            insert.Parameters.AddWithValue("@lastUpdatedBy", lastUpdatedBy);
            insert.Parameters.AddWithValue("@status", "Active");
            insert.ExecuteNonQuery();
        }



        //  lblLastUpdated.Text = "Last Updated: " + lastUpdated;
        //  lblLastUpdatedBy.Text = "Last Updated By: " + lastUpdatedBy;
        sc.Close();
    }

    protected void btnAddOrg_Click(object sender, EventArgs e)
    {
        System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();

        // sc.ConnectionString = @"Server=localhost;Database=WildTek;Trusted_Connection=Yes;";

        String cs = ConfigurationManager.ConnectionStrings["WildTekConnectionString"].ConnectionString;
        sc.ConnectionString = cs;
        System.Data.SqlClient.SqlCommand insert = new System.Data.SqlClient.SqlCommand();

        System.Data.SqlClient.SqlCommand insertContact = new System.Data.SqlClient.SqlCommand();

        System.Data.SqlClient.SqlCommand pullOrgID = new System.Data.SqlClient.SqlCommand();


        sc.Open();
        insert.Connection = sc;
        insertContact.Connection = sc;
        pullOrgID.Connection = sc;

        String orgName = textOrgName.Text;
        //String city = textOrgCity.Text;
        String county = textOrgCounty.Text;
        //String streetAddress = txtStreetAddress.Text;
        // String state = ddlState.SelectedValue; ;
        //String postalCode = txtPostalCode.Text;
        String contactFirstName = txtContactFirstName.Text;
        String contactLastName = txtContactLastName.Text;
        //String phoneNumber = txtPhoneNumber.Text;
        String email = txtEmail.Text;
        //String secondaryEmail = txtSecondaryEmail.Text;
        DateTime lastUpdated = DateTime.Today;
        String lastUpdatedBy = HttpUtility.HtmlEncode(Session["USER_ID"]);

        //String lastUpdatedBy = "WildTekDevs";
        var hiddenValue = hiddenControl.Value;
        var hiddenCity1 = hiddenCity.Value;
        var hiddenState1 = hiddenState.Value;
        var hiddenZip1 = hiddenZip.Value;

        Organization newOrg = new Organization(orgName, hiddenCity1, county, hiddenValue, hiddenState1, hiddenZip1);
        insert.CommandText = "insert into Organization (orgName, city, county, lastUpdated, lastUpdatedBy, streetAddress, state, postalCode) values (@orgName, @city, @county, @lastUpdated, @lastUpdatedBy, @streetAddress, @state, @postalCode)";
        insert.Parameters.AddWithValue("@orgName", newOrg.getOrgName());
        insert.Parameters.AddWithValue("@city", hiddenCity1);
        insert.Parameters.AddWithValue("@county", newOrg.getCounty());
        insert.Parameters.AddWithValue("@lastUpdated", lastUpdated);
        insert.Parameters.AddWithValue("@lastUpdatedBy", lastUpdatedBy);
        insert.Parameters.AddWithValue("@streetAddress", hiddenValue);
        insert.Parameters.AddWithValue("@state", hiddenState1);
        insert.Parameters.AddWithValue("@postalCode", hiddenZip1);
        //insert.Parameters.AddWithValue("@contactFirstName", newOrg.getContactFirstName());
        //insert.Parameters.AddWithValue("@contactLastName", newOrg.getContactLastName());
        //insert.Parameters.AddWithValue("@phoneNumber", newOrg.getPhoneNumber());
        //insert.Parameters.AddWithValue("@email", newOrg.getEmail());
        //insert.Parameters.AddWithValue("@secondaryEmail", newOrg.getSecondaryEmail());


        insert.ExecuteNonQuery();

        pullOrgID.Parameters.Clear();
        pullOrgID.CommandText = "SELECT MAX(OrgID) From Organization";

        int tempOrgID = (int)pullOrgID.ExecuteScalar();

        insertContact.CommandText = "insert into ContactInformation (contactFirstName, contactLastName, contactEmail, PrimaryContact, OrgID, LastUpdated, LastUpdatedBy) values (@contactFN, @contactLN, @contactEmail, @primaryContact, @OrgID, @LastUpdated, @LastUpdatedBy)";
        insertContact.Parameters.AddWithValue("@contactFN", contactFirstName);
        insertContact.Parameters.AddWithValue("@contactLN", contactLastName);
        insertContact.Parameters.AddWithValue("@contactEmail", email);
        insertContact.Parameters.AddWithValue("@PrimaryContact", "Y");
        insertContact.Parameters.AddWithValue("@OrgID", tempOrgID);
        insertContact.Parameters.AddWithValue("@LastUpdated", lastUpdated);
        insertContact.Parameters.AddWithValue("@LastUpdatedBy", lastUpdatedBy);
        insertContact.ExecuteNonQuery();

        //lblLastUpdated.Text = "Last Updated: " + lastUpdated;
        //lblLastUpdatedBy.Text = "Last Updated By: " + lastUpdatedBy;
        string read = "Select * from Organization";
        SqlCommand cmd = new SqlCommand(read, sc);
        SqlDataReader myRead = cmd.ExecuteReader();

        ddlOrganization.Items.Clear();
        ddlOrganization.Items.Add(new ListItem("--Select Organization--", "0"));
        while (myRead.Read())
        {
            ddlOrganization.Items.Add(new ListItem(myRead["OrgName"].ToString(), myRead["OrgID"].ToString()));
        }
        ddlOrganization.DataBind();


        textOrgName.Text = "";
        //textOrgCity.Text = "";
        textOrgCounty.Text = "";
        //txtStreetAddress.Text = "";
        //ddlState.SelectedIndex = 0;
        ddlOrganization.SelectedIndex = 0;
        // txtPostalCode.Text = "";
        txtContactFirstName.Text = "";
        txtContactLastName.Text = "";
        //txtPhoneNumber.Text = "";
        txtEmail.Text = "";
        //txtSecondaryEmail.Text = "";

        sc.Close();

    }

    protected void btnAddAnimal_Click(object sender, EventArgs e)
    {
        System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();

        // sc.ConnectionString = @"Server=localhost;Database=WildTek;Trusted_Connection=Yes;";

        String cs = ConfigurationManager.ConnectionStrings["WildTekConnectionString"].ConnectionString;
        sc.ConnectionString = cs;
        System.Data.SqlClient.SqlCommand insert = new System.Data.SqlClient.SqlCommand();
        System.Data.SqlClient.SqlCommand retrieveImage = new System.Data.SqlClient.SqlCommand();

        sc.Open();
        insert.Connection = sc;
        retrieveImage.Connection = sc;

        String animalType = ddlAnimalType.SelectedItem.Text;
        String animalName = txtAnimalName.Text;
        DateTime lastUpdated = DateTime.Today;
        String lastUpdatedBy = HttpUtility.HtmlEncode(Session["USER_ID"]);


        Animal newAnimal = new Animal(animalType, animalName);
        string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
        using (Stream fs = FileUpload1.PostedFile.InputStream)
        {
            using (BinaryReader br = new BinaryReader(fs))
            {
                byte[] bytes = br.ReadBytes((Int32)fs.Length);

                insert.CommandText = "Insert into Animal (animalType, animalName, lastUpdated, lastUpdatedBy, status) values (@animalType, @animalName, @lastUpdated, @lastUpdatedBy, @status, @animalImage)";
                insert.Parameters.AddWithValue("@animalType", newAnimal.getAnimalType());
                insert.Parameters.AddWithValue("@animalName", newAnimal.getAnimalName());
                insert.Parameters.AddWithValue("@lastUpdated", lastUpdated);
                insert.Parameters.AddWithValue("@lastUpdatedBy", lastUpdatedBy);
                insert.Parameters.AddWithValue("@status", ddlStatus.SelectedItem.Text);
                insert.Parameters.AddWithValue("@animalImage", bytes);

                insert.ExecuteNonQuery();
            }
        }
        lblLastUpdated.Text = "Last Updated: " + HttpUtility.HtmlEncode(lastUpdated);

        lblLastUpdatedBy.Text = "Last Updated By: " + HttpUtility.HtmlEncode(lastUpdatedBy);

        txtAnimalName.Text = "";
        //gridAnimalMammal.DataBind();
        //gridReptile.DataBind();
        //gridBird.DataBind();
        sc.Close();

    }
    public System.Drawing.Image ByteArrayToImage(byte[] byteArrayIn)
    {
        using (var ms = new MemoryStream(byteArrayIn))
        {
            return System.Drawing.Image.FromStream(ms);
        }
    }


    protected void btnAddEducator_Click(object sender, EventArgs e)
    {
        System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();

        // sc.ConnectionString = @"Server=localhost;Database=WildTek;Trusted_Connection=Yes;";

        String cs = ConfigurationManager.ConnectionStrings["WildTekConnectionString"].ConnectionString;
        sc.ConnectionString = cs;
        System.Data.SqlClient.SqlCommand insert = new System.Data.SqlClient.SqlCommand();


        sc.Open();
        insert.Connection = sc;

        String firstName = txtEducatorFirstName.Text;
        String lastName = txtEducatorLastName.Text;

        DateTime lastUpdated = DateTime.Today;
        String lastUpdatedBy = HttpUtility.HtmlEncode(Session["USER_ID"]);




        insert.CommandText = "insert into Educators (educatorFirstName, educatorLastName, lastUpdated, lastUpdatedBy, status) values (@firstName, @lastName, @lastUpdated, @lastUpdatedBy, @status)";
        insert.Parameters.AddWithValue("@firstName", firstName);
        insert.Parameters.AddWithValue("@lastName", lastName);
        insert.Parameters.AddWithValue("@lastUpdated", lastUpdated);
        insert.Parameters.AddWithValue("@lastUpdatedBy", lastUpdatedBy);
        insert.Parameters.AddWithValue("@status", "Active");
        insert.ExecuteNonQuery();

        //lblLastUpdated.Text = "Last Updated: " + lastUpdated;
        //lblLastUpdatedBy.Text = "Last Updated By: " + lastUpdatedBy;

        txtEducatorFirstName.Text = "";
        txtEducatorLastName.Text = "";
        //txtEducatorEmail.Text = "";
        //txtEducatorPhone.Text = "";

        ddlEducatorName.Items.Clear();
        string read1 = "Select * from Educators";
        SqlCommand cmd1 = new SqlCommand(read1, sc);
        SqlDataReader myRead1 = cmd1.ExecuteReader();

        ddlEducatorName.Items.Add(new ListItem("--Select Educator--", "0"));
        while (myRead1.Read())
        {
            ddlEducatorName.Items.Add(new ListItem(myRead1["EducatorFirstName"].ToString(), myRead1["EducatorID"].ToString()));
        }
        sc.Close();
    }


    protected void btnUpdateAnimal_Click(object sender, EventArgs e)
    {
        System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
        // sc.ConnectionString = @"Server=localhost;Database=WildTek;Trusted_Connection=Yes;";
        String cs = ConfigurationManager.ConnectionStrings["WildTekConnectionString"].ConnectionString;
        sc.ConnectionString = cs;
        sc.Open();

        System.Data.SqlClient.SqlCommand update = new System.Data.SqlClient.SqlCommand();
        update.Connection = sc;
        SqlConnection con = new SqlConnection(cs);

        update.CommandText = "update animal set animalType = @animalType, animalName = @animalName, lastUpdated = @lastUpdated, lastUpdatedBy = @lastUpdatedBy, status = @status where animalID = @animalID";
        update.Parameters.AddWithValue("@animalType", ddlAnimalTypeEdit.SelectedItem.Text);
        update.Parameters.AddWithValue("@animalName", txtBoxAnimalName.Text);
        update.Parameters.AddWithValue("@animalID", ddlAnimal.SelectedItem.Value);
        update.Parameters.AddWithValue("@lastUpdated", DateTime.Today);
        update.Parameters.AddWithValue("@lastUpdatedBy", HttpUtility.HtmlEncode(Session["USER_ID"]));
        update.Parameters.AddWithValue("@status", ddlAnimalStatus.SelectedItem.Text);
        update.ExecuteNonQuery();


        System.Data.SqlClient.SqlCommand insert = new System.Data.SqlClient.SqlCommand();
        SqlConnection con2 = new SqlConnection(cs);

        ddlAnimal.Items.Clear();
        //call read array
        con.Open();
        if (con.State == System.Data.ConnectionState.Open)
        {

            string read = "Select * from Animal";
            SqlCommand cmd = new SqlCommand(read, con);
            SqlDataReader myRead = cmd.ExecuteReader();

            while (myRead.Read())
            {

                ddlAnimal.Items.Add(new ListItem(myRead["AnimalName"].ToString(), myRead["AnimalID"].ToString()));
            }
            // ddlAnimal.DataBind();

        }
        //gridAnimalMammal.DataBind();
        //gridReptile.DataBind();
        //gridBird.DataBind();

        sc.Close();
    }

    protected void ddlAnimal_SelectedIndexChanged1(object sender, EventArgs e)
    {
        // UpdatePanel1.Update();
        AnimalEditDiv.Visible = true;
        System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
        // sc.ConnectionString = @"Server=localhost;Database=WildTek;Trusted_Connection=Yes;";
        String cs = ConfigurationManager.ConnectionStrings["WildTekConnectionString"].ConnectionString;
        sc.ConnectionString = cs;
        sc.Open();

        System.Data.SqlClient.SqlCommand insert = new System.Data.SqlClient.SqlCommand();
        insert.Connection = sc;


        //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "ModalView", "<script>$function(){ $('#EditAnimalModal').modal('show');});</script>", true);


        //call read array
        SqlConnection con = new SqlConnection(cs);

        insert.CommandText = "select AnimalID, AnimalType, AnimalName, LastUpdated, LastUpdatedBy, status from Animal where" +
                          " animalID = @animalID";

        insert.Parameters.AddWithValue("@animalID", ddlAnimal.SelectedItem.Value);

        ddlAnimalTypeEdit.ClearSelection();
        ddlAnimalStatus.ClearSelection();
        try
        {
            con.Open();
            SqlDataReader sdr = insert.ExecuteReader();
            while (sdr.Read())
            {
                for (int i = 0; i < ddlAnimalTypeEdit.Items.Count; i++)
                {
                    if (ddlAnimalTypeEdit.Items[i].ToString() == sdr[1].ToString())
                    {
                        ddlAnimalTypeEdit.Items[i].Selected = true;
                    }
                }
                //ddlAnimalTypeEdit.SelectedItem.Text = sdr[1].ToString();
                //ddlAnimalType.SelectedItem.Text = sdr[1].ToString();
                txtBoxAnimalName.Text = HttpUtility.HtmlEncode(sdr[2].ToString());
                for (int i = 0; i < ddlAnimalStatus.Items.Count; i++)
                {
                    if (ddlAnimalStatus.Items[i].ToString() == sdr[5].ToString())
                    {
                        ddlAnimalStatus.Items[i].Selected = true;
                    }
                }
                //ddlAnimalStatus.Text = sdr[5].ToString();
                //lblLastUpdated.Text = sdr["LastUpdated"].ToString();
                //lblLastUpdatedBy.Text = sdr["LastUpdatedBy"].ToString();

            }
            con.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }
        sc.Close();
    }

    //protected void btnDelete_Click(object sender, EventArgs e)
    //{
    //    System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
    //    // sc.ConnectionString = @"Server=localhost;Database=WildTek;Trusted_Connection=Yes;";
    //    String cs = ConfigurationManager.ConnectionStrings["WildTekConnectionString"].ConnectionString;
    //    sc.ConnectionString = cs;
    //    sc.Open();
    //    System.Data.SqlClient.SqlCommand delete = new System.Data.SqlClient.SqlCommand();
    //    delete.Connection = sc;
    //    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "ModalView", "<script>$function(){ $('#myModal').modal('show');});</script>", false);
    //    //call read array
    //    SqlConnection con = new SqlConnection(cs);
    //    delete.CommandText = "Delete from Animal where AnimalID = @AnimalID";
    //    delete.Parameters.AddWithValue("@AnimalID", ddlAnimal.SelectedItem.Value);
    //    delete.ExecuteNonQuery();
    //    ddlAnimal.Items.Clear();
    //    //call read array
    //    con.Open();
    //    if (con.State == System.Data.ConnectionState.Open)
    //    {
    //        string read = "Select * from Animal";
    //        SqlCommand cmd = new SqlCommand(read, con);
    //        SqlDataReader myRead = cmd.ExecuteReader();
    //        while (myRead.Read())
    //        {
    //            ddlAnimal.Items.Add(new ListItem(myRead["AnimalName"].ToString(), myRead["AnimalID"].ToString()));
    //        }
    //        // ddlAnimal.DataBind();
    //    }
    //    txtAnimalName.Text = "";
    //    //gridAnimalMammal.DataBind();
    //    //gridReptile.DataBind();
    //    //gridBird.DataBind();

    //}

    protected void btnUpdateEducator_Click(object sender, EventArgs e)
    {
        System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
        // sc.ConnectionString = @"Server=localhost;Database=WildTek;Trusted_Connection=Yes;";
        String cs = ConfigurationManager.ConnectionStrings["WildTekConnectionString"].ConnectionString;
        sc.ConnectionString = cs;
        sc.Open();

        System.Data.SqlClient.SqlCommand update = new System.Data.SqlClient.SqlCommand();
        update.Connection = sc;
        SqlConnection con = new SqlConnection(cs);

        update.CommandText = "update Educators set educatorFirstName = @firstName, educatorLastName = @lastName, lastUpdated = @lastUpdated, lastUpdatedBy = @lastUpdatedBy, status = @status where educatorID = @educatorID";
        update.Parameters.AddWithValue("@firstName", txtEducatorFirst.Text);
        update.Parameters.AddWithValue("@lastName", txtEducatorLast.Text);
        update.Parameters.AddWithValue("@educatorID", ddlEducatorName.SelectedItem.Value);
        update.Parameters.AddWithValue("@lastUpdated", DateTime.Today);
        update.Parameters.AddWithValue("@lastUpdatedBy", HttpUtility.HtmlEncode(Session["USER_ID"]));
        update.Parameters.AddWithValue("@status", ddlEducatorStatus.SelectedItem.Value);
        update.ExecuteNonQuery();

        lblLastUpdated.Text = "Last Updated: " + HttpUtility.HtmlEncode(DateTime.Today);
        lblLastUpdatedBy.Text = "Last Updated By: " + HttpUtility.HtmlEncode(Session["USER_ID"]);




        System.Data.SqlClient.SqlCommand insert = new System.Data.SqlClient.SqlCommand();
        SqlConnection con2 = new SqlConnection(cs);

        ddlEducatorName.Items.Clear();
        //call read array
        con.Open();
        if (con.State == System.Data.ConnectionState.Open)
        {

            string read = "Select * from Educators";
            SqlCommand cmd = new SqlCommand(read, con);
            SqlDataReader myRead = cmd.ExecuteReader();

            while (myRead.Read())
            {
                ddlEducatorName.Items.Add(new ListItem(myRead["EducatorFirstName"].ToString() + " " + myRead["EducatorLastName"].ToString(), myRead["EducatorID"].ToString()));
            }


        }

        txtEducatorFirst.Text = "";
        txtEducatorLastName.Text = "";
        string read1 = "Select * from Educators";
        SqlCommand cmd1 = new SqlCommand(read1, con);
        SqlDataReader myRead1 = cmd1.ExecuteReader();

        ddlEducatorName.Items.Clear();
        ddlEducatorName.Items.Add(new ListItem("--Select Educator--", "0"));
        while (myRead1.Read())
        {
            ddlEducatorName.Items.Add(new ListItem(myRead1["EducatorFirstName"].ToString(), myRead1["EducatorID"].ToString()));
        }

        con.Close();
        sc.Close();
    }

    protected void btnDeleteEducator_Click(object sender, EventArgs e)
    {
        System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
        // sc.ConnectionString = @"Server=localhost;Database=WildTek;Trusted_Connection=Yes;";
        String cs = ConfigurationManager.ConnectionStrings["WildTekConnectionString"].ConnectionString;
        sc.ConnectionString = cs;
        sc.Open();

        System.Data.SqlClient.SqlCommand delete = new System.Data.SqlClient.SqlCommand();

        delete.Connection = sc;


        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "ModalView", "<script>$function(){ $('#myModal').modal('show');});</script>", false);

        //call read array
        SqlConnection con = new SqlConnection(cs);
        delete.CommandText = "Delete from Educators where EducatorID = @EducatorID";
        delete.Parameters.AddWithValue("@EducatorID", ddlEducatorName.SelectedItem.Value);

        delete.ExecuteNonQuery();

        ddlEducatorName.Items.Clear();
        //call read array
        con.Open();
        if (con.State == System.Data.ConnectionState.Open)
        {

            string read = "Select * from Educators";
            SqlCommand cmd = new SqlCommand(read, con);
            SqlDataReader myRead = cmd.ExecuteReader();

            ddlEducatorName.Items.Add(new ListItem("--Select Educator--", "0"));
            while (myRead.Read())
            {

                ddlEducatorName.Items.Add(new ListItem(myRead["EducatorFirstName"].ToString(), myRead["EducatorID"].ToString()));
            }


        }
        txtEducatorFirst.Text = "";
        txtEducatorLast.Text = "";
        ddlEducatorName.DataBind();

        con.Close();
        sc.Close();
    }

    protected void ddlEducator_SelectedIndexChanged1(object sender, EventArgs e)
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

        insert.CommandText = "select educatorFirstName, educatorLastName, lastUpdated, lastUpdatedBy, status from Educators where educatorID = @educatorID";

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
                lblLastUpdated.Text = "Last Updated: " + HttpUtility.HtmlEncode(sdr["LastUpdated"].ToString());
                lblLastUpdatedBy.Text = "Last Updated By: " + HttpUtility.HtmlEncode(sdr["LastUpdatedBy"].ToString());
                //ddlEducatorStatus.SelectedItem.Value = sdr[4].ToString();


                for (int i = 0; i < ddlEducatorStatus.Items.Count; i++)
                {
                    if (ddlEducatorStatus.Items[i].ToString() == sdr[4].ToString())
                    {
                        ddlEducatorStatus.Items[i].Selected = true;
                    }
                }
            }
            con.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }

        sc.Close();
    }

    protected void ddlProgramThemeCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
        String cs = ConfigurationManager.ConnectionStrings["WildTekConnectionString"].ConnectionString;
        sc.ConnectionString = cs;
        sc.Open();

        System.Data.SqlClient.SqlCommand insert = new System.Data.SqlClient.SqlCommand();
        insert.Connection = sc;

        SqlConnection con = new SqlConnection(cs);
        con.Open();

        string tempSelection = ddlProgramThemeCategory.SelectedValue.ToString();
        int tempSelect = Int32.Parse(tempSelection);

        txtProgramName.Text = "";
        txtProgramThemeName.Text = "";
        ddlStatus.ClearSelection();

        switch (tempSelect)
        {
            case 1:
                ddlProgramThemeName.Items.Clear();
                //program category
                string read3 = "Select * from ProgramType";
                SqlCommand cmd3 = new SqlCommand(read3, con);
                SqlDataReader myRead3 = cmd3.ExecuteReader();
                ddlProgramThemeName.Items.Add("-- Live Programs --");
                while (myRead3.Read())
                {

                    ddlProgramThemeName.Items.Add(new ListItem(myRead3["ProgramName"].ToString(), myRead3["ProgramTypeID"].ToString()));

                }
                break;

            case 2:
                ddlProgramThemeName.Items.Clear();
                //program category
                string read4 = "Select * from OnlineProgramType";
                SqlCommand cmd4 = new SqlCommand(read4, con);
                SqlDataReader myRead4 = cmd4.ExecuteReader();
                ddlProgramThemeName.Items.Add("-- Online Programs --");

                while (myRead4.Read())
                {

                    ddlProgramThemeName.Items.Add(new ListItem(myRead4["OnlineProgramTypeName"].ToString(), myRead4["OnlineProgramTypeID"].ToString()));

                }
                break;
        }
    }

    protected void ddlProgramThemeName_SelectedIndexChanged(object sender, EventArgs e)
    {
        string ProgramThemeName = ddlProgramThemeName.SelectedValue.ToString();
        ddlProgramThemeName.SelectedIndex = 0;
        string ProgramCategory = ddlProgramThemeName.SelectedValue;
        ddlProgramThemeName.SelectedValue = ProgramThemeName;

        if (ProgramCategory.Equals("-- Live Programs --"))
        {
            updateLiveProgramThemeName(ProgramThemeName);
        }
        else
        {
            updateOnlineThemeName(ProgramThemeName);
        }
    }

    public void updateLiveProgramThemeName(string ProgramThemeName)
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




        insert.CommandText = "select ProgramName, Status from ProgramType where ProgramTypeID = @ProgramTypeID";
        insert.Parameters.AddWithValue("@ProgramTypeID", ddlProgramThemeName.SelectedItem.Value);


        try
        {
            con.Open();
            SqlDataReader sdr = insert.ExecuteReader();
            while (sdr.Read())
            {
                txtProgramThemeName.Text = HttpUtility.HtmlEncode(sdr[0].ToString());
            }

            System.Data.SqlClient.SqlCommand selectStatus = new System.Data.SqlClient.SqlCommand();
            selectStatus.Connection = sc;

            selectStatus.Parameters.Clear();

            selectStatus.CommandText = "SELECT Status From ProgramType WHERE ProgramTypeID = @ProgramTypeID";
            selectStatus.Parameters.AddWithValue("@ProgramTypeID", ddlProgramThemeName.SelectedItem.Value);
            String tempStatus = (String)selectStatus.ExecuteScalar();
            ddlThemeStatus.ClearSelection();
            for (int i = 0; i < ddlThemeStatus.Items.Count; i++)
            {
                if (ddlThemeStatus.Items[i].Value == tempStatus)
                {
                    ddlThemeStatus.Items[i].Selected = true;
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

    public void updateOnlineThemeName(string ProgramThemeName)
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




        insert.CommandText = "select OnlineProgramTypeName, Status from OnlineProgramType where OnlineProgramTypeID = @ProgramTypeID";
        insert.Parameters.AddWithValue("@ProgramTypeID", ddlProgramThemeName.SelectedItem.Value);


        try
        {
            con.Open();
            SqlDataReader sdr = insert.ExecuteReader();
            while (sdr.Read())
            {
                txtProgramThemeName.Text = HttpUtility.HtmlEncode(sdr[0].ToString());
            }

            System.Data.SqlClient.SqlCommand selectStatus = new System.Data.SqlClient.SqlCommand();
            selectStatus.Connection = sc;

            selectStatus.Parameters.Clear();

            selectStatus.CommandText = "SELECT Status From ProgramType WHERE ProgramTypeID = @ProgramTypeID";
            selectStatus.Parameters.AddWithValue("@ProgramTypeID", ddlProgramThemeName.SelectedItem.Value);
            String tempStatus = (String)selectStatus.ExecuteScalar();
            ddlThemeStatus.ClearSelection();
            for (int i = 0; i < ddlThemeStatus.Items.Count; i++)
            {
                if (ddlThemeStatus.Items[i].Value == tempStatus)
                {
                    ddlThemeStatus.Items[i].Selected = true;
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



    protected void btnUpdateProgramType_Click(object sender, EventArgs e)
    {
        string ProgramThemeName = ddlProgramThemeName.SelectedValue.ToString();
        ddlProgramThemeName.SelectedIndex = 0;
        string ProgramCategory = ddlProgramThemeName.SelectedValue;
        ddlProgramThemeName.SelectedValue = ProgramThemeName;

        if (ProgramCategory.Equals("-- Live Programs --"))
        {
            updateLiveProgramType();
        }
        else
        {
            updateOnlineProgramType();
        }
    }

    public void updateLiveProgramType()
    {
        System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
        // sc.ConnectionString = @"Server=localhost;Database=WildTek;Trusted_Connection=Yes;";
        String cs = ConfigurationManager.ConnectionStrings["WildTekConnectionString"].ConnectionString;
        sc.ConnectionString = cs;
        sc.Open();

        System.Data.SqlClient.SqlCommand update = new System.Data.SqlClient.SqlCommand();
        update.Connection = sc;
        SqlConnection con = new SqlConnection(cs);

        update.CommandText = "update ProgramType set ProgramName = @ProgramName, LastUpdated = @LastUpdated, LastUpdatedBy = @LastUpdatedBy, Status = @Status where ProgramTypeID = @ProgramTypeID";
        update.Parameters.AddWithValue("@ProgramName", txtProgramThemeName.Text);
        update.Parameters.AddWithValue("@LastUpdated", DateTime.Today);
        update.Parameters.AddWithValue("@LastUpdatedBy", "WildTek Developers");
        update.Parameters.AddWithValue("@Status", ddlThemeStatus.SelectedItem.Value);
        update.Parameters.AddWithValue("@ProgramTypeID", ddlProgramThemeName.SelectedItem.Value);
        update.ExecuteNonQuery();

        lblLastUpdated.Text = "Last Updated: " + HttpUtility.HtmlEncode(DateTime.Today);
        lblLastUpdatedBy.Text = "Last Updated By: " + HttpUtility.HtmlEncode(Session["USER_ID"]);

        System.Data.SqlClient.SqlCommand insert = new System.Data.SqlClient.SqlCommand();
        SqlConnection con2 = new SqlConnection(cs);

        ddlProgramThemeName.Items.Clear();
        //call read array
        con.Open();
        if (con.State == System.Data.ConnectionState.Open)
        {

            string read = "Select * from ProgramType";
            SqlCommand cmd = new SqlCommand(read, con);
            SqlDataReader myRead = cmd.ExecuteReader();

            while (myRead.Read())
            {
                ddlProgramThemeName.Items.Add(new ListItem(myRead["ProgramName"].ToString()));
            }


        }

        txtProgramThemeName.Text = "";
        ddlProgramThemeName.SelectedIndex = 0;
        ddlThemeStatus.SelectedIndex = 0;

        con.Close();
        sc.Close();
    }


    protected void updateOnlineProgramType()
    {
        System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
        // sc.ConnectionString = @"Server=localhost;Database=WildTek;Trusted_Connection=Yes;";
        String cs = ConfigurationManager.ConnectionStrings["WildTekConnectionString"].ConnectionString;
        sc.ConnectionString = cs;
        sc.Open();

        System.Data.SqlClient.SqlCommand update = new System.Data.SqlClient.SqlCommand();
        update.Connection = sc;
        SqlConnection con = new SqlConnection(cs);

        update.CommandText = "update OnlineProgramType set OnlineProgramTypeName = @ProgramName, LastUpdated = @LastUpdated, LastUpdatedBy = @LastUpdatedBy, Status = @Status where OnlineProgramTypeID = @ProgramTypeID";
        update.Parameters.AddWithValue("@ProgramName", txtProgramThemeName.Text);
        update.Parameters.AddWithValue("@LastUpdated", DateTime.Today);
        update.Parameters.AddWithValue("@LastUpdatedBy", "WildTek Developers");
        update.Parameters.AddWithValue("@Status", ddlThemeStatus.SelectedItem.Value);
        update.Parameters.AddWithValue("@ProgramTypeID", ddlProgramThemeName.SelectedItem.Value);
        update.ExecuteNonQuery();

        lblLastUpdated.Text = "Last Updated: " + HttpUtility.HtmlEncode(DateTime.Today);
        lblLastUpdatedBy.Text = "Last Updated By: " + HttpUtility.HtmlEncode(Session["USER_ID"]);

        System.Data.SqlClient.SqlCommand insert = new System.Data.SqlClient.SqlCommand();
        SqlConnection con2 = new SqlConnection(cs);

        ddlProgramThemeName.Items.Clear();
        //call read array
        con.Open();
        if (con.State == System.Data.ConnectionState.Open)
        {

            string read = "Select * from OnlineProgramType";
            SqlCommand cmd = new SqlCommand(read, con);
            SqlDataReader myRead = cmd.ExecuteReader();

            while (myRead.Read())
            {
                ddlProgramThemeName.Items.Add(new ListItem(myRead["OnlineProgramTypeName"].ToString()));
            }


        }

        txtProgramThemeName.Text = "";
        ddlProgramThemeName.SelectedIndex = 0;
        ddlThemeStatus.SelectedIndex = 0;

        con.Close();
        sc.Close();
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

    //protected void btnDeleteVolunteer_Click(object sender, EventArgs e)
    //{
    //    System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
    //    // sc.ConnectionString = @"Server=localhost;Database=WildTek;Trusted_Connection=Yes;";
    //    String cs = ConfigurationManager.ConnectionStrings["WildTekConnectionString"].ConnectionString;
    //    sc.ConnectionString = cs;
    //    sc.Open();

    //    System.Data.SqlClient.SqlCommand delete = new System.Data.SqlClient.SqlCommand();

    //    delete.Connection = sc;


    //    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "ModalView", "<script>$function(){ $('#myModal').modal('show');});</script>", false);

    //    //call read array
    //    SqlConnection con = new SqlConnection(cs);
    //    delete.CommandText = "Delete from Volunteers where VolunteerID = @VolunteerID";
    //    delete.Parameters.AddWithValue("@VolunteerID", ddlVolunteerName.SelectedItem.Value);

    //    delete.ExecuteNonQuery();

    //    ddlVolunteerName.Items.Clear();
    //    //call read array
    //    con.Open();
    //    if (con.State == System.Data.ConnectionState.Open)
    //    {

    //        string read = "Select * from Volunteers";
    //        SqlCommand cmd = new SqlCommand(read, con);
    //        SqlDataReader myRead = cmd.ExecuteReader();

    //        while (myRead.Read())
    //        {

    //            ddlVolunteerName.Items.Add(new ListItem(myRead["VolunteerFirstName"].ToString(), myRead["VolunteerID"].ToString()));
    //        }


    //    }
    //    txtVolunteerFirstName.Text = "";
    //    txtVolunteerLastName.Text = "";
    //    txtVolunteerAddPhoneNumber.Text = "";
    //    txtVoluteerAddEmail.Text = "";
    //    ddlVolunteerAddStatus.SelectedIndex = 0;
    //    ddlVolunteerName.Items.Clear();
    //    //call read array
    //    if (sc.State == System.Data.ConnectionState.Open)
    //    {

    //        string read = "Select * from Volunteers";
    //        SqlCommand cmd = new SqlCommand(read, sc);
    //        SqlDataReader myRead = cmd.ExecuteReader();

    //        ddlVolunteerName.Items.Add(new ListItem("--Select Volunteer--", "0"));
    //        while (myRead.Read())
    //        {
    //            ddlVolunteerName.Items.Add(new ListItem(myRead["VolunteerFirstName"].ToString() + " " + myRead["VolunteerLastName"].ToString(), myRead["VolunteerID"].ToString()));
    //        }
    //    }
    //    con.Close();
    //    sc.Close();
    //}

    protected void btnUpdateVolunteer_Click(object sender, EventArgs e)
    {
        System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
        // sc.ConnectionString = @"Server=localhost;Database=WildTek;Trusted_Connection=Yes;";
        String cs = ConfigurationManager.ConnectionStrings["WildTekConnectionString"].ConnectionString;
        sc.ConnectionString = cs;
        sc.Open();

        System.Data.SqlClient.SqlCommand update = new System.Data.SqlClient.SqlCommand();
        update.Connection = sc;
        SqlConnection con = new SqlConnection(cs);

        update.CommandText = "update Volunteers set VolunteerFirstName = @VolunteerFirstName, VolunteerLastName = @VolunteerLastName, VolunteerPhoneNumber = @VolunteerPhoneNumber, VolunteerEmail = @VolunteerEmail, VolunteerStatus = @VolunteerStatus," +
            " lastUpdated = @lastUpdated, lastUpdatedBy = @lastUpdatedBy where VolunteerID = @VolunteerID";
        update.Parameters.AddWithValue("@VolunteerFirstName", txtVolunteerFirstName.Text);
        update.Parameters.AddWithValue("@VolunteerLastName", txtVolunteerLastName.Text);
        update.Parameters.AddWithValue("@VolunteerPhoneNumber", txtVolunteerPhoneNumber.Text);
        update.Parameters.AddWithValue("@VolunteerEmail", txtVolunteerEmail.Text);
        update.Parameters.AddWithValue("@VolunteerStatus", ddlVolunteerStatus.SelectedItem.Value);
        update.Parameters.AddWithValue("@VolunteerID", ddlVolunteerName.SelectedItem.Value);
        update.Parameters.AddWithValue("@lastUpdated", DateTime.Today);
        update.Parameters.AddWithValue("@lastUpdatedBy", HttpUtility.HtmlEncode(Session["USER_ID"]));
        update.ExecuteNonQuery();


        System.Data.SqlClient.SqlCommand insert = new System.Data.SqlClient.SqlCommand();
        SqlConnection con2 = new SqlConnection(cs);

        ddlVolunteerName.Items.Clear();
        //call read array
        con.Open();
        if (con.State == System.Data.ConnectionState.Open)
        {

            string read = "Select * from Volunteers";
            SqlCommand cmd = new SqlCommand(read, con);
            SqlDataReader myRead = cmd.ExecuteReader();

            ddlVolunteerName.Items.Add(new ListItem("--Select Volunteer--", "0"));
            while (myRead.Read())
            {
                ddlVolunteerName.Items.Add(new ListItem(myRead["VolunteerFirstName"].ToString() + " " + myRead["VolunteerLastName"].ToString(), myRead["VolunteerID"].ToString()));
            }
        }
        con.Close();
        sc.Close();


    }

    protected void btnAddVolunteer_Click(object sender, EventArgs e)
    {
        System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();

        // sc.ConnectionString = @"Server=localhost;Database=WildTek;Trusted_Connection=Yes;";

        String cs = ConfigurationManager.ConnectionStrings["WildTekConnectionString"].ConnectionString;
        sc.ConnectionString = cs;
        System.Data.SqlClient.SqlCommand insert = new System.Data.SqlClient.SqlCommand();


        sc.Open();
        insert.Connection = sc;

        String firstName = txtVolunteerAddFirstName.Text;
        String lastName = txtVolunteerAddLastName.Text;
        string phoneNumber = txtVolunteerAddPhoneNumber.Text;
        string email = txtVoluteerAddEmail.Text;
        string status = ddlVolunteerAddStatus.Text;

        DateTime lastUpdated = DateTime.Today;
        String lastUpdatedBy = HttpUtility.HtmlEncode(Session["USER_ID"]);


        insert.CommandText = "insert into Volunteers (VolunteerFirstName, VolunteerLastName, VolunteerPhoneNumber, VolunteerEmail, VolunteerStatus, lastUpdated, lastUpdatedBy) values (@firstName, @lastName, @phoneNumber, @email, @status, @lastUpdated, @lastUpdatedBy)";
        insert.Parameters.AddWithValue("@firstName", firstName);
        insert.Parameters.AddWithValue("@lastName", lastName);
        insert.Parameters.AddWithValue("@phoneNumber", phoneNumber);
        insert.Parameters.AddWithValue("@email", email);
        insert.Parameters.AddWithValue("@status", status);
        insert.Parameters.AddWithValue("@lastUpdated", lastUpdated);
        insert.Parameters.AddWithValue("@lastUpdatedBy", lastUpdatedBy);
        insert.ExecuteNonQuery();


        txtVolunteerAddFirstName.Text = "";
        txtVolunteerAddLastName.Text = "";
        txtVolunteerAddPhoneNumber.Text = "";
        txtVoluteerAddEmail.Text = "";
        ddlVolunteerAddStatus.SelectedIndex = 0;
        //ddlVolunteerName.DataBind();

        ddlVolunteerName.Items.Clear();
        //call read array
        if (sc.State == System.Data.ConnectionState.Open)
        {

            string read = "Select * from Volunteers";
            SqlCommand cmd = new SqlCommand(read, sc);
            SqlDataReader myRead = cmd.ExecuteReader();
            ddlVolunteerName.Items.Add(new ListItem("--Select Volunteer--", "0"));
            while (myRead.Read())
            {
                ddlVolunteerName.Items.Add(new ListItem(myRead["VolunteerFirstName"].ToString() + " " + myRead["VolunteerLastName"].ToString(), myRead["VolunteerID"].ToString()));
            }
        }

        sc.Close();
    }

    protected void ddlOrganization_SelectedIndexChanged1(object sender, EventArgs e)
    {
        System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
        // sc.ConnectionString = @"Server=localhost;Database=WildTek;Trusted_Connection=Yes;";
        String cs = ConfigurationManager.ConnectionStrings["WildTekConnectionString"].ConnectionString;
        sc.ConnectionString = cs;
        sc.Open();

        System.Data.SqlClient.SqlCommand insert = new System.Data.SqlClient.SqlCommand();
        insert.Connection = sc;

        insert.Parameters.Clear();
        System.Data.SqlClient.SqlCommand pullContactName = new System.Data.SqlClient.SqlCommand();
        pullContactName.Connection = sc;
        pullContactName.Parameters.Clear();


        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "ModalView", "<script>$function(){ $('#myModal').modal('show');});</script>", false);

        //call read array
        SqlConnection con = new SqlConnection(cs);

        insert.CommandText = "select OrgName, City, County, StreetAddress, PostalCode from Organization where" +
                          " OrgID = @OrgID";

        insert.Parameters.AddWithValue("@OrgID", ddlOrganization.SelectedItem.Value);
        pullContactName.CommandText = "select ContactID, ContactFirstName + ' ' + ContactLastName as 'Contact Name' from ContactInformation where" +
  " OrgID = @OrgID";

        pullContactName.Parameters.AddWithValue("@OrgID", ddlOrganization.SelectedItem.Value);
        SqlDataReader readContacts = pullContactName.ExecuteReader();
        ddlContacts.Items.Clear();
        ddlContacts.Items.Add(new ListItem("--Select Primary Contact--", "0"));
        while (readContacts.Read())
        {
            ddlContacts.Items.Add(new ListItem(readContacts["Contact Name"].ToString(), readContacts["ContactID"].ToString()));
        }

        try
        {
            con.Open();
            SqlDataReader sdr = insert.ExecuteReader();
            while (sdr.Read())
            {

                txtOrgName.Text = HttpUtility.HtmlEncode(sdr[0].ToString());
                txtCity.Text = HttpUtility.HtmlEncode(sdr[1].ToString());
                txtCounty.Text = HttpUtility.HtmlEncode(sdr[2].ToString());
                txtStreetAddress2.Text = HttpUtility.HtmlEncode(sdr[3].ToString());
                txtPostalCode2.Text = HttpUtility.HtmlEncode(sdr[4].ToString());
                //txtContactFirstName2.Text = HttpUtility.HtmlEncode(sdr[5].ToString());
                //txtContactLastName2.Text = HttpUtility.HtmlEncode(sdr[6].ToString());
                //txtPhoneNumber2.Text = HttpUtility.HtmlEncode(sdr[7].ToString());
                //txtEmail2.Text = HttpUtility.HtmlEncode(sdr[8].ToString());
                //txtSecondaryEmail2.Text = HttpUtility.HtmlEncode(sdr[9].ToString());
                //lblLastUpdated.Text = "Last Updated: " + sdr["LastUpdated"].ToString();
                // lblLastUpdatedBy.Text = "Last Updated By: " + sdr["LastUpdatedBy"].ToString();
            }
            System.Data.SqlClient.SqlCommand selectContact = new System.Data.SqlClient.SqlCommand();
            selectContact.Connection = sc;
            selectContact.Parameters.Clear();

            selectContact.CommandText = "SELECT ContactFirstName + ' ' + ContactLastName as 'Contact Name' From ContactInformation WHERE PrimaryContact = 'Y' and OrgID = @OrgID";
            selectContact.Parameters.AddWithValue("@OrgID", ddlOrganization.SelectedItem.Value);
            String tempContact = (String)selectContact.ExecuteScalar();

            ddlContacts.ClearSelection();
            for (int i = 0; i < ddlContacts.Items.Count; i++)
            {
                if (ddlContacts.Items[i].Text == tempContact)
                {
                    ddlContacts.Items[i].Selected = true;
                }
            }

            System.Data.SqlClient.SqlCommand selectState = new System.Data.SqlClient.SqlCommand();
            selectState.Connection = sc;

            selectState.Parameters.Clear();

            selectState.CommandText = "SELECT State From Organization WHERE OrgID = @OrgID";
            selectState.Parameters.AddWithValue("@OrgID", ddlOrganization.SelectedItem.Value);
            String tempState = (String)selectState.ExecuteScalar();

            ddlState2.ClearSelection();
            for (int i = 0; i < ddlState2.Items.Count; i++)
            {
                if (ddlState2.Items[i].Value == tempState)
                {
                    ddlState2.Items[i].Selected = true;
                }
            }

            con.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }

        sc.Close();
    }


}