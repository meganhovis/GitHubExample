<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="createUser.aspx.cs" Inherits="createUser" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

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


     <%--navigation bar for responsive design--%>
    <nav class="navbar navbar-dark bg-dark">
        <button class="navbar-toggler d-md-none" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <a class="navbar-brand " style="color: #FFBC7C; font-weight: 400; font-size: 150%;" href="Programs.aspx">Wildlife Center of Virginia</a>
        <div class="ml-auto row">
            <asp:Label ID="lblWelcome" runat="server" Text="" class="" Style="color: #e0d7c3; margin-right: 15px;"></asp:Label>
            <asp:Button ID="logout" runat="server" style="color:#FFBC7C; cursor:pointer; margin-right: 15px; background-color:transparent; border:none;" Text="Logout" OnClick="btn_lgout_Click" CausesValidation="false" />
        </div>
        <div class="collapse navbar-collapse " id="navbarTogglerDemo03">
            <ul class="navbar-nav ml-auto mt-2 mt-lg-0 d-md-none">
                <li class="nav-item dropdown no-arrow">
                    <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">

                        <span>Programs</span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right">
                        <a class="dropdown-item" href="Programs.aspx">View Programs</a>
                        <a class="dropdown-item" href="ProgramTheme.aspx">View Program Themes</a>
                    </div>
                </li>
               
                <li class="nav-item dropdown no-arrow ">
                    <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">

                        <span>Animals</span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right">
                        <a class="dropdown-item" href="AnimalPage.aspx">View Animals</a>
                        <a class="dropdown-item" href="#" data-target="#AddAnimal" data-toggle="modal">Add New Animal</a>
                        <a class="dropdown-item" href="#" data-target="#UpdateAnimal" data-toggle="modal">Edit Animal</a>
                    </div>
                </li>
               
            <li class="nav-item ">
                <a class="nav-link" href="Report.aspx">

                    <span>Reports</span></a>
            </li>

                <li class="nav-item ">
                    <a class="nav-link" href="Tableau.aspx">

                        <span>Visualizations</span></a>
                </li>
                <li class="nav-item dropdown no-arrow">
                    <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">

                        <span>Invoices</span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right">
                        <a class="dropdown-item" href="Invoices.aspx">View Invoices</a>
                        <a class="dropdown-item" href="Payment.aspx">New Invoice</a>
                        

                    </div>
                </li>

                <li class="nav-item dropdown no-arrow">
                    <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">

                        <span>Organizations</span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right">
                        <a class="dropdown-item" href="Organizations.aspx">View Organizations</a>
                        <a class="dropdown-item" href="#" data-target="#AddOrganization" data-toggle="modal">Add New Organization</a>
                        <a class="dropdown-item" href="#" data-target="#UpdateOrganization" data-toggle="modal">Edit Organization</a>
                    </div>
                </li>

                <li class="nav-item dropdown no-arrow active ">
                    <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">

                        <span>Wildlife Staff</span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right">
                        <a class="dropdown-item" href="Staff.aspx" data-toggle="modal">Wildlife Staff</a>
                        <a class="dropdown-item" href="#" data-target="#AddEducator" data-toggle="modal">Add New Educator</a>
                        <a class="dropdown-item" href="#" data-target="#UpdateEducator" data-toggle="modal">Edit Educators</a>
                        <a class="dropdown-item" href="#" data-target="#AddVolunteer" data-toggle="modal">Add New Volunteer</a>
                        <a class="dropdown-item" href="#" data-target="#UpdateVolunteer" data-toggle="modal">Edit Volunteers</a>
                    </div>
                </li>

              
                <li class="nav-item">
                    <a class="nav-link" href="Default.aspx">

                        <span>Logout</span></a>
                </li>


            </ul>

        </div>
    </nav>



    <div id="wrapper">

      <!-- Sidebar on every page for an Outreach Coordinator -->

        <ul class="sidebar navbar-nav d-none d-md-block">
            <li class="nav-item dropdown active no-arrow">
                <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">

                    <span>Programs</span>
                </a>
                <div class="dropdown-menu dropdown-menu-right">
                    <a class="dropdown-item" href="Programs.aspx">View Programs</a>
                    <a class="dropdown-item" href="ProgramTheme.aspx">View Program Themes</a>
                </div>
            </li>

            <li class="nav-item dropdown no-arrow ">
                <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">

                    <span>Animals</span>
                </a>
                <div class="dropdown-menu dropdown-menu-right">
                    <a class="dropdown-item" href="AnimalPage.aspx">View Animals</a>
                    <a class="dropdown-item" href="#" data-target="#AddAnimal" data-toggle="modal">Add New Animal</a>
                    <a class="dropdown-item" href="#" data-target="#UpdateAnimal" data-toggle="modal">Edit Animal</a>
                </div>
            </li>


            <li class="nav-item dropdown  no-arrow">
                <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">

                    <span>Organizations</span>
                </a>
                <div class="dropdown-menu dropdown-menu-right">
                    <a class="dropdown-item" href="Organizations.aspx">View Organizations</a>
                    <a class="dropdown-item" href="#" data-target="#AddOrganization" data-toggle="modal">Add New Organization</a>
                    <a class="dropdown-item" href="#" data-target="#UpdateOrganization" data-toggle="modal">Edit Organization</a>
                </div>
            </li>
             <li class="nav-item dropdown  no-arrow">
                <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">

                    <span>Invoices</span>
                </a>
                <div class="dropdown-menu dropdown-menu-right">
                    <a class="dropdown-item" href="Payment.aspx">New Invoice Form</a>
                    <a class="dropdown-item" href="Invoices.aspx">View Invoices</a>

                </div>
            </li>
            <li class="nav-item dropdown  no-arrow ">
                <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">

                    <span>Wildlife Staff</span>
                </a>
                <div class="dropdown-menu dropdown-menu-right">
                    <a class="dropdown-item" href="Staff.aspx">View Wildlife Staff</a>
                    <a class="dropdown-item" href="createUser.aspx">Add Wildlife Staff</a>
     
                </div>
            </li>
              <li class="nav-item ">
                <a class="nav-link" href="Report.aspx">

                    <span>Reports</span></a>
            </li>
             <li class="nav-item ">
                <a class="nav-link" href="Tableau.aspx">

                    <span>Visualization</span></a>
            </li>

        </ul>

        <div id="content-wrapper">


                   <!--Form to add a new staff member -->
            <div class="container-fluid ">
         
                    <div class="container1">
                        <div class="card card-register mx-auto mt-5">
                            <div class="card-header NewUserTitle text-center">Add Wildlife Center Staff</div>
                            <div class="card-body">
                                <div class="row">
                                        <div class="d-none d-md-block text-right col-md-4 InternalOrganizationForm">
                                            <h6>Staff Type<span style="COLOR: red"> *</span></h6>
                                        </div>
                                        <div class=" d-md-none text-left col-md-4 InternalOrganizationForm">
                                            <h6>Staff Type<span style="COLOR: red"> *</span></h6>
                                        </div>
                                        <div class=" col-md-8 InternalAnimalForm">
                                            
                                            <asp:DropDownList ID="ddlStaffType" class="form-control" runat="server">
                                                <asp:ListItem Text="-- Select Staff Type --" Value="0"></asp:ListItem>
                                                <asp:ListItem Text="Outreach Coordinator" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="Volunteer" Value="2"></asp:ListItem>
                                            </asp:DropDownList>&nbsp&nbsp
                                        </div>
                                    
                                    </div>
                                <div class="row">
                                        <div class="d-none d-md-block text-right col-md-4 InternalOrganizationForm">
                                            <h6>First Name<span style="COLOR: red"> *</span></h6>
                                        </div>
                                        <div class=" d-md-none text-left col-md-4 InternalOrganizationForm">
                                            <h6>First Name<span style="COLOR: red"> *</span></h6>
                                        </div>
                                        <div class=" col-md-8 InternalAnimalForm">
                                            <asp:TextBox ID="txtFirstName" runat="server" class="form-control" placeholder="First name"  ></asp:TextBox>&nbsp&nbsp
                                        </div>
                                    </div>

                                <div class="row">
                                        <div class="d-none d-md-block text-right col-md-4 InternalOrganizationForm">
                                            <h6>Last Name<span style="COLOR: red"> *</span></h6>
                                        </div>
                                        <div class=" d-md-none text-left col-md-4 InternalOrganizationForm">
                                            <h6>Last Name<span style="COLOR: red"> *</span></h6>
                                        </div>
                                        <div class=" col-md-8 InternalAnimalForm">
                                            <asp:TextBox ID="txtLastName" class="form-control" placeholder="Last name"   runat="server"></asp:TextBox>&nbsp&nbsp
                                        </div>
                                    </div>

                                  <div class="row">
                                        <div class="d-none d-md-block text-right col-md-4 InternalOrganizationForm">
                                            <h6>Email<span style="COLOR: red"> *</span></h6>
                                        </div>
                                        <div class=" d-md-none text-left col-md-4 InternalOrganizationForm">
                                            <h6>Email<span style="COLOR: red"> *</span></h6>
                                        </div>
                                        <div class=" col-md-8 InternalAnimalForm">
                                           <asp:TextBox ID="txtEmail" class="form-control" placeholder="Enter email"   runat="server"></asp:TextBox>&nbsp&nbsp
                                        </div>
                                    </div>

                                <div class="row">
                                        <div class="d-none d-md-block text-right col-md-4 InternalOrganizationForm">
                                            <h6>Phone Number<span style="COLOR: red"> *</span></h6>
                                        </div>
                                        <div class=" d-md-none text-left col-md-4 InternalOrganizationForm">
                                            <h6>Phone Number<span style="COLOR: red"> *</span></h6>
                                        </div>
                                        <div class=" col-md-8 InternalAnimalForm">
                                            <asp:TextBox ID="txtPhoneNumber" class="form-control" placeholder="Enter Phone Number"   runat="server"></asp:TextBox>&nbsp&nbsp
                                        </div>
                                    </div>
                                
                                  <div class="row">
                                        <div class="d-none d-md-block text-right col-md-4 InternalOrganizationForm">
                                            <h6>Username<span style="COLOR: red"> *</span></h6>
                                        </div>
                                        <div class=" d-md-none text-left col-md-4 InternalOrganizationForm">
                                            <h6>Username<span style="COLOR: red"> *</span></h6>
                                        </div>
                                        <div class=" col-md-8 InternalAnimalForm">
                                            <asp:TextBox ID="txtUsername" class="form-control" placeholder="Pick a username"   runat="server"></asp:TextBox>&nbsp&nbsp
                                        </div>
                                    </div>

                                  <div class="row">
                                        <div class="d-none d-md-block text-right col-md-4 InternalOrganizationForm">
                                            <h6>Password<span style="COLOR: red"> *</span></h6>
                                        </div>
                                        <div class=" d-md-none text-left col-md-4 InternalOrganizationForm">
                                            <h6>Password<span style="COLOR: red"> *</span></h6>
                                        </div>
                                        <div class=" col-md-8 InternalAnimalForm">
                                          <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" class="form-control" placeholder="Password"  ></asp:TextBox>
&nbsp&nbsp
                                        </div>
                                    </div>
                                

                                  <div class="row">
                                        
                                        <div class=" text-right col-md-4 InternalOrganizationForm">
                                           <asp:CheckBox ID="chkShowPassword" runat="server" Text="Show Password" AutoPostBack="True" OnCheckedChanged="chkShowPassword_CheckedChanged" />
&nbsp&nbsp
                                        </div>
                                        <div class=" col-md-8 InternalAnimalForm">
                                         <p runat="server" class=" PasswordReq" style="font-size: 75%;">
                                                Password must include:
                                                <br>
                                                1 Number, 1 Special Character
                                                <br>
                                                1 Capital Letter, Minimum 8 Characters 
                                            </p>
                                            <p runat="server" class=" PasswordReq" style="font-size: 75%;">&nbsp;</p>
                                        </div>
                                    </div>

                              
                                   <div class="row">
                                    <div class="col-md-4 mx-auto">
                                      
                                    
                                        <asp:Button ID="btnSubmit" class="btn btn-primary btn-login btn-block" href="ProgramForm.aspx" runat="server" OnClick="btnSubmit_Click" Text="Submit" />
                                    </div>
                                </div>


                                <asp:Label ID="lblStatus" runat="server"></asp:Label>

                                    </div>


                                <div class="text-center">
                                </div>
                            </div>
                        </div>
                    </div>

            </div>
        </div>

</asp:Content>

