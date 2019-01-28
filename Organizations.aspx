<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Organizations.aspx.cs" Inherits="Organizations" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">





    <%--                <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>--%>

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




      <nav class="navbar navbar-dark bg-dark">
  <button class="navbar-toggler d-md-none" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <a class="navbar-brand " style=" color: #FFBC7C; font-weight: 400; font-size: 150%;" href="Programs.aspx">Wildlife Center of Virginia</a>
        <div class="ml-auto row">
        <asp:Label ID="lblWelcome" runat="server" Text="" class="" style="color:#e0d7c3; margin-right: 15px;" ></asp:Label>
         <%--  <a class=" d-none d-md-block" style="color:#FFBC7C; margin-right: 15px;" href="Default.aspx">
               <span>Logout</span></a>--%>
               <asp:Button ID="logout" class=" d-none d-md-block" runat="server" style="color:#FFBC7C; cursor:pointer; margin-right: 15px; background-color:transparent; border:none;" Text="Logout" OnClick="btn_lgout_Click" CausesValidation="false" />
</div>

        <div class="collapse navbar-collapse " id="navbarTogglerDemo03">
            <ul class="navbar-nav ml-auto mt-2 mt-lg-0 d-md-none">
      <li class="nav-item dropdown no-arrow">
                <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">

                    <%--<a class="nav-link" href="Programs.aspx">--%>

                    <span>Programs</span>
                </a>
                <div class="dropdown-menu dropdown-menu-right">
                    <a class="dropdown-item" href="Programs.aspx">View Programs</a>
                    <a class="dropdown-item" href="ProgramTheme.aspx">View Program Themes</a>
                    
                </div>
            </li>
            <%--      <li class="nav-item">
          <a class="nav-link" href="AnimalPage.aspx">
            <i class="fas fa-fw fa-book-open"></i>--%>
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
        <li class="nav-item dropdown active no-arrow">
                <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">

                    <span>Organizations</span>
                </a>
                <div class="dropdown-menu dropdown-menu-right">
                    <a class="dropdown-item" href="Organizations.aspx">View Organizations</a>
                    <a class="dropdown-item" href="#" data-target="#AddOrganization" data-toggle="modal">Add New Organization</a>
                    <a class="dropdown-item" href="#" data-target="#UpdateOrganization" data-toggle="modal">Edit Organization</a>
                </div>
            </li>
             
            <li class="nav-item dropdown no-arrow ">
                <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">

                    <span>Invoices</span>
                </a>
                <div class="dropdown-menu dropdown-menu-right">
                    <a class="dropdown-item" href="Invoices.aspx">View Invoices</a>
                    <a class="dropdown-item" href="Payment.aspx">New Invoice</a>
                    
                    
                </div>
            </li>

            

             <li class="nav-item dropdown no-arrow ">
                <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">

                    <span>Wildlife Staff</span>
                </a>
                <div class="dropdown-menu dropdown-menu-right">
                    <a class="dropdown-item" href="Staff.aspx">View Wildlife Staff</a>
                    <a class="dropdown-item" href="createUser.aspx">Add Wildlife Staff</a>
                    <%--<a class="dropdown-item" href="#" data-target="#UpdateEducator" data-toggle="modal">Edit Educators</a>
                        <a class="dropdown-item" href="#" data-target="#AddVolunteer" data-toggle="modal">Add New Volunteer</a>
                        <a class="dropdown-item" href="#" data-target="#UpdateVolunteer" data-toggle="modal">Edit Volunteers</a>--%>
                </div>
            </li>
         <li class="nav-item ">
                    <a class="nav-link" href="Report.aspx">

                        <span>Reports</span></a>
                </li>
            <li class="nav-item">
                <a class="nav-link" href="Default.aspx">

                    <span>Logout</span></a>
            </li>

    </ul>

        </div>
    </nav>



    <div id="wrapper">

        <!-- Sidebar -->

        <ul class="sidebar navbar-nav d-none d-md-block">
            <li class="nav-item dropdown  no-arrow">
                <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">

                    <%--<a class="nav-link" href="Programs.aspx">--%>

                    <span>Programs</span>
                </a>
                <div class="dropdown-menu dropdown-menu-right">
                    <a class="dropdown-item" href="Programs.aspx">View Programs</a>
                    <a class="dropdown-item" href="ProgramTheme.aspx">View Program Themes</a>
                </div>
            </li>
            <%--      <li class="nav-item">
          <a class="nav-link" href="AnimalPage.aspx">
            <i class="fas fa-fw fa-book-open"></i>--%>
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

            <%--<li class="nav-item dropdown no-arrow ">
                <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">
                    <span>Reports</span>
                </a>
                <div class="dropdown-menu dropdown-menu-right">
                    <a class="dropdown-item" href="AnimalMonthlyWildlifeReport.aspx">Animal</a>
                    <a class="dropdown-item" href="MonthlyWildlifeReport.aspx">Monthly</a>
                    <a class="dropdown-item" href="YearlyWildlifeReport.aspx">Yearly</a>
                    <a class="dropdown-item" href="TabLiveReports.aspx">Live Program</a>
                    <a class="dropdown-item" href="TabOnlineProgramReports.aspx">Online Program</a>
                    <a class="dropdown-item" href="TabGradeReport.aspx">Grade</a>
                </div>
            </li>--%>
          
           
           

            <li class="nav-item dropdown active no-arrow">
                <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">

                    <span>Organizations</span>
                </a>
                <div class="dropdown-menu dropdown-menu-right">
                    <a class="dropdown-item" href="Organizations.aspx">View Organizations</a>
                    <a class="dropdown-item" href="#" data-target="#AddOrganization" data-toggle="modal">Add New Organization</a>
                    <a class="dropdown-item" href="#" data-target="#UpdateOrganization" data-toggle="modal">Edit Organization</a>
                </div>
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
            <li class="nav-item dropdown  no-arrow ">
                <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">

                    <span>Wildlife Staff</span>
                </a>
                <div class="dropdown-menu dropdown-menu-right">
                    <a class="dropdown-item" href="Staff.aspx">View Wildlife Staff</a>
                    <a class="dropdown-item" href="createUser.aspx">Add Wildlife Staff</a>
                    <%--<a class="dropdown-item" href="#" data-target="#UpdateEducator" data-toggle="modal">Edit Educators</a>
                        <a class="dropdown-item" href="#" data-target="#AddVolunteer" data-toggle="modal">Add New Volunteer</a>
                        <a class="dropdown-item" href="#" data-target="#UpdateVolunteer" data-toggle="modal">Edit Volunteers</a>--%>
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
            <%--<li class="nav-item">
                <a class="nav-link" href="createUser.aspx">
                    <span>Create Outreach Coordinator Access</span></a>
            </li>--%>
        </ul>











        <div id="content-wrapper">
            <div class="container-fluid ">


                <section class="login-block  col-xl-10 col-lg-10 col-md-12 col-s-12 mx-auto ">
                    <%--<section class="card card-register mx-auto mt-5">--%>
                    <div class="container1">
                        <div class="card  mx-auto mt-3">
                            <div class="card-header NewUserTitle text-center">
                                Organization Listing
                            </div>
                            <div class="card-body">
                                <div class="mx-auto d-flex justify-content-center">
                                    <div class="btn btn-primary btn-inside" data-target="#AddOrganization" data-toggle="modal"><i class="fas fa-plus" style="margin-right:5px;"></i>Add Organization</div>
                                    <div class="btn btn-primary btn-inside" data-target="#UpdateOrganization" data-toggle="modal"><i class="fas fa-pencil-alt " style="margin-right:5px;" > </i>Edit Organization</div>
                                    <div class="btn btn-primary btn-inside" data-target="#AddContact" data-toggle="modal"><i class="fas fa-plus" style="margin-right:5px;"></i>Add Contact</div>
                                </div>
                            </div>









                            <div class="col-lg-12 col-md-12 col-s-12 mx-auto">
                                <div class="container1 block">
                                    <%--update organization--%>
                                     <div class="modal fade" id="UpdateOrganization" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content mt-5">
                    <div class="modal-header ">
                        <h5 class="modal-title text-center" style="font-size: 145% !important; color: #e2561d !important;">Edit Organization</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="ddlOrganization" EventName="SelectedIndexChanged" />
                        </Triggers>
                        <ContentTemplate>
                            <div class="modal-body">
                                <div runat="server" id="OrganizationupdateDiv">
                                    <p>&nbsp;</p>
                                    <div class="row">
                                        <div class="d-none d-md-block text-right col-md-4 InternalOrganizationForm">
                                            <h6>Select Organization</h6>
                                        </div>
                                        <div class=" d-md-none text-left col-md-4 InternalOrganizationForm">
                                            <h6>Select Organization</h6>
                                        </div>
                                        <div class=" col-md-8 InternalAnimalForm">
                                            <asp:DropDownList ID="ddlOrganization" runat="server" class="form-control" AppendDataBoundItems="false" AutoPostBack="true" DataTextField="OrgName" DataValueField="OrgID" OnSelectedIndexChanged="ddlOrganization_SelectedIndexChanged1">
                                                <asp:ListItem>--Select Organization--</asp:ListItem>
                                            </asp:DropDownList>&nbsp&nbsp
                                    &nbsp;&nbsp;
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="d-none d-md-block text-right col-md-4 InternalOrganizationForm">
                                            <h6>Organization Name</h6>
                                        </div>
                                        <div class=" d-md-none text-left col-md-4 InternalOrganizationForm">
                                            <h6>Organization Name</h6>
                                        </div>
                                        <div class=" col-md-8 InternalAnimalForm">
                                            <asp:TextBox ID="txtOrgName" class="form-control" runat="server"></asp:TextBox>&nbsp&nbsp
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="d-none d-md-block text-right col-md-4 InternalOrganizationForm">
                                            <h6>Street Address</h6>
                                        </div>
                                        <div class=" d-md-none text-left col-md-4 InternalOrganizationForm">
                                            <h6>Street Address</h6>
                                        </div>
                                        <div class=" col-md-8 InternalAnimalForm">
                                            <asp:TextBox ID="txtStreetAddress2" class="form-control" runat="server"></asp:TextBox>&nbsp&nbsp
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="d-none d-md-block text-right col-md-4 InternalOrganizationForm">
                                            <h6>City</h6>
                                        </div>
                                        <div class=" d-md-none text-left col-md-4 InternalOrganizationForm">
                                            <h6>City</h6>
                                        </div>
                                        <div class=" col-md-8 InternalAnimalForm">

                                            <asp:TextBox ID="txtCity" class="form-control" runat="server"></asp:TextBox>&nbsp&nbsp
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="d-none d-md-block text-right col-md-4 InternalOrganizationForm">
                                            <h6>County</h6>
                                        </div>
                                        <div class=" d-md-none text-left col-md-4 InternalOrganizationForm">
                                            <h6>County</h6>
                                        </div>
                                        <div class=" col-md-8 InternalAnimalForm">
                                            <asp:TextBox ID="txtCounty" class="form-control" runat="server"></asp:TextBox>&nbsp&nbsp
                                        </div>
                                    </div>


                                    <div class="row">
                                        <div class=" text-right col-md-4 InternalOrganizationForm">
                                            <h6>State</h6>
                                        </div>
                                        <div class=" col-md-8 InternalOrgnaizationForm">
                                            <asp:DropDownList ID="ddlState2" class="form-control" runat="server" placeholder="Add State/Province">

                                                <asp:ListItem>--Select State--</asp:ListItem>
                                                <asp:ListItem Value="Non-USA Territory"></asp:ListItem>
                                                <asp:ListItem Value="AL"></asp:ListItem>
                                                <asp:ListItem Value="AK"></asp:ListItem>
                                                <asp:ListItem Value="AZ"></asp:ListItem>
                                                <asp:ListItem Value="AR"></asp:ListItem>
                                                <asp:ListItem Value="CA"></asp:ListItem>
                                                <asp:ListItem Value="CO"></asp:ListItem>
                                                <asp:ListItem Value="CT"></asp:ListItem>
                                                <asp:ListItem Value="DE"></asp:ListItem>
                                                <asp:ListItem Value="FL"></asp:ListItem>
                                                <asp:ListItem Value="GA"></asp:ListItem>
                                                <asp:ListItem Value="HI"></asp:ListItem>
                                                <asp:ListItem Value="ID"></asp:ListItem>
                                                <asp:ListItem Value="IL"></asp:ListItem>
                                                <asp:ListItem Value="IN"></asp:ListItem>
                                                <asp:ListItem Value="IA"></asp:ListItem>
                                                <asp:ListItem Value="KS"></asp:ListItem>
                                                <asp:ListItem Value="KY"></asp:ListItem>
                                                <asp:ListItem Value="LA"></asp:ListItem>
                                                <asp:ListItem Value="ME"></asp:ListItem>
                                                <asp:ListItem Value="MD"></asp:ListItem>
                                                <asp:ListItem Value="MA"></asp:ListItem>
                                                <asp:ListItem Value="MI"></asp:ListItem>
                                                <asp:ListItem Value="MN"></asp:ListItem>
                                                <asp:ListItem Value="MS"></asp:ListItem>
                                                <asp:ListItem Value="MO"></asp:ListItem>
                                                <asp:ListItem Value="MT"></asp:ListItem>
                                                <asp:ListItem Value="NE"></asp:ListItem>
                                                <asp:ListItem Value="NV"></asp:ListItem>
                                                <asp:ListItem Value="NH"></asp:ListItem>
                                                <asp:ListItem Value="NJ"></asp:ListItem>
                                                <asp:ListItem Value="NM"></asp:ListItem>
                                                <asp:ListItem Value="NY"></asp:ListItem>
                                                <asp:ListItem Value="NC"></asp:ListItem>
                                                <asp:ListItem Value="ND"></asp:ListItem>
                                                <asp:ListItem Value="OH"></asp:ListItem>
                                                <asp:ListItem Value="OK"></asp:ListItem>
                                                <asp:ListItem Value="OR"></asp:ListItem>
                                                <asp:ListItem Value="PA"></asp:ListItem>
                                                <asp:ListItem Value="RI"></asp:ListItem>
                                                <asp:ListItem Value="SC"></asp:ListItem>
                                                <asp:ListItem Value="SD"></asp:ListItem>
                                                <asp:ListItem Value="TN"></asp:ListItem>
                                                <asp:ListItem Value="TX"></asp:ListItem>
                                                <asp:ListItem Value="UT"></asp:ListItem>
                                                <asp:ListItem Value="VT"></asp:ListItem>
                                                <asp:ListItem Value="VA"></asp:ListItem>
                                                <asp:ListItem Value="WA"></asp:ListItem>
                                                <asp:ListItem Value="WV"></asp:ListItem>
                                                <asp:ListItem Value="WI"></asp:ListItem>
                                                <asp:ListItem Value="WY"></asp:ListItem>
                                            </asp:DropDownList>

                                        </div>
                                    </div>
                                    <p></p>
                                    <div class="row">
                                        <div class="d-none d-md-block text-right col-md-4 InternalOrganizationForm">
                                                <h6>Postal Code</h6>
                                            </div>
                                            <div class=" d-md-none text-left col-md-4 InternalOrganizationForm">
                                                <h6>Postal Code</h6>
                                            </div>
                                        
                                            <div class=" col-md-8 InternalOrgnaizationForm">
                                                <asp:TextBox ID="txtPostalCode2" class="form-control" runat="server"></asp:TextBox>&nbsp;&nbsp;

                                            </div>
                                        
                                        </div>
                                        <div class="row">
                                            <div class="d-none d-md-block text-right col-md-4 InternalOrganizationForm">
                                                <h6>Primary Contact</h6>
                                            </div>
                                            <div class=" d-md-none text-left col-md-4 InternalOrganizationForm">
                                                <h6>Primary Contact</h6>
                                            </div>
                                            <div class=" col-md-8 InternalAnimalForm">
                                                <asp:DropDownList ID="ddlContacts" runat="server" class="form-control" AppendDataBoundItems="false">
                                                    <asp:ListItem>--Select Primary Contact--</asp:ListItem>
                                                </asp:DropDownList>&nbsp&nbsp
                                    &nbsp;&nbsp;
                                            </div>
                                        </div>

                                        <div>
                                            <div class="row">
                                                <div class=" col-12">
                                                    <br />
                                                </div>

                                            </div>
                                        </div>
                                        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>&nbsp;
            <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                                    
                                    </div>
                                </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                
                <div class="modal-footer">

                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <asp:Button ID="btnUpdate" class="btn btn-primary btn-inside" runat="server" Text="Save Changes" OnClick="btnUpdateOrganization_Click" />

                    </div>
                </div>
            </div>
        </div>
        </div>

                                    <%--start--%>
                                    <div class="modal fade" id="AddContact" tabindex="-1" role="dialog">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content mt-5">
                                                <div class="modal-header">
                                                    <h5 class="modal-title text-center" style="font-size: 145% !important; color: #e2561d !important;">Add Contact</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <div runat="server" id="OrgAddDiv">
                                                        <p>&nbsp;</p>
                                                        <div class="row">
                                                            <div class=" text-right col-md-4 InternalOrganizationForm">
                                                                <h6>Organization</h6>
                                                            </div>
                                                            <div class=" col-md-8 InternalOrgnaizationForm">
                                                                <asp:DropDownList ID="ddlOrg" class="form-control" runat="server">
                                                                    <asp:ListItem Text="--Select Organization--" Value=""></asp:ListItem>
                                                                </asp:DropDownList>&nbsp;&nbsp;
                                                            </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="d-none d-md-block text-right col-md-4 InternalOrganizationForm">
                                                                    <h6>Contact First Name</h6>
                                                                </div>
                                                                <div class=" d-md-none text-left col-md-4 InternalOrganizationForm">
                                                                    <h6>Contact First Name</h6>
                                                                </div>
                                                                <div class=" col-md-8 InternalOrgnaizationForm">
                                                                    <asp:TextBox ID="txtContactFirstName" class="form-control" runat="server"></asp:TextBox>&nbsp;&nbsp;
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="d-none d-md-block text-right col-md-4 InternalOrganizationForm">
                                                                    <h6>Contact Last Name</h6>
                                                                </div>
                                                                <div class=" d-md-none text-left col-md-4 InternalOrganizationForm">
                                                                    <h6>Contact Last Name</h6>
                                                                </div>
                                                                <div class=" col-md-8 InternalOrgnaizationForm">
                                                                    <asp:TextBox ID="txtContactLastName" class="form-control" runat="server"></asp:TextBox>&nbsp;&nbsp;
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="d-none d-md-block text-right col-md-4 InternalOrganizationForm">
                                                                    <h6>Contact Email</h6>
                                                                </div>
                                                                <div class=" d-md-none text-left col-md-4 InternalOrganizationForm">
                                                                    <h6>Contact Email</h6>
                                                                </div>
                                                                <div class=" col-md-8 InternalOrgnaizationForm">
                                                                    <asp:TextBox ID="txtContactEmail" class="form-control" runat="server"></asp:TextBox>&nbsp;&nbsp;
                                                                </div>
                                                            </div>


                                                            <div>
                                                            </div>

                                                        
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                        <asp:Button ID="btnAddContact" class="btn btn-primary btn-inside" runat="server" Text="Add" OnClick="btnAddContact_Click" />
                                                        <%-- <button type="button" class="btn btn-primary btn-inside">Save changes</button>--%>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <%-- this div  is the internal div--%>







                                       <div class="modal " id="AddOrganization" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content mt-5">
                    <div class="modal-header">
                        <h5 class="modal-title text-center" style="font-size: 145% !important; color: #e2561d !important;">Add New Organization</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body locationField">
                        <div runat="server" id="Div6">
                            <p>&nbsp;</p>
                            <div class="row">
                                <div class="d-none d-md-block text-right col-md-4 InternalOrganizationForm">
                                    <h6>Organization Name</h6>
                                </div>
                                <div class=" d-md-none text-left col-md-4 InternalOrganizationForm">
                                    <h6>Organization Name</h6>
                                </div>
                                <div class=" col-md-8 InternalOrgnaizationForm">
                                    <asp:TextBox ID="textOrgName" class="form-control" runat="server"></asp:TextBox>&nbsp;&nbsp;
                                </div>
                            </div>
                             <div class="row">
                                <div class="d-none d-md-block text-right col-md-4 InternalOrganizationForm">
                                    <h6>Enter Address</h6>
                                </div>
                                <div class=" d-md-none text-left col-md-4 InternalOrganizationForm">
                                    <h6>Enter Address</h6>
                                </div>
                                <div class=" col-md-8 InternalOrgnaizationForm">
                                   <%-- <asp:TextBox ID="autocomplete" placeholder="Enter your address" runat="server" onFocus="geolocate()"></asp:TextBox>&nbsp;&nbsp;--%>
                                    <input  id="autocomplete" class="form-control" placeholder="Enter your address"  onFocus="geolocate()"  type="text"/>&nbsp;&nbsp;
                                </div>
                            </div>



                            <hr />
                              
                             <div class="row">
                               <div class="d-none d-md-block text-right col-md-4 InternalOrganizationForm">
                                    <h6>Street Address</h6>
                                </div>
                                <div class=" d-md-none text-left col-md-4 InternalOrganizationForm">
                                    <h6>Street Address</h6>
                                </div>
                                <div class=" col-md-8 InternalOrgnaizationForm">
                                   <%-- <asp:TextBox ID="txtStreetAddress" runat="server"></asp:TextBox>&nbsp;&nbsp;--%>
                                    <input id='txtStreetAddress' name='' value=''class="form-control" >&nbsp;&nbsp;
                                    <input id="hiddenControl" type="hidden" runat="server" />
                                </div>
                            </div>

                            <div class="row">
                               <div class="d-none d-md-block text-right col-md-4 InternalOrganizationForm">
                                    <h6>City</h6>
                                </div>
                                <div class=" d-md-none text-left col-md-4 InternalOrganizationForm">
                                    <h6>City</h6>
                                </div>
                                <div class=" col-md-8 InternalOrgnaizationForm">
                                    <%--<asp:TextBox ID="textOrgCity" runat="server"></asp:TextBox>--%>
                                      <input id="textOrgCity" name='' value='' class="form-control">&nbsp;&nbsp;
                                    <input id="hiddenCity" type="hidden" runat="server" />
                                </div>
                            </div>
                            <div class="row">
                              <div class="d-none d-md-block text-right col-md-4 InternalOrganizationForm">
                                    <h6>County</h6>
                                </div>
                                <div class=" d-md-none text-left col-md-4 InternalOrganizationForm">
                                    <h6>County</h6>
                                </div>
                                <div class=" col-md-8 InternalOrgnaizationForm">
                                    <asp:TextBox ID="textOrgCounty" class="form-control" runat="server"></asp:TextBox>&nbsp;&nbsp;
                                   
                                     
                                </div>
                            </div>

                            <div class="row">
                                <div class=" text-right col-md-4 InternalOrganizationForm">
                                    <h6>State</h6>
                                </div>
                                <div class=" col-md-8 InternalOrgnaizationForm">
                                    <%--<asp:DropDownList ID="ddlState" class="btn btn-secondary btn-sm dropdown-toggle" style="background-color: #FFFfff !important; color: #732700 !important; border-color:grey;" runat="server" placeholder="Add State/Province">
                                        <asp:ListItem>--Select State--</asp:ListItem>
                                        <asp:ListItem Value="Non-USA Territory"></asp:ListItem>
                                        <asp:ListItem Value="AL"></asp:ListItem>
                                        <asp:ListItem Value="AK"></asp:ListItem>
                                        <asp:ListItem Value="AZ"></asp:ListItem>
                                        <asp:ListItem Value="AR"></asp:ListItem>
                                        <asp:ListItem Value="CA"></asp:ListItem>
                                        <asp:ListItem Value="CO"></asp:ListItem>
                                        <asp:ListItem Value="CT"></asp:ListItem>
                                        <asp:ListItem Value="DE"></asp:ListItem>
                                        <asp:ListItem Value="FL"></asp:ListItem>
                                        <asp:ListItem Value="GA"></asp:ListItem>
                                        <asp:ListItem Value="HI"></asp:ListItem>
                                        <asp:ListItem Value="ID"></asp:ListItem>
                                        <asp:ListItem Value="IL"></asp:ListItem>
                                        <asp:ListItem Value="IN"></asp:ListItem>
                                        <asp:ListItem Value="IA"></asp:ListItem>
                                        <asp:ListItem Value="KS"></asp:ListItem>
                                        <asp:ListItem Value="KY"></asp:ListItem>
                                        <asp:ListItem Value="LA"></asp:ListItem>
                                        <asp:ListItem Value="ME"></asp:ListItem>
                                        <asp:ListItem Value="MD"></asp:ListItem>
                                        <asp:ListItem Value="MA"></asp:ListItem>
                                        <asp:ListItem Value="MI"></asp:ListItem>
                                        <asp:ListItem Value="MN"></asp:ListItem>
                                        <asp:ListItem Value="MS"></asp:ListItem>
                                        <asp:ListItem Value="MO"></asp:ListItem>
                                        <asp:ListItem Value="MT"></asp:ListItem>
                                        <asp:ListItem Value="NE"></asp:ListItem>
                                        <asp:ListItem Value="NV"></asp:ListItem>
                                        <asp:ListItem Value="NH"></asp:ListItem>
                                        <asp:ListItem Value="NJ"></asp:ListItem>
                                        <asp:ListItem Value="NM"></asp:ListItem>
                                        <asp:ListItem Value="NY"></asp:ListItem>
                                        <asp:ListItem Value="NC"></asp:ListItem>
                                        <asp:ListItem Value="ND"></asp:ListItem>
                                        <asp:ListItem Value="OH"></asp:ListItem>
                                        <asp:ListItem Value="OK"></asp:ListItem>
                                        <asp:ListItem Value="OR"></asp:ListItem>
                                        <asp:ListItem Value="PA"></asp:ListItem>
                                        <asp:ListItem Value="RI"></asp:ListItem>
                                        <asp:ListItem Value="SC"></asp:ListItem>
                                        <asp:ListItem Value="SD"></asp:ListItem>
                                        <asp:ListItem Value="TN"></asp:ListItem>
                                        <asp:ListItem Value="TX"></asp:ListItem>
                                        <asp:ListItem Value="UT"></asp:ListItem>
                                        <asp:ListItem Value="VT"></asp:ListItem>
                                        <asp:ListItem Value="VA"></asp:ListItem>
                                        <asp:ListItem Value="WA"></asp:ListItem>
                                        <asp:ListItem Value="WV"></asp:ListItem>
                                        <asp:ListItem Value="WI"></asp:ListItem>
                                        <asp:ListItem Value="WY"></asp:ListItem>
                                    </asp:DropDownList>--%>
                                     <input id='state' name='' value='' class="form-control">&nbsp;&nbsp;
                                    <input id="hiddenState" type="hidden" runat="server" />
                                </div>
                            </div>

                            <div class="row">
                                <div class=" text-right col-md-4 InternalOrganizationForm">
                                    <h6>Postal Code</h6>
                                </div>
                                <div class=" col-md-8 InternalOrgnaizationForm">
                                   <%-- <asp:TextBox ID="txtPostalCode" runat="server"></asp:TextBox>--%>
                                     <input id='txtPostalCode' name='' value='' class="form-control">&nbsp;&nbsp;
                                    <input id="hiddenZip" type="hidden" runat="server" />
                                </div>
                            </div>

                            <div class="row">
                                <div class=" text-right col-md-4 InternalOrganizationForm">
                                    <h6> Primary Contact First Name</h6>
                                </div>
                                <div class=" col-md-8 InternalOrgnaizationForm">
                                    <asp:TextBox ID="contactFirstName1" class="form-control" runat="server"></asp:TextBox>&nbsp;&nbsp;
                                </div>
                            </div>

                            <div class="row">
                                <div class=" text-right col-md-4 InternalOrganizationForm">
                                    <h6>Primary Contact Last Name</h6>
                                </div>
                                <div class=" col-md-8 InternalOrgnaizationForm">
                                    <asp:TextBox ID="contactLastName1" class="form-control" runat="server"></asp:TextBox>&nbsp;&nbsp;
                                </div>
                            </div>

<%--                            <div class="row">
                                <div class=" text-right col-md-4 InternalOrganizationForm">
                                    <h6>Primary Contact Phone Number</h6>
                                </div>
                                <div class=" col-md-8 InternalOrgnaizationForm">
                                    <asp:TextBox ID="txtPhoneNumber" runat="server"></asp:TextBox>&nbsp;&nbsp;
                                </div>
                            </div>--%>

                            <div class="row">
                                <div class=" text-right col-md-4 InternalOrganizationForm">
                                    <h6>Primary Contact Email</h6>
                                </div>
                                <div class=" col-md-8 InternalOrgnaizationForm">
                                    <asp:TextBox ID="txtEmail" class="form-control" runat="server"></asp:TextBox>&nbsp;&nbsp;
                                </div>
                            </div>

                         </div>
    
          


   <%-- <div id="locationField">--%>
      <%--  <input  id="autocomplete" placeholder="Enter your address"
               onFocus="geolocate()" type="text"></input>--%>
    </div>


<%-- DO NOT DELETE THIS TABLE--%>
    <table id="address" class="d-none">
       <tr>
            <td class="auto-style1">Street address</td>
            <td class="auto-style2">
                <input class="field" id="street_number"
                       disabled="true"></input>
            </td>
            <td class="auto-style3" colspan="2">
                <input class="field" id="route"
                       disabled="true"></input>
            </td>
        </tr>
        <tr>
            <td class="label">City</td>
            <!-- Note: Selection of address components in this example is typical.
                 You may need to adjust it for the locations relevant to your app. See
                 https://developers.google.com/maps/documentation/javascript/examples/places-autocomplete-addressform
            -->
            <td class="wideField" colspan="3">
                <input class="field" id="locality"
                       disabled="true"></input>
            </td>
        </tr>
        <tr>
            <td class="label">State</td>
            <td class="slimField">
                <input class="field"
                       id="administrative_area_level_1" disabled="true"></input>
            </td>
            <td class="label">Zip code</td>
            <td class="wideField">
                <input class="field" id="postal_code"
                       disabled="true"></input>
            </td>
        </tr>
        <tr>
            <td class="label">Country</td>
            <td class="wideField" colspan="3">
                <input class="field"
                       id="country" disabled="true"></input>
            </td>
        </tr>
    </table>

 
   
  
  
   
 <%--  <input id='countryName' name='' value='' class=''>&nbsp;&nbsp;
      empty<input id='empty' name='' value='' class=''>--%>
    
                   <%--         
                       </div>--%>
                   <%-- </div>--%>
                    <div class="modal-footer">
 <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <asp:Button ID="btnAddOrg" class="btn btn-primary btn-inside" runat="server" Text="Submit" OnClick="btnAddOrg_Click" />
                        <%-- <button type="button" class="btn btn-primary btn-inside">Save changes</button>--%>
                       
                    </div>
                </div>
            </div>
        </div>


                                    <div class="col-lg-12 col-md-12 col-s-12 mx-auto">
                                        <div class="container1 block">


                                            <%--</div>--%>

                                            <script>
                                                $(function () {
                                                    $('a[data-toggle="tab"]').on('click', function (e) {
                                                        window.localStorage.setItem('activeTab', $(e.target).attr('href'));
                                                    });
                                                    var activeTab = window.localStorage.getItem('activeTab');
                                                    if (activeTab) {
                                                        $('#myTab a[href="' + activeTab + '"]').tab('show');
                                                        window.localStorage.removeItem("activeTab");
                                                    }
                                                });       </script>

                                            <%-- this div  is the internal div--%>



                                            <ul class="nav nav-tabs" role="tablist" id="myTab">
        <li role="presentation" class=""><a href="#OrganizationsAllTab" class="nav-link  active  TabStyle" style="color:black;" aria-controls="home" role="tab" data-toggle="tab">All Organizations</a></li>
        <li role="presentation"><a href="#ContactsTab" style="color:black;" class="nav-link    TabStyle" aria-controls="profile" role="tab" data-toggle="tab">Organization Contacts</a></li>
        
      
    </ul>


                                            <%--<ul class="nav nav-tabs block4" id="myTab" role="tablist">
                                                <li class="nav-item">
                                                    <a class="nav-link active TabStyle" id="AllTabNav" data-toggle="tab" href="#OrganizationsAllTab" style="color: black;">
                                                        <p class="d-none d-lg-block">All Organizations</p>
                                                        <p class="d-lg-none">All </p>
                                                    </a>
                                                </li>
                                                <li class="nav-item">
                                                    <a class="nav-link TabStyle" id="LiveTabNav" data-toggle="tab" href="#ContactsTab" style="color: black;">
                                                        <p class="d-none d-lg-block">Organization Contacts</p>
                                                        <p class="d-lg-none">Active </p>
                                                    </a>
                                                </li>
                                            </ul>--%>


                                            <div class="tab-content">
                                                <div id="OrganizationsAllTab" class="tab-pane show active">
                                                    <div class="InternalOrganizationsTab">
                                                        <br />
                                                        <div class="row">
                                                            <%-- for Org listing--%>
                                                            <div class=" mx-auto d-flex justify-content-center col-xl-4 col-lg-6 col-md-6 col-sm-12 col-xs-12 InternalAnimalForm">
                                                                <asp:DropDownList ID="ddlOrderBy" runat="server" visible="false" CssClass="form-control" AppendDataBoundItems="false" AutoPostBack="true" DataValueField="">
                                                                    <asp:ListItem>--Order By--</asp:ListItem>
                                                                    <%--<asp:ListItem>Program Date</asp:ListItem>--%>
                                                                    <asp:ListItem>Organization Name A-Z</asp:ListItem>
                                                                    <asp:ListItem>City A-Z</asp:ListItem>
                                                                    <asp:ListItem>County A-Z</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </div>
                                                            <div class=" mx-auto d-flex justify-content-center col-xl-4 col-lg-6 col-md-5 col-sm-12 col-xs-12 InternalAnimalForm">
                                                                <div class="form-check-inline">
                                                                    <asp:TextBox class="InternalAnimalForm form-control" Style="margin-bottom: 5px; margin-right:5px;" ID="txtSearch" runat="server"></asp:TextBox>
                                                                    <asp:Button ID="btnSearch" runat="server" class="btn" Style=" background-color: #C7BFC4; margin-bottom: 5px; margin-right:5px;" Text="Search" OnClick="btnSearch_Click" />
                                                                    <asp:Button ID="btnAllClear" runat="server" class="btn " Style="margin-bottom: 5px; margin-right: 5px;" Text="Clear Filters" OnClick="btnAllClear_Click" />
                                                                    &nbsp;&nbsp;&nbsp;
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <br />

                                                        <div runat="server" id="OrganizationSearchDiv">
                                                            <div runat="server" id="ViewOrganizations">
                                                            </div>

                                                            <div class="block3">
                                                                <div class="tab-content">
                                                                    <div class="">
                                                                        <div class="col-md-12 ">
                                                                            <br />
                                                                            <div class=" text-center">
                                                                                <h6 class="ReportTitle">Search Results</h6>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row table-responsive mx-auto d-flex  justify-content-center">
                                                                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
                                                                            <asp:GridView ID="gridSearch" class="table table-striped table-bordered table-condensed table-hover" HeaderStyle-BackColor="#C7BFC4"
                                                                                HeaderStyle-ForeColor="Black" runat="server" AutoGenerateColumns="False" AllowSorting ="true">
                                                                                <Columns>
                                                                                    <asp:BoundField DataField="OrgName" HeaderText="Organization Name" SortExpression="OrgName" />
                                                                                    <asp:BoundField DataField="StreetAddress" HeaderText="Street Address" SortExpression="StreetAddress" />
                                                                                    <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                                                                                    <asp:BoundField DataField="County" HeaderText="County" SortExpression="County" />
                                                                                    <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                                                                                    <asp:BoundField DataField="PostalCode" HeaderText="Postal Code" SortExpression="PostalCode" />
                                                                                </Columns>
                                                                            </asp:GridView>
                                                                            <br />
                                                                            <br />
                                                                            <br />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>


                                                        <div class="grid-volunteers text-center">
                                                            <div class="row table-responsive mx-auto d-flex  justify-content-center">
                                                                <div class="col-xl-12 col-lg-10 col-md-12 col-sm-12 col-xs-12 ">
                                                                    <asp:GridView ID="GridView1" class="table table-striped table-bordered table-condensed table-hover" HeaderStyle-BackColor="#C7BFC4"
                                                                                HeaderStyle-ForeColor="Black" runat="server" AutoGenerateColumns="False" AllowSorting ="true" DataSourceID ="SqlDataSource4">
                                                                        <Columns>
                                                                            <asp:BoundField DataField="OrgName" HeaderText="Organization Name" SortExpression="OrgName"></asp:BoundField>
                                                                            <asp:BoundField DataField="StreetAddress" HeaderText="Street Address" SortExpression="StreetAddress"></asp:BoundField>
                                                                            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City"></asp:BoundField>
                                                                            <asp:BoundField DataField="County" HeaderText="County" SortExpression="County"></asp:BoundField>
                                                                            <asp:BoundField DataField="State" HeaderText="State" SortExpression="State"></asp:BoundField>
                                                                            <asp:BoundField DataField="PostalCode" HeaderText="Postal Code" SortExpression="PostalCode"></asp:BoundField>

                                                                        </Columns>

                                                                    </asp:GridView>
                                                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:WildTekConnectionString %>"
                                                                        SelectCommand="SELECT [OrgName], [StreetAddress], [City], [County], [State], [PostalCode] FROM [Organization] ORDER BY [OrgName]"></asp:SqlDataSource>
                                                                </div>
                                                            </div>
                                                        </div>
                                                         
                                                    </div>
                                             <%--OnClick="btnExportLive_Click"--%>
                                                        <div class="mx-auto d-flex justify-content-center  col-lg-3    col-md-4 col-sm-6 ">
                                                            <asp:Button ID="btnExportOrg" runat="server" Text="Export to Excel" OnClick="btnExportOrg_Click" class="btn btn-primary btn-inside btn-block"></asp:Button>

                                                        </div>
                                                </div>



                                                <div id="ContactsTab" class="tab-pane show ">
                                                    <div class="InternalAnimalTab">
                                                        <br />
                                                        <div class="row">
                                                            <%--for contact listing--%>
                                                            <div class=" mx-auto d-flex justify-content-center col-xl-4 col-lg-6 col-md-6 col-sm-12 col-xs-12 InternalAnimalForm">
                                                                <asp:DropDownList ID="ddlContactOrderBy" runat="server" class="btn btn-secondary btn-sm dropdown-toggle" Style="background-color: #FFFfff !important; color: #732700 !important; border-color: grey;" 
                                                                    AppendDataBoundItems="false" AutoPostBack="true" visible="false" DataValueField="">
                                                                    <asp:ListItem>--Order By--</asp:ListItem>
                                                                    <%--<asp:ListItem>Program Date</asp:ListItem>--%>
                                                                    <asp:ListItem>Organization Name A-Z</asp:ListItem>
                                                                    <asp:ListItem>Contact First Name A-Z</asp:ListItem>
                                                                    <asp:ListItem>Contact Last Name A-Z</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </div>
                                                            <div class=" mx-auto d-flex justify-content-center col-xl-4 col-lg-6 col-md-5 col-sm-12 col-xs-12 InternalAnimalForm">
                                                                <div class="form-check-inline">
                                                                    <asp:TextBox class="InternalAnimalForm form-control" ID="txtContactSearch" Style="margin-bottom: 5px; margin-right: 5px;" runat="server"></asp:TextBox>
                                                                    <asp:Button ID="btnContactSearch" runat="server" class="btn" Style=" background-color: #C7BFC4; margin-bottom: 5px; margin-right: 5px;" Text="Search" OnClick="btnContactSearch_Click" />
                                                                    <asp:Button ID="btnContactClear" runat="server" class="btn " Style="margin-bottom: 5px; margin-right: 5px;" Text="Clear Filters" OnClick="btnContactClear_Click" />
                                                                    &nbsp;&nbsp;&nbsp;
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <br />
                                                        <div runat="server" id="ContactSearchDiv">
                                                            
                                                            <div class="block3">
                                                                <div class="tab-content">
                                                                    <div class="">
                                                                        <div class="col-md-12 ">
                                                                            <br />
                                                                            <div class=" text-center">
                                                                                <h6 class="ReportTitle">Search Results</h6>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row table-responsive mx-auto d-flex  justify-content-center">
                                                                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
                                                                            <asp:GridView ID="ContactSearchGrid" class="table table-striped table-bordered table-condensed table-hover" HeaderStyle-BackColor="#C7BFC4"
                                                                                HeaderStyle-ForeColor="Black" runat="server" AllowSorting ="true" AutoGenerateColumns="False">
                                                                                <Columns>
                                                                                    <asp:BoundField DataField="OrgName" HeaderText="Organization Name" SortExpression="OrgName" />
                                                                                    <asp:BoundField DataField="ContactFirstName" HeaderText="Contact First Name" SortExpression="ContactFirstName" />
                                                                                    <asp:BoundField DataField="ContactLastName" HeaderText="Contact Last Name" SortExpression="ContactLastName" />
                                                                                    <asp:BoundField DataField="ContactEmail" HeaderText="Contact Email" SortExpression="ContactEmail" />
                                                                                    <asp:BoundField DataField="PrimaryContact" HeaderText="Primary Contact" SortExpression="PrimaryContact" />
                                                                                </Columns>
                                                                            </asp:GridView>
                                                                            <br />
                                                                            <br />
                                                                            <br />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>


                                                        <div class="grid-volunteers text-center">
                                                            <div class="row table-responsive mx-auto d-flex  justify-content-center">
                                                                <div class="col-xl-12 col-lg-10 col-md-12 col-sm-12 col-xs-12 ">
                                                                    <asp:GridView ID="GridView3" class="table table-striped table-bordered table-condensed table-hover" HeaderStyle-BackColor="#C7BFC4"
                                                                                HeaderStyle-ForeColor="Black" runat="server" AllowSorting ="true" AutoGenerateColumns="False" DataSourceID ="SqlDataSource2">
                                                                        <Columns>
                                                                            <asp:BoundField DataField="OrgName" HeaderText="Organization Name" SortExpression="OrgName"></asp:BoundField>
                                                                            <asp:BoundField DataField="ContactFirstName" HeaderText="Contact First Name" SortExpression="ContactFirstName"></asp:BoundField>
                                                                            <asp:BoundField DataField="ContactLastName" HeaderText="Contact Last Name" SortExpression="ContactLastName"></asp:BoundField>
                                                                            <asp:BoundField DataField="ContactEmail" HeaderText="Contact Email" SortExpression="ContactEmail"></asp:BoundField>
                                                                            <asp:BoundField DataField="PrimaryContact" HeaderText="Primary Contact" SortExpression="PrimaryContact"></asp:BoundField>


                                                                        </Columns>

                                                                    </asp:GridView>
                                                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:WildTekConnectionString %>"
                                                                        SelectCommand="SELECT o.[OrgName] as OrgName, c.[ContactFirstName] as ContactFirstName, c.[ContactLastName] as ContactLastName, c.[ContactEmail] as ContactEmail, c.[PrimaryContact] as PrimaryContact FROM [Organization] as o Right Join [ContactInformation] as c on o.OrgID = c.OrgID ORDER BY [OrgName]"></asp:SqlDataSource>
                                                                </div>
                                                            </div>
                                                        </div>

                                                         <%--OnClick="btnExportLive_Click"--%>
                                                        <div class="mx-auto d-flex justify-content-center  col-lg-3    col-md-4 col-sm-6 ">
                                                            <asp:Button ID="btnContactsExport" runat="server" Text="Export to Excel" OnClick="btnContactOrg_Click" class="btn btn-primary btn-inside btn-block"></asp:Button>

                                                        </div>


                                                         




                                                    </div>
                                                </div>

                                            </div>
                                        </div>


                                    </div>
                                </div>
                </section>
            </div>
        </div>








    </div>
    
    <script>
        //THESE ARE THE SCRIPTS FOR THE MODAL GOOGLE ADDRESS VALIDAOTR 
        // This example displays an address form, using the autocomplete feature
        // of the Google Places API to help users fill in the information.
        // This example requires the Places library. Include the libraries=places
        // parameter when you first load the API. For example:
        // <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">
        var placeSearch, autocomplete;
        var componentForm = {
            street_number: 'short_name',
            route: 'long_name',
            locality: 'long_name',
            administrative_area_level_1: 'short_name',
            country: 'long_name',
            postal_code: 'short_name'
        };
        function initAutocomplete() {
            // Create the autocomplete object, restricting the search to geographical
            // location types.
            autocomplete = new google.maps.places.Autocomplete(
                                            /** @type {!HTMLInputElement} */(document.getElementById('autocomplete')),
                { types: ['geocode'] });
            // When the user selects an address from the dropdown, populate the address
            // fields in the form.
            autocomplete.addListener('place_changed', fillInAddress);
        }
        function fillInAddress() {
            // Get the place details from the autocomplete object.
            var place = autocomplete.getPlace();
            for (var component in componentForm) {
                document.getElementById(component).value = '';
                document.getElementById(component).disabled = false;
            }
            var array = [];
            // Get each component of the address from the place details
            // and fill the corresponding field on the form.
            for (var i = 0; i < place.address_components.length; i++) {
                var addressType = place.address_components[i].types[0];
                
                if (componentForm[addressType]) {
                    var val = place.address_components[i][componentForm[addressType]];
                    document.getElementById(addressType).value = val;
                }
            }
            //array = string.split(",");
            //document.getElementById("total2").value = array;
            
            var streetNumber = place.address_components[0].types[0];
            var streetName = place.address_components[1].types[0];
            document.getElementById("txtStreetAddress").value = place.address_components[0][componentForm[streetNumber]] + " " + place.address_components[1][componentForm[streetName]];
            var city = place.address_components[2].types[0];
            document.getElementById("textOrgCity").value = place.address_components[2][componentForm[city]];
            var state = place.address_components[3].types[0];
            document.getElementById("state").value = place.address_components[3][componentForm[state]];
            
            
      
            var zip = place.address_components[5].types[0];
            document.getElementById("txtPostalCode").value = place.address_components[5][componentForm[zip]];
            //var countryName = place.address_components[4].types[0];
            //document.getElementById("countryName").value = place.address_components[4][componentForm[countryName]];
            //var empty = place.address_components[6].types[0];
            //document.getElementById("empty").value = place.address_components[6][componentForm[empty]];
            
            var hiddenControl = '<%= hiddenControl.ClientID %>';
            document.getElementById(hiddenControl).value = document.getElementById("txtStreetAddress").value;
            var hiddenCity = '<%= hiddenCity.ClientID %>';
            document.getElementById(hiddenCity).value = document.getElementById("textOrgCity").value;
            var hiddenState = '<%= hiddenState.ClientID %>';
            document.getElementById(hiddenState).value = document.getElementById("state").value;
            var hiddenZip = '<%= hiddenZip.ClientID %>';
            document.getElementById(hiddenZip).value = document.getElementById("txtPostalCode").value;
        }
        // Bias the autocomplete object to the user's geographical location,
        // as supplied by the browser's 'navigator.geolocation' object.
        function geolocate() {
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(function (position) {
                    var geolocation = {
                        lat: position.coords.latitude,
                        lng: position.coords.longitude
                    };
                    var circle = new google.maps.Circle({
                        center: geolocation,
                        radius: position.coords.accuracy
                    });
                    autocomplete.setBounds(circle.getBounds());
                });
            }
        }
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDF5N5PVHlVRbvfo-7ogAYJzJikONTDWNA&libraries=places&callback=initAutocomplete"
            async defer></script>

</asp:Content>