using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Tableau2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
            //sc.ConnectionString = @"Server=localhost;Database=WildTek;Trusted_Connection=Yes;";
            String cs = ConfigurationManager.ConnectionStrings["WildTekConnectionString"].ConnectionString;
            sc.ConnectionString = cs;
            sc.Open();
            // lblWelcome.Text = "Welcome, " + Session["USER_ID"].ToString() + "!";

            SqlConnection con = new SqlConnection(cs);

            con.Open();

            //string str = "select * from Person where username= @username";
            System.Data.SqlClient.SqlCommand str = new System.Data.SqlClient.SqlCommand();
            str.Connection = sc;
            str.Parameters.Clear();

            str.CommandText = "select * from Person where username= @username";
            str.Parameters.AddWithValue("@username", HttpUtility.HtmlEncode(Session["USER_ID"]));
            str.ExecuteNonQuery();

            //SqlCommand com = new SqlCommand(str, con);

            SqlDataAdapter da = new SqlDataAdapter(str);

            DataSet ds = new DataSet();

            da.Fill(ds);

            lblWelcome.Text = "Welcome, " + HttpUtility.HtmlEncode(ds.Tables[0].Rows[0]["Firstname"].ToString()) + " ";


        }
        catch
        {
            Session.RemoveAll();
            Response.Redirect("Default.aspx", false);
        }
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("Report.aspx");
    }
    protected void btn_lgout_Click(object sender, EventArgs e)
    {


        //Session.Clear();
        //Session.Abandon();
        Session.RemoveAll();

        Session["USER_ID"] = null;

        Response.Redirect("Default.aspx");
    }

}