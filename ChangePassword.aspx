<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="ChangePassword" %>

 

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <meta charset="UTF-8">

 

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.css" rel="stylesheet">

    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/sb-admin.css" rel="stylesheet">

         <!-- Bootstrap core CSS-->

    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

 

    <!-- Custom fonts for this template-->

    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

 

      <link href="https://fortawesome.github.io/Font-Awesome/assets/font-awesome/css/font-awesome.css" rel="stylesheet">

    <!-- Page level plugin CSS-->

    <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

 

    <!-- Custom styles for this template-->

    <link href="css/sb-admin.css" rel="stylesheet">

 

      <!-- Logo FOnt-->

      <link href="https://fonts.googleapis.com/css?family=Orbitron" rel="stylesheet">

 

         <!-- Bootstrap v4 -->

<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="screen">

<link href="Content/Login.css" rel="stylesheet" type="text/css" media="screen">

<link href="Content/sb-admin.css" rel="stylesheet" type="text/css" media="screen">

       

      <!-- Logo FOnt-->

      <link href="https://fonts.googleapis.com/css?family=Orbitron" rel="stylesheet">

              

         

 
    <!--Basic  nav bar for a Change of Password Option-->
   <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
       <a class="navbar-brand " style=" color: #FFBC7C; font-weight: 400; font-size: 150%;" href="Default.aspx">Back to Login</a>

        <div class="collapse navbar-collapse " id="navbarTogglerDemo03">
            <ul class="navbar-nav ml-auto mt-2 mt-lg-0 d-md-none">
                <li class="nav-item dropdown no-arrow active">
                    <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">

                        <%--<a class="nav-link" href="Programs.aspx">--%>

                        <span>Programs</span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right">
                        <a class="dropdown-item" href="Programs.aspx">View Programs</a>
                        <a class="dropdown-item" href="#" data-target="#AddProgram" data-toggle="modal">Add New Program Type</a>
                    </div>
                </li>
                </ul>
            </div>

        </nav>

 

   

 
    <!--Allows user to enter new password, and confirms the new password -->
    <div id="wrapper">
      <div id="content-wrapper">

        <div class="container-fluid ">

<div class="container1">

      <div class="card card-register mx-auto mt-5">

        <div class="card-header NewUserTitle text-center">Change Password</div>

        <div class="card-body">

            <div class="form-group">

              <div class="form-row">

                <div class="col-md-6">

                  <div class="form-label-group"> 

                      <h6 >New Password</h6>


                      <asp:TextBox ID="txtNewPassword" TextMode="Password" class="form-control" runat="server" required="required"></asp:TextBox>

 

                  </div>

                </div>

                <div class="col-md-6">

                  <div class="form-label-group">                   

                      <h6> Confirm New Password</h6>

                     

                      <asp:TextBox ID="txtConfirmNewPassword" class="form-control"  TextMode="Password" runat="server">

            </asp:TextBox>

            <asp:RequiredFieldValidator ID="RequiredFieldValidator1"

                runat="server" ErrorMessage="Confirm New Password required" Text="*"

                ControlToValidate="txtConfirmNewPassword"

                ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>

            <asp:CompareValidator ID="CompareValidatorPassword" runat="server"

                ErrorMessage="New Password and Confirm New Password must match"

                ControlToValidate="txtConfirmNewPassword" ForeColor="Red"

                ControlToCompare="txtNewPassword"

                Display="Dynamic" Type="String" Operator="Equal" Text="*">

            </asp:CompareValidator>             

                  </div>        

                </div>

                          <p runat="server" class=" PasswordReq" style="font-size: 75%;"> Password must include: <br> 1 Number, 1 Special Character <br> 1 Capital Letter, Minimum 8 Characters  </p>

                        <p runat="server" class=" PasswordReq" style="font-size: 75%;"> &nbsp;</p>

                        </div>

                </div>
            <div class="row">

                <div class="col-md-5 mx-auto">

                  

            <asp:Button ID="btnSave" class="btn btn-primary btn-login btn-block" runat="server" OnClick="btnSave_Click" Text="Save" />

                </div>

            </div>

              </div>

            <asp:Label ID="lblMessage" runat="server"> </asp:Label> <asp:ValidationSummary ID="ValidationSummary1" ForeColor="Red" runat="server" />

            </div>

            

            

              

            
              </div>

           

         

          </div>

        </div>

      </div>

    </div>

 

 

 

      

</section>

 

</asp:Content>