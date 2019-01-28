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





public partial class Organizations : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {



        OrganizationSearchDiv.Visible = false;

        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "ModalView", "<script>$function(){ $('#EditAnimalModal').modal('show');});</script>", false);

        System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
        // sc.ConnectionString = @"Server=localhost;Database=WildTek;Trusted_Connection=Yes;";
        String cs = ConfigurationManager.ConnectionStrings["WildTekConnectionString"].ConnectionString;
        sc.ConnectionString = cs;
        sc.Open();

        SqlConnection connection = new SqlConnection(cs);
        connection.Open();
        //DataTable dt1 = new DataTable();
        //SqlDataAdapter adapt1 = new SqlDataAdapter(("Select OrgName, StreetAddress, City, County, State, PostalCode From Organization Order by OrgName;"), connection);
        //adapt1.Fill(dt1);
        //GridView1.DataSource = dt1;
        //GridView1.DataBind();

        //DataTable dt2 = new DataTable();
        //SqlDataAdapter adapt2 = new SqlDataAdapter(("SELECT o.[OrgName] as OrgName, c.[ContactFirstName] as ContactFirstName, c.[ContactLastName] as ContactLastName, c.[ContactEmail] as ContactEmail, c.[PrimaryContact] as PrimaryContact FROM [Organization] as o Right Join [ContactInformation] as c on o.OrgID = c.OrgID ORDER BY [OrgName]"), connection);
        //adapt2.Fill(dt2);
        //GridView3.DataSource = dt2;
        //GridView3.DataBind();
        try
        {
            SqlConnection con = new SqlConnection(cs);

            con.Open();

            //string str = "select * from Person where username= @username";
            System.Data.SqlClient.SqlCommand str = new System.Data.SqlClient.SqlCommand();
            str.Connection = sc;
            str.Parameters.Clear();

            str.CommandText = "select * from Person where username= @username";
            str.Parameters.AddWithValue("@username", Session["USER_ID"]);
            str.ExecuteNonQuery();

            //SqlCommand com = new SqlCommand(str, con);

            SqlDataAdapter da = new SqlDataAdapter(str);

            DataSet ds = new DataSet();

            da.Fill(ds);

            lblWelcome.Text = "Welcome, " + ds.Tables[0].Rows[0]["Firstname"].ToString() + " ";
            sc.Close();
        }
        catch
        {
            Session.RemoveAll();
            Response.Redirect("Default.aspx", false);
        }

        ContactSearchDiv.Visible = false;


        if (!IsPostBack)
        {

            //call read array
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            if (con.State == System.Data.ConnectionState.Open)
            {
                string read = "Select OrgID, OrgName from Organization";

                SqlCommand cmd = new SqlCommand(read, con);
                SqlDataReader myRead = cmd.ExecuteReader();

                while (myRead.Read())
                {
                    ddlOrg.Items.Add(new ListItem(myRead["OrgName"].ToString(), myRead["OrgID"].ToString()));
                }

                string read1 = "Select OrgID, OrgName from Organization";

                SqlCommand cmd1 = new SqlCommand(read1, con);
                SqlDataReader myRead1 = cmd1.ExecuteReader();

                while (myRead1.Read())
                {
                    ddlOrganization.Items.Add(new ListItem(myRead1["OrgName"].ToString(), myRead1["OrgID"].ToString()));
                }
                con.Close();
                sc.Close();
            }
        }

        connection.Close();
        sc.Close();
    }

    protected void btn_lgout_Click(object sender, EventArgs e)
    {


        //Session.Clear();
        //Session.Abandon();
        Session.RemoveAll();

        Session["USER_ID"] = null;

        Response.Redirect("Default.aspx");
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
        // String streetAddress = txtStreetAddress.Text;
        //String state = ddlState.SelectedValue; ;
        //String postalCode = txtPostalCode.Text;
        String contactFirstName = contactFirstName1.Text;
        String contactLastName = contactLastName1.Text;
        //String phoneNumber = txtPhoneNumber.Text;
        String email = txtEmail.Text;
        //String secondaryEmail = txtSecondaryEmail.Text;
        DateTime lastUpdated = DateTime.Today;

        String lastUpdatedBy = HttpUtility.HtmlEncode(Session["USER_ID"]);
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

        string read1 = "Select * from Organization";
        SqlCommand cmd1 = new SqlCommand(read1, sc);
        SqlDataReader myRead1 = cmd1.ExecuteReader();

        ddlOrganization.Items.Clear();
        ddlOrg.Items.Clear();
        ddlOrganization.Items.Add(new ListItem("--Select Organization--", "0"));
        ddlOrg.Items.Add(new ListItem("--Select Organization--", "0"));
        while (myRead.Read())
        {
            ddlOrganization.Items.Add(new ListItem(myRead["OrgName"].ToString(), myRead["OrgID"].ToString()));
        }
        while (myRead1.Read())
        {
            ddlOrg.Items.Add(new ListItem(myRead1["OrgName"].ToString(), myRead1["OrgID"].ToString()));
        }
        ddlOrganization.DataBind();
        ddlOrg.DataBind();

        textOrgName.Text = "";
        // textOrgCity.Text = "";
        textOrgCounty.Text = "";
        //txtStreetAddress.Text = "";
        // ddlState.SelectedIndex = 0;
        ddlOrg.SelectedIndex = 0;
        // txtPostalCode.Text = "";
        txtContactFirstName.Text = "";
        txtContactLastName.Text = "";
        contactFirstName1.Text = "";
        contactLastName1.Text = "";
        //txtPhoneNumber.Text = "";
        txtEmail.Text = "";
        //txtSecondaryEmail.Text = "";

        sc.Close();
        GridView1.DataBind();
        GridView3.DataBind();

    }



    protected void btnExportOrg_Click(object sender, EventArgs e)
    {

        System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
        String cs = ConfigurationManager.ConnectionStrings["WildTekConnectionString"].ConnectionString;
        sc.ConnectionString = cs;
        String animalReport = "Organizations Listing";
        String filename = "Created on: " + DateTime.Now.Month.ToString() + "/" + DateTime.Now.Day.ToString() + "/" + DateTime.Now.Year.ToString();
        string onlineName = animalReport + filename;

        SqlCommand cmd = new SqlCommand("SELECT [OrgName], [StreetAddress], [City], [County], [State], [PostalCode] FROM [Organization] ORDER BY [OrgName]", sc);

        sc.Open();

        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);

        ds.WriteXml(@"C:\Users\labpatron\Desktop\" + animalReport + ".xls");

        sc.Close();
        string script = "alert('File Successfully Exported to Desktop');";
        System.Web.UI.ScriptManager.RegisterClientScriptBlock(btnExportOrg, this.GetType(), "Test", script, true);

    }
    protected void btnContactOrg_Click(object sender, EventArgs e)
    {

        System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
        String cs = ConfigurationManager.ConnectionStrings["WildTekConnectionString"].ConnectionString;
        sc.ConnectionString = cs;
        String animalReport = "Contacts from Organizations Listing";
        String filename = "Created on: " + DateTime.Now.Month.ToString() + "/" + DateTime.Now.Day.ToString() + "/" + DateTime.Now.Year.ToString();
        string onlineName = animalReport + filename;

        SqlCommand cmd = new SqlCommand("SELECT o.[OrgName] as OrgName, c.[ContactFirstName] as ContactFirstName, c.[ContactLastName] as ContactLastName, c.[ContactEmail] as ContactEmail, c.[PrimaryContact] as PrimaryContact FROM [Organization] as o Right Join [ContactInformation] as c on o.OrgID = c.OrgID ORDER BY [OrgName]", sc);

        sc.Open();

        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);

        ds.WriteXml(@"C:\Users\labpatron\Desktop\" + animalReport + ".xls");

        sc.Close();
        string script = "alert('File Successfully Exported to Desktop');";
        System.Web.UI.ScriptManager.RegisterClientScriptBlock(btnExportOrg, this.GetType(), "Test", script, true);

    }
    public override void VerifyRenderingInServerForm(Control control)
    {

    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {

        OrganizationSearchDiv.Visible = true;
        //gridSearch.DataBind();
        //gridAnimalMammal.Visible = false;
        //gridBird.Visible = false;
        //gridReptile.Visible = false;
        //gridSearch.Visible = true;



        System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
        // sc.ConnectionString = @"Server=localhost;Database=WildTek;Trusted_Connection=Yes;";
        String cs = ConfigurationManager.ConnectionStrings["WildTekConnectionString"].ConnectionString;
        sc.ConnectionString = cs;
        sc.Open();

        System.Data.SqlClient.SqlCommand search = new System.Data.SqlClient.SqlCommand();
        search.Connection = sc;
        SqlConnection con = new SqlConnection(cs);
        string searchOrganization = txtSearch.Text;

        DataTable dt = new DataTable();
        SqlDataAdapter adapt = new SqlDataAdapter("Select OrgName, StreetAddress, City, County, State, PostalCode " +
            "from Organization where UPPER(OrgName) like UPPER('%" + searchOrganization + "%') or UPPER(County) like UPPER('%" + searchOrganization + "%') " +
            "or UPPER(City) like UPPER('%" + searchOrganization + "%') or UPPER(State) like UPPER('%" + searchOrganization + "%')", con);

        adapt.Fill(dt);
        gridSearch.DataSource = dt;
        gridSearch.DataBind();
        gridSearch.Visible = true;

    }





    //protected void ddlOrderBy_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    OrganizationSearchDiv.Visible = false;
    //    gridSearch.DataBind();

    //    System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
    //    String cs = ConfigurationManager.ConnectionStrings["WildTekConnectionString"].ConnectionString;
    //    sc.ConnectionString = cs;
    //    sc.Open();
    //    System.Data.SqlClient.SqlCommand search = new System.Data.SqlClient.SqlCommand();
    //    search.Connection = sc;
    //    SqlConnection con = new SqlConnection(cs);


    //    int orderType = ddlOrderBy.SelectedIndex;
    //    switch (orderType)
    //    {

    //        case 0:
    //            OrganizationSearchDiv.Visible = false;
    //            break;
    //        case 1:

    //            DataTable dt1 = new DataTable();
    //            SqlDataAdapter adapt1 = new SqlDataAdapter(("Select OrgName, StreetAddress, City, County, State, PostalCode From Organization Order by OrgName;"), con);
    //            adapt1.Fill(dt1);
    //            GridView1.DataSource = dt1;
    //            GridView1.DataBind();
    //            break;
    //        case 2:
    //            DataTable dt2 = new DataTable();
    //            SqlDataAdapter adapt2 = new SqlDataAdapter(("Select OrgName, StreetAddress, City, County, State, PostalCode From Organization Order by City;"), con);
    //            adapt2.Fill(dt2);
    //            GridView1.DataSource = dt2;
    //            GridView1.DataBind();
    //            break;
    //        case 3:
    //            DataTable dt3 = new DataTable();
    //            SqlDataAdapter adapt3 = new SqlDataAdapter(("Select OrgName, StreetAddress, City, County, State, PostalCode From Organization Order by County;"), con);
    //            adapt3.Fill(dt3);
    //            GridView1.DataSource = dt3;
    //            GridView1.DataBind();
    //            break;


    //    }
    //}
    protected void btnAddContact_Click(object sender, EventArgs e)
    {
        System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();

        // sc.ConnectionString = @"Server=localhost;Database=WildTek;Trusted_Connection=Yes;";

        String cs = ConfigurationManager.ConnectionStrings["WildTekConnectionString"].ConnectionString;
        sc.ConnectionString = cs;
        System.Data.SqlClient.SqlCommand insert = new System.Data.SqlClient.SqlCommand();
        System.Data.SqlClient.SqlCommand pullOrgID = new System.Data.SqlClient.SqlCommand();

        sc.Open();
        insert.Connection = sc;
        pullOrgID.Connection = sc;

        //call read array
        SqlConnection con = new SqlConnection(cs);
        con.Open();
        //ddlOrg.Items.Clear();
        //if (con.State == System.Data.ConnectionState.Open)
        //{
        //    string read = "Select OrgID, OrgName from Organization";

        //    SqlCommand cmd = new SqlCommand(read, con);
        //    SqlDataReader myRead = cmd.ExecuteReader();

        //    ddlOrg.Items.Add(new ListItem("--Select Organization--", "0"));
        //    while (myRead.Read())
        //    {
        //        ddlOrg.Items.Add(new ListItem(myRead["OrgName"].ToString(), myRead["OrgID"].ToString()));
        //    }
        //}

        String contactFirstName = txtContactFirstName.Text;
        String contactLastName = txtContactLastName.Text;
        String contactEmail = txtContactEmail.Text;

        pullOrgID.CommandText = "SELECT OrgID From Organization WHERE OrgName = @OrgName";
        pullOrgID.Parameters.AddWithValue("@OrgName", ddlOrg.SelectedItem.Text);
        int tempOrgID = (int)pullOrgID.ExecuteScalar();

        insert.CommandText = "insert into ContactInformation (contactFirstName, contactLastName, contactEmail, PrimaryContact, OrgID, LastUpdated, LastUpdatedBy) values (@contactFN, @contactLN, @contactEmail, @primaryContact, @OrgID, @LastUpdated, @LastUpdatedBy)";
        insert.Parameters.AddWithValue("@contactFN", contactFirstName);
        insert.Parameters.AddWithValue("@contactLN", contactLastName);
        insert.Parameters.AddWithValue("@contactEmail", contactEmail);
        insert.Parameters.AddWithValue("@PrimaryContact", "N");
        insert.Parameters.AddWithValue("@OrgID", tempOrgID);
        insert.Parameters.AddWithValue("@LastUpdated", DateTime.Now);
        insert.Parameters.AddWithValue("@LastUpdatedBy", HttpUtility.HtmlEncode(Session["USER_ID"]));
        insert.ExecuteNonQuery();



        txtContactFirstName.Text = "";
        txtContactLastName.Text = "";
        txtContactEmail.Text = "";
        ddlOrg.ClearSelection();
        con.Close();
        sc.Close();
        GridView3.DataBind();

    }

    protected void btnAllClear_Click(object sender, EventArgs e)
    {
        txtSearch.Text = "";
        ddlOrderBy.SelectedIndex = 0;
        gridSearch.Visible = false;
        GridView1.Visible = true;

        //System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
        //// sc.ConnectionString = @"Server=localhost;Database=WildTek;Trusted_Connection=Yes;";
        //String cs = ConfigurationManager.ConnectionStrings["WildTekConnectionString"].ConnectionString;
        //sc.ConnectionString = cs;
        //sc.Open();

        //SqlConnection connection = new SqlConnection(cs);
        //connection.Open();
        //DataTable dt1 = new DataTable();
        //SqlDataAdapter adapt1 = new SqlDataAdapter(("Select OrgName, StreetAddress, City, County, State, PostalCode From Organization Order by OrgName;"), connection);
        //adapt1.Fill(dt1);
        //GridView1.DataSource = dt1;
        //GridView1.DataBind();
        //connection.Close();
    }

    //protected void ddlContactOrderBy_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    ContactSearchDiv.Visible = false;
    //    ContactSearchGrid.DataBind();

    //    System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
    //    String cs = ConfigurationManager.ConnectionStrings["WildTekConnectionString"].ConnectionString;
    //    sc.ConnectionString = cs;
    //    sc.Open();
    //    System.Data.SqlClient.SqlCommand search = new System.Data.SqlClient.SqlCommand();
    //    search.Connection = sc;
    //    SqlConnection con = new SqlConnection(cs);


    //    int orderType = ddlContactOrderBy.SelectedIndex;
    //    switch (orderType)
    //    {

    //        case 0:
    //            ContactSearchDiv.Visible = false;
    //            break;
    //        case 1:

    //            DataTable dt1 = new DataTable();
    //            SqlDataAdapter adapt1 = new SqlDataAdapter(("SELECT o.[OrgName] as OrgName, c.[ContactFirstName] as ContactFirstName, c.[ContactLastName] as ContactLastName, c.[ContactEmail] as ContactEmail, c.[PrimaryContact] as PrimaryContact FROM [Organization] as o Right Join [ContactInformation] as c on o.OrgID = c.OrgID ORDER BY [OrgName];"), con);
    //            adapt1.Fill(dt1);
    //            GridView3.DataSource = dt1;
    //            GridView3.DataBind();
    //            break;
    //        case 2:
    //            DataTable dt2 = new DataTable();
    //            SqlDataAdapter adapt2 = new SqlDataAdapter(("SELECT o.[OrgName] as OrgName, c.[ContactFirstName] as ContactFirstName, c.[ContactLastName] as ContactLastName, c.[ContactEmail] as ContactEmail, c.[PrimaryContact] as PrimaryContact FROM [Organization] as o Right Join [ContactInformation] as c on o.OrgID = c.OrgID ORDER BY [ContactFirstName];"), con);
    //            adapt2.Fill(dt2);
    //            GridView3.DataSource = dt2;
    //            GridView3.DataBind();
    //            break;
    //        case 3:
    //            DataTable dt3 = new DataTable();
    //            SqlDataAdapter adapt3 = new SqlDataAdapter(("SELECT o.[OrgName] as OrgName, c.[ContactFirstName] as ContactFirstName, c.[ContactLastName] as ContactLastName, c.[ContactEmail] as ContactEmail, c.[PrimaryContact] as PrimaryContact FROM [Organization] as o Right Join [ContactInformation] as c on o.OrgID = c.OrgID ORDER BY [ContactLastName];"), con);
    //            adapt3.Fill(dt3);
    //            GridView3.DataSource = dt3;
    //            GridView3.DataBind();
    //            break;


    //    }
    //}

    protected void btnContactSearch_Click(object sender, EventArgs e)
    {
        //ContactSearchDiv.Visible = true;
        GridView3.Visible = true;


        //ContactSearchGrid.DataBind();

        System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
        String cs = ConfigurationManager.ConnectionStrings["WildTekConnectionString"].ConnectionString;
        sc.ConnectionString = cs;
        sc.Open();

        System.Data.SqlClient.SqlCommand search = new System.Data.SqlClient.SqlCommand();
        search.Connection = sc;
        SqlConnection con = new SqlConnection(cs);
        string searchContacts = txtContactSearch.Text;

        DataTable dt = new DataTable();
        SqlDataAdapter adapt = new SqlDataAdapter("SELECT o.[OrgName] as OrgName, c.[ContactFirstName] as ContactFirstName, c.[ContactLastName] as ContactLastName, c.[ContactEmail] as ContactEmail, c.[PrimaryContact] as PrimaryContact FROM [Organization] as o Right Join [ContactInformation] as c on o.OrgID = c.OrgID where UPPER(OrgName) like UPPER('%" + searchContacts + "%') or UPPER(ContactFirstName) like UPPER('%" + searchContacts + "%') " +
            "or UPPER(ContactLastName) like UPPER('%" + searchContacts + "%') or UPPER(ContactEmail) like UPPER('%" + searchContacts + "%') or UPPER(PrimaryContact) like UPPER('%" + searchContacts + "%')", con);



        adapt.Fill(dt);
        ContactSearchGrid.DataSource = dt;
        ContactSearchGrid.DataBind();
        ContactSearchDiv.Visible = true;



    }


    protected void btnContactClear_Click(object sender, EventArgs e)
    {
        ContactSearchDiv.Visible = false;
        GridView3.Visible = true;
        txtContactSearch.Text = "";
    }

    protected void ddlOrganization_SelectedIndexChanged1(object sender, EventArgs e)
    {
        if (ddlOrganization.SelectedIndex != 0)
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
        } else
        {
            txtOrgName.Text = "";
            txtStreetAddress2.Text = "";
            txtCity.Text = "";
            txtCounty.Text = "";
            ddlState2.SelectedIndex = 0;
            txtPostalCode2.Text = "";
            ddlContacts.SelectedIndex = 0;
        }
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
        String tempLastUpdatedBy = HttpUtility.HtmlEncode(Session["USER_ID"].ToString());

        update.CommandText = "update organization set orgName = @orgName, city = @city, county = @county, lastUpdated = @lastUpdated, lastUpdatedBy = @lastUpdatedBy, streetAddress = @streetAddress, state = @state, postalCode = @postalCode where orgID = @orgID";
        update.Parameters.AddWithValue("@orgName", txtOrgName.Text);
        update.Parameters.AddWithValue("@city", txtCity.Text);
        update.Parameters.AddWithValue("@county", txtCounty.Text);
        update.Parameters.AddWithValue("@orgID", ddlOrganization.SelectedItem.Value);
        update.Parameters.AddWithValue("@lastUpdated", DateTime.Today);
        update.Parameters.AddWithValue("@lastUpdatedBy", tempLastUpdatedBy);
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
        GridView1.DataBind();
        GridView3.DataBind();
    }
}