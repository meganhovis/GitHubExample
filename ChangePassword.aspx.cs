using System;

using System.Collections.Generic;

using System.Configuration;

using System.Data;

using System.Data.SqlClient;

using System.Linq;

using System.Web;

using System.Web.Security;

using System.Web.UI;

using System.Web.UI.WebControls;

using System.Text.RegularExpressions;



public partial class ChangePassword : System.Web.UI.Page

{
    //determines if the link to change password has expired or is no longer valid
    protected void Page_Load(object sender, EventArgs e)

    {

        if (!IsPostBack)

        {

            if (!IsPasswordResetLinkValid())

            {



                lblMessage.ForeColor = System.Drawing.Color.Red;

                lblMessage.Text = "Password Reset link has expired or is invalid";

            }

        }

    }


    //saves the newly created password and makes sure it is validated
    protected void btnSave_Click(object sender, EventArgs e)

    {

        if ((validatePassword(txtNewPassword.Text.ToString()) == true) && (validatePassword(txtConfirmNewPassword.Text.ToString()) == true))

        {


            // COMMIT VALUES

            try

            {

                if (ChangeUserPassword())

                {

                    lblMessage.Text = "Password Changed Successfully!";

                }

                else

                {

                    lblMessage.ForeColor = System.Drawing.Color.Red;

                    lblMessage.Text = "Password Reset link has expired or is invalid";

                }

            }

            catch

            {

                lblMessage.Text = "Invalid password creation.";

            }

        }

    }


    //executes the stored procedure to change the Hashes password
    private bool ExecuteSP(string SPName, List<SqlParameter> SPParameters)

    {

        string CS = ConfigurationManager.ConnectionStrings["WildTekConnectionString"].ConnectionString;

        using (SqlConnection con = new SqlConnection(CS))

        {

            SqlCommand cmd = new SqlCommand(SPName, con);

            cmd.CommandType = CommandType.StoredProcedure;


            foreach (SqlParameter parameter in SPParameters)

            {

                cmd.Parameters.Add(parameter);

            }

            con.Open();
  
            return Convert.ToBoolean(cmd.ExecuteScalar());
         
        }

    }


    //method to validate link to reset
    private bool IsPasswordResetLinkValid()

    {

        List<SqlParameter> paramList = new List<SqlParameter>()

    {

        new SqlParameter()

        {

            ParameterName = "@GUID",

           Value = Request.QueryString["uid"]

          // Value = Request.QueryString[personID]

 

        }

    };



        return ExecuteSP("spIsPasswordResetLinkValid", paramList);

    }


    //method to change password
    private bool ChangeUserPassword()

    {

        List<SqlParameter> paramList = new List<SqlParameter>()

    {

        new SqlParameter()

        {



            ParameterName = "@GUID",

            Value = Request.QueryString["uid"]

        },

        new SqlParameter()

        {

            ParameterName = "@Password",

            //Value = FormsAuthentication.HashPasswordForStoringInConfigFile(txtNewPassword.Text, "SHA1")

            Value = PasswordHash.HashPassword(txtNewPassword.Text)

        }

    };



        return ExecuteSP("spChangePassword", paramList);

    }

    //method to validate the newly entered Password
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

            lblMessage.Text = "Invalid password creation. Please try again.";

        }



        return temp;

    }

}