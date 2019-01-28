<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Payment.aspx.cs" Inherits="Payments" %>

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

                <li class="nav-item dropdown active no-arrow ">
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
            <li class="nav-item dropdown active no-arrow">
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


            <div class="container-fluid block ">







                <%--  <div id="wrapper">
        <!-- Sidebar -->
        <ul class="sidebar navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="Programs.aspx">
                    <i class="fas fa-fw fa-book-open"></i>
                    <span>Programs</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="AnimalPage.aspx">
                    <i class="fas fa-fw fa-book-open"></i>
                    <span>Animal</span>
                </a>
            </li>
            <li class="nav-item dropdown no-arrow">
                <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">
                    <i class="fas fa-envelope fa-fw"></i>
                    <span>Reports</span>
                </a>
                <div class="dropdown-menu dropdown-menu-right">
                    <a class="dropdown-item" href="Report.aspx">Reports</a>
                  <%-- --%>
                <%-- --%>
                <%--    <a class="dropdown-item" href="TabLiveReports.aspx">Live Program</a>
                    <a class="dropdown-item" href="TabOnlineProgramReports.aspx">Online Program</a>
                    <a class="dropdown-item" href="TabGradeReport.aspx">Grade</a>--%>
                <%-- </div>
            </li>
           <%-- <li class="nav-item dropdown no-arrow active">--%>
                <%--                <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">
                    <i class="fas fa-envelope fa-fw"></i>
                    <span>Payment</span>
                </a>--%>
                <%--                <div class="dropdown-menu dropdown-menu-right">
                    <a class="dropdown-item" href="Payment.aspx">New Payment Form</a>
                    <a class="dropdown-item" href="Invoices.aspx">Invoices</a>
                --%>



                <%--            <li class="nav-item dropdown no-arrow">
                <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">
                    <i class="fas fa-envelope fa-fw"></i>
                    <span>Add New Program Content</span>
                </a>
                <div class="dropdown-menu dropdown-menu-right">
                    <a class="dropdown-item" href="#" data-target="#AddProgram" data-toggle="modal">Add New Program Type</a>
                    <a class="dropdown-item" href="#" data-target="#AddOrganization" data-toggle="modal">Add New Organization</a>
                    <a class="dropdown-item" href="#" data-target="#AddAnimal" data-toggle="modal">Add New Animal</a>
                    <a class="dropdown-item" href="#" data-target="#AddEducator" data-toggle="modal">Add New Educator</a>
                </div>
            </li>--%>

                <%--            <li class="nav-item dropdown no-arrow">
                <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">
                    <i class="fas fa-envelope fa-fw"></i>
                    <span>Update Program Content</span>
                </a>
                <div class="dropdown-menu dropdown-menu-right">
                    <a class="dropdown-item" href="#" data-target="#UpdateOrganization" data-toggle="modal">Update Organizations</a>
                    <a class="dropdown-item" href="#" data-target="#UpdateAnimal" data-toggle="modal">Update Animals</a>
                    <a class="dropdown-item" href="#" data-target="#UpdateEducator" data-toggle="modal">Update Educators</a>
                </div>
            </li>--%>









                <div>
                    <div class="container-fluid">

                        <div class="container1">
                            <div class="card card-register mx-auto mt-5">
                                <div class="card-header NewUserTitle">Add New Invoice</div>
                                <div class="card-body">

                                    <div class="row">


                                        <div class="d-none d-md-block text-right col-md-5 InternalOrganizationForm">
                                            <h6>Invoice Number<span style="color: red"> *</span></h6>
                                        </div>
                                        <div class=" d-md-none text-left col-md-5 InternalOrganizationForm">
                                            <h6>Invoice Number<span style="color: red"> *</span></h6>
                                        </div>
                                        <div class=" col-md-6 InternalAnimalForm">
                                            <asp:TextBox ID="txtInvoiceNum" runat="server" class="form-control" placeholder="Enter Invoice Number"></asp:TextBox>

                                        </div>
                                    </div>
                                    <br />

                                    <div class="row">


                                        <div class="d-none d-md-block text-right col-md-5 InternalOrganizationForm">
                                            <h6>Date of Payment<span style="color: red"> *</span></h6>
                                        </div>
                                        <div class=" d-md-none text-left col-md-5 InternalOrganizationForm">
                                            <h6>Date of Payment<span style="color: red"> *</span></h6>
                                        </div>
                                        <div class=" col-md-6 InternalAnimalForm">
                                            <input type="date" id="PaymentDate" class="form-control" runat="server" />
                                        </div>
                                    </div>
                                    <br />

                                    <div class="row">


                                        <div class="d-none d-md-block text-right col-md-5 InternalOrganizationForm">
                                            <h6>Program<span style="color: red"> *</span></h6>

                                        </div>
                                        <div class=" d-md-none text-left col-md-5 InternalOrganizationForm">
                                            <h6>Program<span style="color: red"> *</span></h6>
                                        </div>
                                        <div class=" col-md-6 InternalAnimalForm">
                                            <asp:DropDownList ID="ddlProgramType" runat="server" class="form-control" AppendDataBoundItems="false" AutoPostBack="true" DataTextField="OrgName" DataValueField="OrgID" OnSelectedIndexChange="ddlProgramType_SelectedIndexChanged">
                                                <asp:ListItem Value="0">--Select Program--</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <br />

                                    <div class="row">


                                        <div class="d-none d-md-block text-right col-md-5 InternalOrganizationForm">
                                            <h6>Organization<span style="color: red"> *</span></h6>
                                        </div>
                                        <div class=" d-md-none text-left col-md-5 InternalOrganizationForm">
                                            <h6>Organization<span style="color: red"> *</span></h6>

                                        </div>
                                        <div class=" col-md-6 InternalAnimalForm">
                                            <asp:DropDownList ID="ddlOrganization" runat="server" class="form-control" AppendDataBoundItems="false" AutoPostBack="false" DataTextField="OrgName" DataValueField="OrgID">
                                                <asp:ListItem Value="0">--Select Organization--</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <br />





                                    <div class="row">


                                        <div class="d-none d-md-block text-right col-md-5 InternalOrganizationForm">
                                            <h6>Amount<span style="color: red"> *</span></h6>
                                        </div>
                                        <div class=" d-md-none text-left col-md-5 InternalOrganizationForm">
                                            <h6>Amount<span style="color: red"> *</span></h6>
                                        </div>
                                        <div class=" col-md-6 InternalAnimalForm">
                                            <asp:TextBox ID="txtAmount" runat="server" class="form-control" placeholder="Enter Amount"></asp:TextBox>
                                        </div>
                                    </div>
                                    <br />

                                    <div class="row">


                                        <div class="d-none d-md-block text-right col-md-5 InternalOrganizationForm">
                                            <h6>Payment Type<span style="color: red"> *</span></h6>
                                        </div>
                                        <div class=" d-md-none text-left col-md-5 InternalOrganizationForm">
                                            <h6>Payment Type<span style="color: red"> *</span></h6>

                                        </div>
                                        <div class=" col-md-6 InternalAnimalForm">
                                            <asp:DropDownList ID="ddlPaymentType" runat="server" class="form-control" AppendDataBoundItems="false" AutoPostBack="true" OnSelectedIndexChanged="ddlPaymentType_SelectedIndexChanged">
                                                <asp:ListItem Value="0">--Payment Type--</asp:ListItem>
                                                <asp:ListItem>Check</asp:ListItem>
                                                <asp:ListItem>Credit</asp:ListItem>
                                                <asp:ListItem>Debit</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <br />

                                    <div class="row">


                                        <div class="d-none d-md-block text-right col-md-5 InternalOrganizationForm">
                                            <h6>Check Number</h6>
                                        </div>
                                        <div class=" d-md-none text-left col-md-5 InternalOrganizationForm">
                                            <h6>Check Number</h6>
                                        </div>
                                        <div class=" col-md-6 InternalAnimalForm">
                                            <asp:TextBox ID="txtCheckNum" runat="server" class="form-control" ReadOnly="true" placeholder="Enter Check Number"></asp:TextBox>

                                        </div>
                                    </div>
                                    <br />


                                    <div class="row">


                                        <div class="d-none d-md-block text-right col-md-5 InternalOrganizationForm">
                                            <h6>Payment Status<span style="color: red"> *</span></h6>
                                        </div>
                                        <div class=" d-md-none text-left col-md-5 InternalOrganizationForm">
                                            <h6>Payment Status<span style="color: red"> *</span></h6>

                                        </div>
                                        <div class=" col-md-6 InternalAnimalForm">
                                            <asp:DropDownList ID="ddlInvoicePaymentStatus" runat="server" class="form-control" AppendDataBoundItems="false">
                                                <asp:ListItem Value="0">--Payment Status--</asp:ListItem>
                                                <asp:ListItem>Paid</asp:ListItem>
                                                <asp:ListItem>Not Paid</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <br />










                                    <div class="mx-auto d-flex justify-content-center">
                                        <%--<asp:Button ID="btnPopulate" runat="server" Text="Populate" OnClick="btnPopulate_Click" class="btn btn-primary btn-inside" />--%>
                                        <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click1" class="btn btn-primary btn-inside" Text="Submit" />
                                        <asp:Button ID="btnInvoices" runat="server" OnClick="btnInvoices_Click" class="btn btn-primary btn-inside" Text="View Invoices" />
                                    </div>
                                    <p></p>
                                    <asp:Label ID="lblStatus" ForeColor="red" runat="server"></asp:Label>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

</asp:Content>

