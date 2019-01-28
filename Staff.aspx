<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Staff.aspx.cs" Inherits="Volunteers" %>

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
        <a class="navbar-brand " style="color: #FFBC7C; font-weight: 400; font-size: 150%;" href="Programs.aspx">Wildlife Center of Virginia</a>
        <div class="ml-auto row">
            <asp:Label ID="lblWelcome" runat="server" Text="" class="" Style="color: #e0d7c3; margin-right: 15px;"></asp:Label>
            <%--  <a class=" d-none d-md-block" style="color:#FFBC7C; margin-right: 15px;" href="Default.aspx">
               <span>Logout</span></a>--%>
            <asp:Button ID="logout" class=" d-none d-md-block" runat="server" Style="color: #FFBC7C; cursor: pointer; margin-right: 15px; background-color: transparent; border: none;" Text="Logout" OnClick="btn_lgout_Click" CausesValidation="false" />
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
                <li class="nav-item dropdown no-arrow">
                    <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">



                        <span>Animals</span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right">
                        <a class="dropdown-item" href="AnimalPage.aspx">View Animals</a>
                        <a class="dropdown-item" href="#" data-target="#AddAnimal" data-toggle="modal">Add New Animal</a>
                        <a class="dropdown-item" href="#" data-target="#UpdateAnimal" data-toggle="modal">Edit Animal</a>
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

                <li class="nav-item dropdown no-arrow ">
                    <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">

                        <span>Invoices</span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right">
                        <a class="dropdown-item" href="Invoices.aspx">View Invoices</a>
                        <a class="dropdown-item" href="Payment.aspx">New Invoice</a>

                    </div>
                </li>



                <li class="nav-item dropdown no-arrow active ">
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
            <li class="nav-item dropdown no-arrow">
                <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">

                    <span>Invoices</span>
                </a>
                <div class="dropdown-menu dropdown-menu-right">
                    <a class="dropdown-item" href="Invoices.aspx">View Invoices</a>
                    <a class="dropdown-item" href="Payment.aspx">New Invoice</a>


                </div>
            </li>
            <li class="nav-item dropdown active no-arrow ">
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


                <section class="login-block  col-lg-8 col-md-8 col-s-5 mx-auto ">
                    <%--<section class="card card-register mx-auto mt-5">--%>
                    <div class="container1">
                        <div class="card  mx-auto mt-3">
                            <div class="card-header NewUserTitle text-center">
                                Wildlife Staff
                            </div>
                            <div class="card-body">
                                <div class="mx-auto row d-flex justify-content-center">
                                    <div class=" col-xl-3 col-lg-6 col-md-6 col-sm-12">
                                        <a href="createUser.aspx" class="btn btn-block btn-primary btn-inside" role="button">
                                            <i class="fas fa-plus" style="margin-right: 5px;"></i>Add Wildlife Staff
                                        </a>
                                    </div>

                                    <div class="col-xl-3 col-lg-0 col-md-6 col-sm-12">
                                        <div class="btn btn-block btn-primary btn-inside" data-target="#UpdateEducator" data-toggle="modal"><i class="fas fa-pencil-alt " style="margin-right: 5px;"></i>Edit Wildlife Staff</div>
                                    </div>

                                    <div class="col-xl-3 d-none col-lg-6 col-md-6 col-sm-12">
                                        <div class="btn btn-block btn-primary btn-inside" style="visibility: hidden" data-target="#AddVolunteer" data-toggle="modal"><i class="fas fa-plus" style="margin-right: 5px;"></i>Add Volunteer</div>
                                    </div>
                                    <div class="col-xl-3 d-none col-lg-6 col-md-6 col-sm-12">
                                        <div class="btn btn-block btn-primary btn-inside" style="visibility: hidden" data-target="#UpdateVolunteer" data-toggle="modal"><i class="fas fa-pencil-alt " style="margin-right: 5px;"></i>Edit Volunteer</div>
                                    </div>
                                </div>
                            </div>

                            <br />
                            <%--<div class="row">
               
                <div class=" col-md-4 ml-auto InternalOrganizationForm">
                    <asp:TextBox  class="InternalOrganizationForm" ID="txtSearch" runat="server"></asp:TextBox>
                    <asp:Button ID ="btnSearch" runat ="server" Text ="Search" OnClick="btnSearch_Click" />
                    &nbsp;&nbsp;&nbsp;
                    
                </div>
                <br />
                <asp:DropDownList ID="ddlOrderBy" runat="server" class="btn btn-secondary btn-sm dropdown-toggle" style="background-color: #FFFAFA !important; color: #732700 !important;" AppendDataBoundItems="false" AutoPostBack="true" DataValueField="" OnSelectedIndexChanged="ddlOrderBy_SelectedIndexChanged">
                    <asp:ListItem>--Order By--</asp:ListItem>
                    <%--<asp:ListItem>Program Date</asp:ListItem>--%>
                            <%--<asp:ListItem>Organization Name A-Z</asp:ListItem>
                    <asp:ListItem>City A-Z</asp:ListItem>
                    <asp:ListItem>County A-Z</asp:ListItem>
                </asp:DropDownList>--%>
                            <%--Add Educator--%>
                            <div class="modal fade" id="AddEducator" tabindex="-1" role="dialog">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content mt-5">
                                        <div class="modal-header">
                                            <h5 class="modal-title text-center" style="font-size: 145% !important; color: #e2561d !important;">Add New Educator</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <div runat="server" id="EducatorAddDiv">
                                                <p>&nbsp;</p>
                                                <div class="row">
                                                    <div class="d-none d-md-block text-right col-md-4 InternalOrganizationForm">
                                                        <h6>First Name<span style="color: red"> *</span></h6>
                                                    </div>
                                                    <div class=" d-md-none text-left col-md-4 InternalOrganizationForm">
                                                        <h6>First Name<span style="color: red"> *</span></h6>
                                                    </div>
                                                    <div class=" col-8 InternalAnimalForm">
                                                        <asp:TextBox ID="txtFirstName" class="form-control" runat="server"></asp:TextBox>&nbsp;&nbsp;
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="d-none d-md-block text-right col-md-4 InternalOrganizationForm">
                                                        <h6>Last Name<span style="color: red"> *</span></h6>
                                                    </div>
                                                    <div class=" d-md-none text-left col-md-4 InternalOrganizationForm">
                                                        <h6>Last Name<span style="color: red"> *</span></h6>
                                                    </div>
                                                    <div class=" col-8 InternalAnimalForm">
                                                        <asp:TextBox ID="txtLastName" class="form-control" runat="server"></asp:TextBox>&nbsp;&nbsp;
                                                    </div>
                                                </div>
                                                <%--    <div class="row">
                                <div class=" col-md-4 text-right InternalEducatorForm">
                                    <h6>Contact Email</h6>
                                </div>
                                <div class=" col-md-3 InternalEducatorForm">
                                    <asp:TextBox ID="txtEducatorEmail" runat="server"></asp:TextBox>&nbsp;&nbsp;
                                </div>
                            </div>
                            <div class="row">
                                <div class=" col-md-4 text-right InternalEducatorForm">
                                    <h6>Phone Number</h6>
                                </div>
                                <div class=" col-md-3 InternalEducatorForm">
                                    <asp:TextBox ID="txtEducatorPhone" runat="server"></asp:TextBox>&nbsp;&nbsp;
                                </div>
                            </div>--%>

                                                <div>
                                                </div>

                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                            <%--                                            <asp:Button ID="btnAddEducator" class="btn btn-primary btn-inside" runat="server" Text="Submit" OnClick="btnAddEducator_Click" />--%>
                                            <%-- <button type="button" class="btn btn-primary btn-inside">Save changes</button>--%>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <%-- Edit Educator--%>
                            <div class="modal fade" id="UpdateEducator" tabindex="-1" role="dialog">
                                <div class="modal-dialog " role="document">
                                    <div class="modal-content mt-5">
                                        <div class="modal-header">
                                            <h5 class="modal-title text-center" style="font-size: 145% !important; color: #e2561d !important;">Edit Wildlife Staff</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="ddlEducatorName" EventName="SelectedIndexChanged" />
                                            </Triggers>
                                            <ContentTemplate>
                                                <div class="modal-body">
                                                    <div runat="server" id="EducatorEditDiv">
                                                        <p>&nbsp;</p>
                                                        <div class="row">
                                                            <div class="d-none d-md-block text-right col-md-4 InternalOrganizationForm">
                                                                <h6>Select Staff Type</h6>
                                                            </div>
                                                            <div class=" d-md-none text-left col-md-4 InternalOrganizationForm">
                                                                <h6>Select Staff Type</h6>
                                                            </div>
                                                            <div class=" col-8 InternalAnimalForm">

                                                                <asp:DropDownList ID="ddlPopulateStaff" class="form-control" runat="server" AppendDataBoundItems="false" AutoPostBack="true" DataTextField="FirstName" DataValueField="UserID" OnSelectedIndexChanged="ddlPopulateStaff_ddlVolunteer_SelectedIndexChanged">
                                                                    <asp:ListItem Value="0">--Select Staff Type--</asp:ListItem>
                                                                    <asp:ListItem Value="O">Outreach Coordinator</asp:ListItem>
                                                                    <asp:ListItem Value="V">Wildlife Volunteer</asp:ListItem>



                                                                </asp:DropDownList>
                                                                &nbsp;&nbsp;
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="d-none d-md-block text-right col-md-4 InternalOrganizationForm">
                                                                <h6>Select Staff Member</h6>
                                                            </div>
                                                            <div class=" d-md-none text-left col-md-4 InternalOrganizationForm">
                                                                <h6>Select Staff Member</h6>
                                                            </div>
                                                            <div class=" col-8 InternalAnimalForm">

                                                                <asp:DropDownList ID="ddlEducatorName" class="form-control" runat="server" AppendDataBoundItems="false" AutoPostBack="true" DataTextField="FirstName" DataValueField="UserID" OnSelectedIndexChanged="ddlEducator_SelectedIndexChanged1">
                                                                    <asp:ListItem>--Select Staff--</asp:ListItem>

                                                                </asp:DropDownList>
                                                                &nbsp;&nbsp;
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="d-none d-md-block text-right col-md-4 InternalOrganizationForm">
                                                                <h6>First Name</h6>
                                                            </div>
                                                            <div class=" d-md-none text-left col-md-4 InternalOrganizationForm">
                                                                <h6>First Name</h6>
                                                            </div>
                                                            <div class=" col-8 InternalAnimalForm">
                                                                <asp:TextBox ID="txtEducatorFirst" class="form-control" runat="server"></asp:TextBox>&nbsp&nbsp
                                                            </div>
                                                        </div>

                                                        <div class="row">
                                                            <div class="d-none d-md-block text-right col-md-4 InternalOrganizationForm">
                                                                <h6>Last Name</h6>
                                                            </div>
                                                            <div class=" d-md-none text-left col-md-4 InternalOrganizationForm">
                                                                <h6>Last Name</h6>
                                                            </div>
                                                            <div class=" col-8 InternalAnimalForm">

                                                                <asp:TextBox ID="txtEducatorLast" class="form-control" runat="server"></asp:TextBox>&nbsp&nbsp

                                                            </div>
                                                        </div>

                                                        <div class="row">
                                                            <div class="d-none d-md-block text-right col-md-4 InternalOrganizationForm">
                                                                <h6>Email</h6>
                                                            </div>
                                                            <div class=" d-md-none text-left col-md-4 InternalOrganizationForm">
                                                                <h6>Email</h6>
                                                            </div>
                                                            <div class=" col-md-8 InternalAnimalForm">

                                                                <asp:TextBox ID="txtEducatorEmail" class="form-control" runat="server"></asp:TextBox>&nbsp&nbsp

                                                            </div>
                                                        </div>

                                                        <div class="row">
                                                            <div class="d-none d-md-block text-right col-md-4 InternalOrganizationForm">
                                                                <h6>Phone Number</h6>
                                                            </div>
                                                            <div class=" d-md-none text-left col-md-4 InternalOrganizationForm">
                                                                <h6>Phone Number</h6>
                                                            </div>
                                                            <div class=" col-md-8 InternalAnimalForm">

                                                                <asp:TextBox ID="txtEducatorPhone" class="form-control" runat="server"></asp:TextBox>&nbsp&nbsp

                                                            </div>
                                                        </div>


                                                        <div class="row">
                                                            <div class="d-none d-md-block text-right col-md-4 InternalOrganizationForm">
                                                                <h6>Status</h6>
                                                            </div>
                                                            <div class=" d-md-none text-left col-md-4 InternalOrganizationForm">
                                                                <h6>Status</h6>
                                                            </div>
                                                            <div class=" col-8 InternalAnimalForm">

                                                                <asp:DropDownList ID="ddlEducatorStatus" class="form-control" runat="server" AppendDataBoundItems="false" AutoPostBack="true" DataTextField="Status" DataValueField="UserID">
                                                                    <asp:ListItem>--Choose Educator Status--</asp:ListItem>
                                                                    <asp:ListItem Text="Active" Value="Active"></asp:ListItem>
                                                                    <asp:ListItem Text="Inactive" Value="Inactive"></asp:ListItem>
                                                                </asp:DropDownList>&nbsp&nbsp

                                                            </div>
                                                        </div>

                                                        <div class="row">
                                                            <div class="d-none d-md-block text-right col-md-4 InternalOrganizationForm">
                                                                <h6>Staff Type</h6>
                                                            </div>
                                                            <div class=" d-md-none text-left col-md-4 InternalOrganizationForm">
                                                                <h6>Staff Type</h6>
                                                            </div>
                                                            <div class=" col-md-8 InternalAnimalForm">

                                                                <asp:DropDownList ID="ddlStaffType" class="form-control" runat="server" AppendDataBoundItems="false" AutoPostBack="true" DataTextField="Status" DataValueField="UserID">
                                                                    <asp:ListItem>--Choose Staff Type--</asp:ListItem>
                                                                    <asp:ListItem Text="Outreach Coordinator" Value="O"></asp:ListItem>
                                                                    <asp:ListItem Text="Volunteer" Value="V"></asp:ListItem>
                                                                </asp:DropDownList>

                                                            </div>
                                                        </div>

                                                        <asp:Label ID="lblLastUpdated" runat="server" Text=""></asp:Label>&nbsp;
            <asp:Label ID="lblLastUpdatedBy" runat="server" Text=""></asp:Label>


                                                        <div>
                                                            <div class="row">
                                                                <div class=" col-12">
                                                                    <br />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <%--<asp:Label ID="Label5" runat="server" Text=""></asp:Label>&nbsp;
                            <asp:Label ID="Label6" runat="server" Text=""></asp:Label>--%>
                                                    </div>
                                                </div>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                                            <asp:Button ID="btnUpdateEducator" class="btn btn-primary btn-inside" runat="server" Text="Save Changes" OnClick="btnUpdateEducator_Click" />

                                            <%-- <button type="button" class="btn btn-primary btn-inside">Save changes</button>--%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%--Add Volunteer--%>
                            <div class="modal fade" id="AddVolunteer" tabindex="-1" role="dialog">
                                <div class="modal-dialog " role="document">
                                    <div class="modal-content mt-5">
                                        <div class="modal-header">
                                            <h5 class="modal-title text-center" style="font-size: 145% !important; color: #e2561d !important;">Add New Volunteer</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <div runat="server" id="Div3">
                                                <p>&nbsp;</p>
                                                <div class="row">
                                                    <div class="d-none d-md-block text-right col-md-4 InternalOrganizationForm">
                                                        <h6>First Name<span style="color: red"> *</span></h6>
                                                    </div>
                                                    <div class=" d-md-none text-left col-md-4 InternalOrganizationForm">
                                                        <h6>First Name<span style="color: red"> *</span></h6>
                                                    </div>
                                                    <div class=" col-8 InternalAnimalForm">
                                                        <asp:TextBox ID="txtVolunteerAddFirstName" class="form-control" runat="server"></asp:TextBox>&nbsp;&nbsp;
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="d-none d-md-block text-right col-md-4 InternalOrganizationForm">
                                                        <h6>Last Name<span style="color: red"> *</span></h6>
                                                    </div>
                                                    <div class=" d-md-none text-left col-md-4 InternalOrganizationForm">
                                                        <h6>Last Name<span style="color: red"> *</span></h6>
                                                    </div>
                                                    <div class=" col-8 InternalAnimalForm">
                                                        <asp:TextBox ID="txtVolunteerAddLastName" class="form-control" runat="server"></asp:TextBox>&nbsp;&nbsp;
                                                    </div>
                                                </div>



                                                <div class="row">
                                                    <div class="d-none d-md-block text-right col-md-4 InternalOrganizationForm">
                                                        <h6>Phone Number<span style="color: red"> *</span></h6>
                                                    </div>
                                                    <div class=" d-md-none text-left col-md-4 InternalOrganizationForm">
                                                        <h6>Phone Number<span style="color: red"> *</span></h6>
                                                    </div>
                                                    <div class=" col-8 InternalAnimalForm">
                                                        <asp:TextBox ID="txtVolunteerAddPhoneNumber" class="form-control" runat="server" placeholder="(___) ___-____"></asp:TextBox>
                                                        &nbsp;&nbsp;
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="d-none d-md-block text-right col-md-4 InternalOrganizationForm">
                                                        <h6>Email<span style="color: red"> *</span></h6>
                                                    </div>
                                                    <div class=" d-md-none text-left col-md-4 InternalOrganizationForm">
                                                        <h6>Email<span style="color: red"> *</span></h6>
                                                    </div>
                                                    <div class=" col-8 InternalAnimalForm">
                                                        <asp:TextBox ID="txtVoluteerAddEmail" class="form-control" runat="server"></asp:TextBox>&nbsp;&nbsp;
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="d-none d-md-block text-right col-md-4 InternalOrganizationForm">
                                                        <h6>Status<span style="color: red"> *</span></h6>
                                                    </div>
                                                    <div class=" d-md-none text-left col-md-4 InternalOrganizationForm">
                                                        <h6>Status<span style="color: red"> *</span></h6>
                                                    </div>
                                                    <div class=" col-8 InternalAnimalForm">
                                                        <asp:DropDownList ID="ddlVolunteerAddStatus" class="btn btn-secondary btn-block dropdown-toggle" Style="background-color: #FFFfff !important; color: #732700 !important; border-color: grey;" runat="server">
                                                            <asp:ListItem Text="--Status--" Value=""></asp:ListItem>
                                                            <asp:ListItem Text="Active" Value="Active"></asp:ListItem>
                                                            <asp:ListItem Text="Inactive" Value="Inactive"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>

                                                <div>
                                                </div>

                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                            <%--                                            <asp:Button ID="btnVolunteerAdd" class="btn btn-primary btn-inside" runat="server" Text="Submit" OnClick="btnAddVolunteer_Click" />--%>
                                            <%-- <button type="button" class="btn btn-primary btn-inside">Save changes</button>--%>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <%-- Update Volunteer--%>
                            <div class="modal fade" id="UpdateVolunteer" tabindex="-1" role="dialog">
                                <div class="modal-dialog " role="document">
                                    <div class="modal-content mt-5">
                                        <div class="modal-header">
                                            <h5 class="modal-title text-center" style="font-size: 145% !important; color: #e2561d !important;">Edit Volunteer</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="ddlVolunteerName" EventName="SelectedIndexChanged" />
                                            </Triggers>
                                            <ContentTemplate>
                                                <div class="modal-body">
                                                    <div runat="server" id="Div2">
                                                        <p>&nbsp;</p>
                                                        <div class="row">
                                                            <div class="d-none d-md-block text-right col-md-4 InternalOrganizationForm">
                                                                <h6>Select Volunteer</h6>
                                                            </div>
                                                            <div class=" d-md-none text-left col-md-4 InternalOrganizationForm">
                                                                <h6>Select Volunteer</h6>
                                                            </div>
                                                            <div class=" col-8 InternalAnimalForm">

                                                                <asp:DropDownList ID="ddlVolunteerName" class="btn btn-secondary btn-block dropdown-toggle" Style="background-color: #FFFfff !important; color: #732700 !important; border-color: grey;" runat="server" AppendDataBoundItems="false" AutoPostBack="true" DataTextField="VolunteerFirstName" DataValueField="VolunteerID">
                                                                    <asp:ListItem>--Select Volunteer--</asp:ListItem>
                                                                </asp:DropDownList>
                                                                &nbsp;&nbsp;
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="d-none d-md-block text-right col-md-4 InternalOrganizationForm">
                                                                <h6>First Name</h6>
                                                            </div>
                                                            <div class=" d-md-none text-left col-md-4 InternalOrganizationForm">
                                                                <h6>First Name</h6>
                                                            </div>
                                                            <div class=" col-8 InternalAnimalForm">
                                                                <asp:TextBox ID="txtVolunteerFirstName" class="form-control" runat="server"></asp:TextBox>&nbsp&nbsp
                                                            </div>
                                                        </div>

                                                        <div class="row">
                                                            <div class="d-none d-md-block text-right col-md-4 InternalOrganizationForm">
                                                                <h6>Last Name</h6>
                                                            </div>
                                                            <div class=" d-md-none text-left col-md-4 InternalOrganizationForm">
                                                                <h6>Last Name</h6>
                                                            </div>
                                                            <div class=" col-8 InternalAnimalForm">

                                                                <asp:TextBox ID="txtVolunteerLastName" class="form-control" runat="server"></asp:TextBox>&nbsp&nbsp

                                                            </div>
                                                        </div>

                                                        <div class="row">
                                                            <div class="d-none d-md-block text-right col-md-4 InternalOrganizationForm">
                                                                <h6>Phone Number</h6>
                                                            </div>
                                                            <div class=" d-md-none text-left col-md-4 InternalOrganizationForm">
                                                                <h6>Phone Number</h6>
                                                            </div>
                                                            <div class=" col-8 InternalAnimalForm">

                                                                <asp:TextBox ID="txtVolunteerPhoneNumber" class="form-control" runat="server"></asp:TextBox>&nbsp&nbsp

                                                            </div>
                                                        </div>

                                                        <div class="row">
                                                            <div class="d-none d-md-block text-right col-md-4 InternalOrganizationForm">
                                                                <h6>Email</h6>
                                                            </div>
                                                            <div class=" d-md-none text-left col-md-4 InternalOrganizationForm">
                                                                <h6>Email</h6>
                                                            </div>
                                                            <div class=" col-8 InternalAnimalForm">

                                                                <asp:TextBox ID="txtVolunteerEmail" class="form-control" runat="server"></asp:TextBox>&nbsp&nbsp

                                                            </div>
                                                        </div>

                                                        <div class="row">
                                                            <div class="d-none d-md-block text-right col-md-4 InternalOrganizationForm">
                                                                <h6>Status</h6>
                                                            </div>
                                                            <div class=" d-md-none text-left col-md-4 InternalOrganizationForm">
                                                                <h6>Status</h6>
                                                            </div>
                                                            <div class=" col-8 InternalAnimalForm">

                                                                <asp:DropDownList ID="ddlVolunteerStatus" class="btn btn-secondary btn-block dropdown-toggle" Style="background-color: #FFFfff !important; color: #732700 !important; border-color: grey;" runat="server">
                                                                    <asp:ListItem>--Select Status--</asp:ListItem>
                                                                    <asp:ListItem Text="Active" Value="Active"></asp:ListItem>
                                                                    <asp:ListItem Text="Inactive" Value="Inactive"></asp:ListItem>
                                                                </asp:DropDownList>

                                                            </div>
                                                        </div>
                                                        <asp:Label ID="lblLastUpdatedVolunteer" runat="server" Text=""></asp:Label>&nbsp;
            <asp:Label ID="lblLastUpdatedByVolunteer" runat="server" Text=""></asp:Label>
                                                        <div>
                                                            <div class="row">
                                                                <div class=" col-12">
                                                                    <br />
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                            <%--<asp:Button ID="btnDeleteVolunteer" class="btn btn-primary btn-inside" runat="server" Text="Disable" OnClick="btnDeleteVolunteer_Click" />--%>
                                            <%--                                            <asp:Button ID="btnUpdateVolunteer" class="btn btn-primary btn-inside" runat="server" Text="Save Changes" OnClick="btnUpdateVolunteer_Click" />--%>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="col-lg-12 col-md-12 col-s-12 mx-auto">
                                <div class="container1 block">
                                    <div runat="server" id="OrganizationSearchDiv">
                                        <div runat="server" id="ViewOrganizations">

                                            <%--</div>--%>

                                            <div class="block3">
                                                <div class="tab-content">
                                                    <div class="">
                                                        <div class="col-md-12 ">
                                                            <br />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <%-- this div  is the internal div--%>


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


                                        <ul class="nav nav-tabs" role="tablist" id="myTab" style="margin-left: 12px;">
                                            <li role="presentation"><a href="#AllStaffTab" style="color: black;" class="nav-link  active  TabStyle" aria-controls="profile" role="tab" data-toggle="tab">All Staff </a></li>
                                            <li role="presentation" class=""><a href="#OutreachCoordTab" class="nav-link    TabStyle" style="color: black;" aria-controls="home" role="tab" data-toggle="tab">Outreach Coordinators</a></li>
                                            <li role="presentation" class=""><a href="#VolunteerTab" class="nav-link    TabStyle" style="color: black;" aria-controls="home" role="tab" data-toggle="tab">Volunteers</a></li>



                                        </ul>


                                        <%--<ul class="nav nav-tabs block4" id="myTab" role="tablist">
                <li class="nav-item ">
                
                                
                    <a class="nav-link   active TabStyle" data-toggle="tab" href="#VolunteersAllTab" style="color:black;"><p class="d-none d-lg-block">All Volunteers</p><p class="d-lg-none">All </p></a>
                 
                </li>
                <li class="nav-item">
                     <a class="nav-link    TabStyle" data-toggle="tab" href="#VolunteersActiveTab" style="color:black;"><p class="d-none d-lg-block">Active Volunteers</p><p class="d-lg-none">Active </p></a>
                      </li>
                <li class="nav-item">
                    <a class="nav-link  TabStyle" data-toggle="tab" href="#VolunteersInactiveTab" style="color:black;"><p class="d-none d-lg-block">Inactive Volunteers</p><p class="d-lg-none">Inactive </p></a>
                     </li>
                
            </ul>--%>




                                        <div class="tab-content">
                                            <div id="AllStaffTab" class="container1 block3 tab-pane active show WildTable ">
                                                <div class="InternalAnimalTab">
                                                    <div class="grid-volunteers text-center">
                                                        <div class="row table-responsive mx-auto d-flex  justify-content-center">
                                                            <div class="col-xl-12 col-lg-10 col-md-12 col-sm-12 col-xs-12 ">
                                                                <%--<h4 class="alert " style="background-color: #AB9993 !important; color: white !important;"> Organizations</h4>--%>

                                                                <asp:GridView ID="GridView1" HeaderStyle-BackColor="#C7BFC4" ForeColor="Black" class="table table-striped table-bordered table-condensed table-hover" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource4">
                                                                    <Columns>
                                                                        <asp:BoundField DataField="Category" HeaderText="Staff Type" SortExpression="Category"></asp:BoundField>
                                                                        <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName"></asp:BoundField>
                                                                        <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName"></asp:BoundField>
                                                                        <asp:BoundField DataField="PhoneNumber" HeaderText="Phone Number" SortExpression="VolunteerPhoneNumber"></asp:BoundField>
                                                                        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email"></asp:BoundField>
                                                                        <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status"></asp:BoundField>


                                                                    </Columns>

                                                                </asp:GridView>
                                                                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:WildTekConnectionString %>"
                                                                    SelectCommand="Select Case when EducatorCategory = 'O' then 'Outreach Coordinator' end AS Category, EducatorFirstName AS FirstName, EducatorLastName AS LastName, EducatorPhoneNumber AS PhoneNumber, EducatorEmail AS Email, Status AS Status From Educators UNION ALL Select Case when VolunteerCategory = 'V' then 'Volunteer' end AS Category, VolunteerFirstName AS FirstName, VolunteerLastName AS LastName, VolunteerPhoneNumber AS PhoneNumber, VolunteerEmail AS Email, VolunteerStatus AS Status From Volunteers Order By FirstName"></asp:SqlDataSource>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>


                                            <div id="OutreachCoordTab" role="tabpanel" class="container1 block3 tab-pane fade WildTable ">
                                                <div class="InternalAnimalTab">
                                                    <div class="grid-educators text-center">
                                                        <div class="row table-responsive mx-auto d-flex  justify-content-center">
                                                            <div class="col-xl-12 col-lg-10 col-md-12 col-sm-12 col-xs-12 ">
                                                                <%--<h4 class="alert " style="background-color: #AB9993 !important; color: white !important;"> Organizations</h4>--%>

                                                                <asp:GridView ID="GridView2" HeaderStyle-BackColor="#C7BFC4" ForeColor="Black" class="table table-striped table-bordered table-condensed table-hover" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                                                                    <Columns>
                                                                        <asp:BoundField DataField="EducatorFirstName" HeaderText="First Name" SortExpression="EducatorFirstName"></asp:BoundField>
                                                                        <asp:BoundField DataField="EducatorLastName" HeaderText="Last Name" SortExpression="EducatorLastName"></asp:BoundField>
                                                                        <asp:BoundField DataField="EducatorPhoneNumber" HeaderText="Phone Number" SortExpression="EducatorPhoneNumber"></asp:BoundField>
                                                                        <asp:BoundField DataField="EducatorEmail" HeaderText="Email" SortExpression="EducatorEmail"></asp:BoundField>
                                                                        <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status"></asp:BoundField>


                                                                    </Columns>

                                                                </asp:GridView>
                                                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WildTekConnectionString %>"
                                                                    SelectCommand="Select EducatorFirstName, EducatorLastName, EducatorPhoneNumber, EducatorEmail, Status From Educators Order By EducatorFirstName"></asp:SqlDataSource>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>

                                            <div id="VolunteerTab" role="tabpanel" class="container1 block3 tab-pane fade  WildTable ">
                                                <div class="InternalAnimalTab">
                                                    <div class="grid-educators text-center">
                                                        <div class="row table-responsive mx-auto d-flex  justify-content-center">
                                                            <div class="col-xl-12 col-lg-10 col-md-12 col-sm-12 col-xs-12 ">
                                                                <%--<h4 class="alert " style="background-color: #AB9993 !important; color: white !important;"> Organizations</h4>--%>

                                                                <asp:GridView ID="GridView3" HeaderStyle-BackColor="#C7BFC4" ForeColor="Black" class="table table-striped table-bordered table-condensed table-hover" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
                                                                    <Columns>
                                                                        <asp:BoundField DataField="VolunteerFirstName" HeaderText="First Name" SortExpression="VolunteerFirstName"></asp:BoundField>
                                                                        <asp:BoundField DataField="VolunteerLastName" HeaderText="Last Name" SortExpression="VolunteerLastName"></asp:BoundField>
                                                                        <asp:BoundField DataField="VolunteerPhoneNumber" HeaderText="Phone Number" SortExpression="VolunteerPhoneNumber"></asp:BoundField>
                                                                        <asp:BoundField DataField="VolunteerEmail" HeaderText="Email" SortExpression="VolunteerEmail"></asp:BoundField>
                                                                        <asp:BoundField DataField="VolunteerStatus" HeaderText="Status" SortExpression="VolunteerStatus"></asp:BoundField>


                                                                    </Columns>

                                                                </asp:GridView>
                                                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:WildTekConnectionString %>"
                                                                    SelectCommand="Select VolunteerFirstName, VolunteerLastName, VolunteerPhoneNumber, VolunteerEmail, VolunteerStatus From Volunteers Order By VolunteerFirstName"></asp:SqlDataSource>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>


                                            <%-- <div id="VolunteersActiveTab" class="container1 block3 tab-pane text-center WildTable ">
                    <div class="InternalAnimalTab">
                   
                        <div class ="grid-volunteers text-center">
                            <div class="row table-responsive mx-auto d-flex  justify-content-center">
              <div class="col-xl-12 col-lg-10 col-md-12 col-sm-12 col-xs-12 ">
                            <asp:GridView ID="GridView2"   HeaderStyle-BackColor="#C7BFC4" ForeColor="Black" class="table table-bordered table-condensed table-hover"  runat="server" AutoGenerateColumns="False"  DataSourceID="SqlDataSource1">
                            <Columns>
                                <asp:BoundField DataField="VolunteerFirstName" HeaderText="Volunteer First Name" SortExpression="VolunteerFirstName" >
 
                                </asp:BoundField>
                                <asp:BoundField DataField="VolunteerLastName" HeaderText="Volunteer Last Name" SortExpression="VolunteerLastName" >
            
                                </asp:BoundField>
                                <asp:BoundField DataField="VolunteerPhoneNumber" HeaderText="Volunteer Phone Number" SortExpression="VolunteerPhoneNumber" >
            
                                </asp:BoundField>
                                <asp:BoundField DataField="VolunteerEmail" HeaderText="Volunteer Email" SortExpression="VolunteerEmail" >
            
                                </asp:BoundField>
                                <asp:BoundField DataField="VolunteerStatus" HeaderText="Volunteer Status" SortExpression="VolunteerStatus" >
            
                                </asp:BoundField>
            
                            </Columns>
        
                         </asp:GridView>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WildTekConnectionString %>"  
                                        SelectCommand="SELECT [VolunteerFirstName], [VolunteerLastName], [VolunteerPhoneNumber], [VolunteerEmail], [VolunteerStatus] FROM [Volunteers] WHERE[VolunteerStatus] = 'Active' ORDER BY [VolunteerFirstName]">
                                    </asp:SqlDataSource>
                        </div>
                    </div>
                              </div>
                    </div>
                </div>
                <div id="VolunteersInactiveTab" class="container1 block3 tab-pane  text-center WildTable">
                    <div class="InternalAnimalTab">
                     <div class ="grid-volunteers text-center">
                               <div class="row table-responsive mx-auto d-flex  justify-content-center">
              <div class="col-xl-12 col-lg-10 col-md-12 col-sm-12 col-xs-12 ">
                            <asp:GridView ID="GridView3"   HeaderStyle-BackColor="#C7BFC4" ForeColor="Black" class="table table-bordered table-condensed table-hover"  runat="server" AutoGenerateColumns="False"  DataSourceID="SqlDataSource2">
                            <Columns>
                                <asp:BoundField DataField="VolunteerFirstName" HeaderText="Volunteer First Name" SortExpression="VolunteerFirstName" >
 
                                </asp:BoundField>
                                <asp:BoundField DataField="VolunteerLastName" HeaderText="Volunteer Last Name" SortExpression="VolunteerLastName" >
            
                                </asp:BoundField>
                                <asp:BoundField DataField="VolunteerPhoneNumber" HeaderText="Volunteer Phone Number" SortExpression="VolunteerPhoneNumber" >
            
                                </asp:BoundField>
                                <asp:BoundField DataField="VolunteerEmail" HeaderText="Volunteer Email" SortExpression="VolunteerEmail" >
            
                                </asp:BoundField>
                                <asp:BoundField DataField="VolunteerStatus" HeaderText="Volunteer Status" SortExpression="VolunteerStatus" >
            
                                </asp:BoundField>
            
                            </Columns>
        
                         </asp:GridView>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:WildTekConnectionString %>"  
                                        SelectCommand="SELECT [VolunteerFirstName], [VolunteerLastName], [VolunteerPhoneNumber], [VolunteerEmail], [VolunteerStatus] FROM [Volunteers] WHERE[VolunteerStatus] = 'Inactive' ORDER BY [VolunteerFirstName]">
                                    </asp:SqlDataSource>
                        </div>
                    </div>
                            </div>
                    </div>
                </div>--%>
                                        </div>



                                    </div>
                                </div>
                                <div runat="server" id="Div1">
                                </div>
                            </div>
                        </div>
                    </div>
            </div>

        </div>

    </div>

    </div>
    </div>
    </div>
    </div>
    </div>
</asp:Content>
