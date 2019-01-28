<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="userLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <meta charset="UTF-8">

    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">

    <link href="https://fonts.googleapis.com/css?family=Orbitron" rel="stylesheet">

    
    <!-- Bootstrap v4 -->

    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="screen">

    <link href="Content/Login.css" rel="stylesheet" type="text/css" media="screen">

    <link href="Content/sb-admin.css" rel="stylesheet" type="text/css" media="screen">


    <!-- styles the login page -->
    <style>
        body {
            background-image: url(../Images/BackgroundLogin/sunset.jpg);
            background-color: #D9D6D0;
            height: auto; /* You must set a specified height */
            background-position: top; /* Center the image */
            background-repeat: no-repeat; /* Do not repeat the image */
            background-size: cover; /* Resize the background image to cover the entire container */
            background-attachment: fixed;
            font-family: 'Titillium Web', sans-serif;
        }
    </style>


    <section class="login-block">

        <div class="container1">

            <div class="card card-register mx-auto mt-5 " style="width: 24rem;">

                <div class="card-header NewUserTitle">Wildlife Center Login</div>

                <div class="card-body ">

                    <div class="row mx-auto">

                        <div class="col-md-12   ">

                            <div class="form-group">

                                <h6>Username</h6>

                                <asp:TextBox ID="txtUsername" class="input-md textinput form-control" placeholder="Username" Style="margin-bottom: 10px" type="text" runat="server"></asp:TextBox>

                            </div>

                        </div>

                    </div>

                    <div class="row mx-auto  ">

                        <div class="col-md-12  ">

                            <div class="form-group">

                                <h6>Password</h6>

                                <asp:TextBox ID="txtPassword" class="input-md textinput textInput form-control" name="password1" placeholder="Password" Style="margin-bottom: 10px" runat="server" TextMode="Password"></asp:TextBox>

                                <asp:CheckBox ID="chkShowPassword" runat="server" Text="Show Password" AutoPostBack="True" OnCheckedChanged="chkShowPassword_CheckedChanged" />

                                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp

            <asp:LinkButton ID="btnReset" runat="server" OnClick="btnResetPassword_Click" Text="Forgot Password" AutoPostback="True"></asp:LinkButton>

                            </div>

                        </div>

                    </div>





                    <div class="row mx-auto  ">

                        <div class="col-md-12  ">

                            <div class="form-group">

                                <asp:Button ID="btnLogin" class="btn btn-primary  btn-login btn-block" runat="server" OnClick="btnLogin_Click" Text="Login" />

                            </div>

                        </div>



                        <div class="col-md-12 ">

                            <div class="form-group">

                            </div>

                        </div>

                    </div>

                </div>







                <asp:Label ID="lblStatus" ForeColor="red" runat="server"></asp:Label>

                <div class="row">

                    <div class="form-check">

                    </div>

                </div>

            </div>



        </div>

    </section>

 

    <!-- jQuery and Bootstrap links - do not delete! -->

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>

    <!-- end of do not delete -->

</asp:Content>
