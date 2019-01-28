<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Invoices.aspx.cs" Inherits="Invoices" EnableEventValidation="false" %>

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
            <asp:Button ID="logout" class=" d-none d-md-block" runat="server" Style="color: #FFBC7C; cursor: pointer; margin-right: 15px; background-color: transparent; border: none;" Text="Logout" OnClick="btn_lgout_Click" CausesValidation="false" />
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

                <li class="nav-item dropdown no-arrow active">
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

          <!-- Sidebar on every page for an Outreach Coordinator -->
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

        </ul>








        <div id="content-wrapper">
               <%--buttons for Add and Edit Animals as pop ups on the Animal Page--%>

            <div class="container1">
                <div class="card  mx-auto mt-5">
                    <div class="card-header NewUserTitle text-center">Invoices</div>
                    <div class="card-body text-center">
                        <a href="Payment.aspx">
                            <div class="btn btn-primary btn-inside" id="btnAddPayment" runat="server" onclick="btnAddPayment_Click"><i class="fas fa-plus" style="margin-right: 5px;"></i>Add Invoice</div>
                        </a>
                        <div class="btn btn-primary btn-inside" data-target="#UpdatePayment" data-toggle="modal"><i class="fas fa-pencil-alt " style="margin-right: 5px;"></i>Edit Invoice</div>

                        <p></p>
                        <div class="block3">
                               <%--determines which tab is active for the Animal--%>
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

                               <%--tabs to switch between the different views of the invoice types--%>
                            <ul class="nav nav-tabs block4" id="myTab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active TabStyle" id="CurrentInvoiceNav" data-toggle="tab" href="#CurrentInvoice" style="color: black;">Current Invoices</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link TabStyle" id="CancelledInvoiceNav" data-toggle="tab" href="#CancelledInvoice" style="color: black;">Cancelled</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link TabStyle" id="YearlyInvoiceNav" data-toggle="tab" href="#YearlyInvoice" style="color: black;">Yearly</a>
                            </ul>

                            <br />



                               <%--allows the user to select a month and year to view an invoice about  --%>
                            <div class="tab-content">
                                <div id="CurrentInvoice" class="container1 block3 tab-pane  WildTable active">
                                    <div class="InternalTab">
                                        <div class="col-md-12 ProgramTitle">
                                            <div class="mx-auto d-flex justify-content-center">

                                                <asp:DropDownList ID="drpMonth" class="form-control" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="MonthName" DataValueField="MonthName">
                                                    <asp:ListItem>--Select Month--</asp:ListItem>
                                                </asp:DropDownList>&nbsp&nbsp&nbsp&nbsp
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:WildTekConnectionString %>" SelectCommand="SELECT CASE { fn MONTH(paymentDate) } 
            when 1 then 'January'
            when 2 then 'February'
            when 3 then 'March'
            when 4 then 'April'
            when 5 then 'May'
            when 6 then 'June'
            when 7 then 'July'
            when 8 then 'August'
            when 9 then 'September'
            when 10 then 'October'
            when 11 then 'November'
            when 12 then 'December'
           END as MonthName FROM [PaymentRecord] Group by { fn MONTH(paymentDate) } order by { fn MONTH(paymentDate) }"></asp:SqlDataSource>

                                                <asp:DropDownList ID="drpYear" class="form-control" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource4" DataTextField="YEAR" DataValueField="YEAR">
                                                    <asp:ListItem>--Select Year--</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:WildTekConnectionString %>"
                                                    SelectCommand="SELECT Distinct(YEAR(paymentDate)) AS YEAR FROM PaymentRecord"></asp:SqlDataSource>

                                            </div>
                                            <br />
                                            <div class="ReportTitle text-center">Current Invoices</div>

                                        </div>

                                        <div class="row table-responsive mx-auto d-flex  justify-content-center">
                                            <div class="col-xl-12 col-lg-10 col-md-12 col-sm-12 col-xs-12 ">
                                                <br />
                                                <br />

                                                   <%--gridview to see information about the payments/ invoices--%>
                                                <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="PaymentID"
                                                    OnRowDataBound="GridView1_RowDataBound" EmptyDataText="There are no records to display." class="table  table-condensed table-hover" HeaderStyle-BorderColor="#DDDDDD">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="Select">
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="chkSelect" HorizontalAlign="Center" runat="server" Width="110px" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="PaymentDate" HeaderText="Invoice Date" SortExpression="PaymentDate"></asp:BoundField>
                                                        <asp:BoundField DataField="PaymentAmount" HeaderText="Payment Amount" DataFormatString="{0:c}" SortExpression="PaymentAmount"></asp:BoundField>
                                                        <asp:BoundField DataField="PaymentType" HeaderText="Payment Type" SortExpression="PaymentType" />
                                                        <asp:BoundField DataField="CheckNumber" HeaderText="CheckNumber" SortExpression="CheckNumber" InsertVisible="True"></asp:BoundField>

                                                        <asp:BoundField DataField="ProgramName" HeaderText="Program" SortExpression="ProgramName" />
                                                        <asp:BoundField DataField="OrgName" HeaderText="Organization" SortExpression="OrgName"></asp:BoundField>

                                                        <asp:BoundField DataField="PaymentID" HeaderText="PaymentID" SortExpression="PaymentID" Visible="True" ItemStyle-CssClass="d-none" HeaderStyle-CssClass="d-none" ReadOnly="True" />
                                                        <asp:BoundField DataField="Invoice" HeaderText="Invoice" SortExpression="Invoice" />
                                                        <asp:BoundField DataField="Paid" HeaderText="Paid?" SortExpression="Paid" ReadOnly="True" />
                                                    </Columns>

                                                    <HeaderStyle BackColor="#C7BFC4" ForeColor="Black"></HeaderStyle>

                                                </asp:GridView>
                                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WildTekConnectionString %>"
                                                    SelectCommand="SELECT convert(varchar, PaymentDate,101) as PaymentDate,[PaymentAmount], [CheckNumber],  [PaymentType], ProgramName, [OrgName],Program.PaymentID,[Invoice], PaymentRecord.Paid
                                            FROM [Program] inner join [Organization] on  Program.OrgID = Organization.OrgID inner join [PaymentRecord] 
											on PaymentRecord.PaymentID = Program.PaymentID inner join ProgramType on Program.ProgramTypeID = ProgramType.ProgramTypeID  WHERE (CASE { fn MONTH(paymentDate) } 
                                            when 1 then 'January'
                                            when 2 then 'February'
                                            when 3 then 'March'
                                            when 4 then 'April'
                                            when 5 then 'May'
                                            when 6 then 'June'
                                            when 7 then 'July'
                                            when 8 then 'August'
                                            when 9 then 'September'
                                            when 10 then 'October'
                                            when 11 then 'November'
                                            when 12 then 'December'
                                           END = @Month ) AND (YEAR(paymentDate)=@Year and paymentRecord.cancelledinvoices !='Y')"
                                                    ProviderName="System.Data.SqlClient">
                                                    <SelectParameters>

                                                        <asp:ControlParameter ControlID="drpMonth" Name="Month" PropertyName="SelectedValue" Type="String" />
                                                        <asp:ControlParameter ControlID="drpYear" Name="Year" PropertyName="SelectedValue" Type="String" />
                                                        <%--   <asp:ControlParameter ControlID="drpOrg" Name="OrgName" PropertyName="SelectedValue"  Type="String" />--%>
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </div>

                                        </div>
                                        <br />
                                        <div class="mx-auto d-flex justify-content-center">
                                            <asp:Button class="btn btn-primary btn-inside" ID="btnExportGrid" runat="server" Text="Export Current Invoices to Excel" OnClick="exportBtnInvoices_ClickAv" />
                                            <asp:Button class="btn btn-primary btn-inside" ID="btnCancelInvoice" runat="server" Text="Cancel Invoice" OnClick="cancelInvoice" />

                                        </div>

                                        <br />

                                        <p></p>
                                    </div>
                                </div>

                                   <%--choose what month and year to view cancelled invoices about--%>
                                <div id="CancelledInvoice" class="container1 block3 tab-pane text-center WildTable">
                                    <div class="InternalTab">
                                        <div class="col-md-12 mx-auto d-flex justify-content-center ProgramTitle">
                                            <br />
                                            <asp:DropDownList ID="drpMonth2" class="form-control" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource7" DataTextField="MonthName" DataValueField="MonthName">
                                                <asp:ListItem></asp:ListItem>
                                            </asp:DropDownList>&nbsp&nbsp&nbsp&nbsp
            <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:WildTekConnectionString %>" SelectCommand="SELECT CASE { fn MONTH(paymentDate) } 
            when 1 then 'January'
            when 2 then 'February'
            when 3 then 'March'
            when 4 then 'April'
            when 5 then 'May'
            when 6 then 'June'
            when 7 then 'July'
            when 8 then 'August'
            when 9 then 'September'
            when 10 then 'October'
            when 11 then 'November'
            when 12 then 'December'
           END as MonthName FROM [PaymentRecord] Group by { fn MONTH(paymentDate) } order by { fn MONTH(paymentDate) }"></asp:SqlDataSource>

                                            <asp:DropDownList ID="drpYear2" class="form-control" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource8" DataTextField="YEAR" DataValueField="YEAR">
                                                <asp:ListItem></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:WildTekConnectionString %>"
                                                SelectCommand="SELECT Distinct(YEAR(paymentDate)) AS YEAR FROM PaymentRecord"></asp:SqlDataSource>
                                            <p></p>
                                            <br />


                                        </div>
                                        <div class="row table-responsive mx-auto d-flex  justify-content-center">
                                            <div class="col-xl-12 col-lg-10 col-md-12 col-sm-12 col-xs-12 ">
                                                <br />

                                                <div class="ReportTitle text-center">Cancelled Invoices</div>
                                                <br />
                                                <asp:GridView HeaderStyle-BorderColor="#DDDDDD" ID="CancelledPaymentGrid" runat="server" GridLines="None" DataSourceID="SqlDataSource5" AutoGenerateColumns="False" DataKeyNames="PaymentID"
                                                    OnRowDataBound="GridView2_RowDataBound" AllowSorting="False" EmptyDataText="There are no records to display." class="table stable-striped table-bordered table-condensed table-hover">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="Select">
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="chkSelect" HorizontalAlign="Center" runat="server" Width="110px" />
                                                            </ItemTemplate>

                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="PaymentDate" HeaderText="Invoice Date" SortExpression="PaymentDate"></asp:BoundField>
                                                        <asp:BoundField DataField="PaymentAmount" HeaderText="Payment Amount" DataFormatString="{0:c}" SortExpression="PaymentAmount"></asp:BoundField>
                                                        <asp:BoundField DataField="PaymentType" HeaderText="Payment Type" SortExpression="PaymentType" />
                                                        <asp:BoundField DataField="CheckNumber" HeaderText="CheckNumber" SortExpression="CheckNumber" InsertVisible="True"></asp:BoundField>

                                                        <asp:BoundField DataField="ProgramName" HeaderText="Program" SortExpression="ProgramName" />
                                                        <asp:BoundField DataField="OrgName" HeaderText="Organization" SortExpression="OrgName"></asp:BoundField>

                                                        <asp:BoundField DataField="PaymentID" HeaderText="PaymentID" SortExpression="PaymentID" Visible="False" ReadOnly="True" />
                                                        <asp:BoundField DataField="Invoice" HeaderText="Invoice" SortExpression="Invoice" />
                                                    </Columns>
                                                    <HeaderStyle BackColor="#C7BFC4" ForeColor="Black"></HeaderStyle>
                                                </asp:GridView>
                                                <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:WildTekConnectionString %>"
                                                    SelectCommand="SELECT convert(varchar, PaymentDate,101) as PaymentDate,[PaymentAmount], [CheckNumber],  [PaymentType], ProgramName, [OrgName],Program.PaymentID,[Invoice], Program.Paid
                                            FROM [Program] inner join [Organization] on  Program.OrgID = Organization.OrgID inner join [PaymentRecord] 
											on PaymentRecord.PaymentID = Program.PaymentID inner join ProgramType on Program.ProgramTypeID = ProgramType.ProgramTypeID WHERE (CASE { fn MONTH(paymentDate) } 
                                            when 1 then 'January'
                                            when 2 then 'February'
                                            when 3 then 'March'
                                            when 4 then 'April'
                                            when 5 then 'May'
                                            when 6 then 'June'
                                            when 7 then 'July'
                                            when 8 then 'August'
                                            when 9 then 'September'
                                            when 10 then 'October'
                                            when 11 then 'November'
                                            when 12 then 'December'
                                           END = @Month ) AND (YEAR(paymentDate)=@Year and paymentRecord.cancelledinvoices ='Y')"
                                                    ProviderName="System.Data.SqlClient">
                                                    <SelectParameters>

                                                        <asp:ControlParameter ControlID="drpMonth2" Name="Month" PropertyName="SelectedValue" Type="String" />
                                                        <asp:ControlParameter ControlID="drpYear2" Name="Year" PropertyName="SelectedValue" Type="String" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </div>
                                            <br />
                                            <div class="mx-auto d-flex justify-content-center">

                                                <asp:Button class="btn btn-primary btn-inside" ID="btnExportCancelled" runat="server" Text="Export Cancelled Invoices to Excel" OnClick="exportBtnCancelled" />

                                            </div>
                                        </div>
                                    </div>
                                </div>



                         <%--determines year t oview all current and cancelled invoices about --%>
                                <div id="YearlyInvoice" class="container1 block3 tab-pane  text-center WildTable">
                                    <div class="InternalTab ">
                                        <div class="col-md-12 ProgramTitle mx-auto d-flex justify-content-center">
                                            <asp:DropDownList ID="drpYear3" runat="server" class="form-control" AutoPostBack="True" DataSourceID="SqlDataSource6" DataTextField="YEAR" DataValueField="YEAR">
                                                <asp:ListItem></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:WildTekConnectionString %>"
                                                SelectCommand="SELECT Distinct(YEAR(paymentDate)) AS YEAR FROM PaymentRecord"></asp:SqlDataSource>

                                        </div>
                                        <br />
                                        <div class="ReportTitle text-center">Current Invoices Based on Year</div>

                                    </div>


                                    <div class="row table-responsive mx-auto d-flex  justify-content-center">
                                        <div class="col-xl-12 col-lg-10 col-md-12 col-sm-12 col-xs-12 ">
                                            <br />


                                            <asp:GridView ID="YearlyInvoiceGrid" HeaderStyle-BorderColor="#DDDDDD" HeaderStyle-BackColor="#FFBC7C" AllowSorting="True"
                                                HeaderStyle-ForeColor="#732700" runat="server" DataSourceID="SqlDataSource3" AutoGenerateColumns="False" DataKeyNames="PaymentID"
                                                OnRowDataBound="YearlyInvoiceGrid_RowDataBound" EmptyDataText="There are no records to display." class="table  table-condensed table-hover">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Select">
                                                        <ItemTemplate>
                                                            <asp:CheckBox ID="chkSelect" HorizontalAlign="Center" runat="server" Width="110px" />
                                                        </ItemTemplate>

                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="PaymentDate" HeaderText="Invoice Date" SortExpression="PaymentDate">
                                                        <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="PaymentAmount" HeaderText="PaymentAmount" DataFormatString="{0:c}" SortExpression="PaymentAmount"></asp:BoundField>
                                                    <asp:BoundField DataField="PaymentType" HeaderText="PaymentType" SortExpression="PaymentType" />
                                                    <asp:BoundField DataField="CheckNumber" HeaderText="CheckNumber" SortExpression="CheckNumber" InsertVisible="True"></asp:BoundField>

                                                    <asp:BoundField DataField="ProgramName" HeaderText="Program" SortExpression="ProgramName" />
                                                    <asp:BoundField DataField="OrgName" HeaderText="Organization" SortExpression="OrgName"></asp:BoundField>

                                                    <asp:BoundField DataField="PaymentID" HeaderText="PaymentID" SortExpression="PaymentID" Visible="False" ReadOnly="True" />
                                                    <asp:BoundField DataField="Invoice" HeaderText="Invoice" SortExpression="Invoice" />
                                                    <asp:BoundField DataField="Paid" HeaderText="Paid?" SortExpression="Paid" ReadOnly="True" />
                                                </Columns>

                                                <HeaderStyle BackColor="#C7BFC4" ForeColor="Black"></HeaderStyle>

                                            </asp:GridView>
                                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:WildTekConnectionString %>"
                                                SelectCommand="SELECT convert(varchar, PaymentDate,101) as PaymentDate,[PaymentAmount], [CheckNumber],  [PaymentType], ProgramName, [OrgName],Program.PaymentID,[Invoice], Paymentrecord.Paid
                                            FROM [Program] inner join [Organization] on  Program.OrgID = Organization.OrgID inner join [PaymentRecord] 
											on PaymentRecord.PaymentID = Program.PaymentID inner join ProgramType on Program.ProgramTypeID = ProgramType.ProgramTypeID  WHERE 
                                            (YEAR(paymentDate)=@Year and paymentRecord.cancelledinvoices ='N')"
                                                ProviderName="System.Data.SqlClient">
                                                <SelectParameters>

                                                    <asp:ControlParameter ControlID="drpYear3" Name="Year" PropertyName="SelectedValue" Type="String" />
                                                    <%--   <asp:ControlParameter ControlID="drpOrg" Name="OrgName" PropertyName="SelectedValue"  Type="String" />--%>
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </div>

                                    </div>
                                    <div class="mx-auto d-flex justify-content-center">
                                        <asp:Button ID="btnyearly" runat="server" Text="Export Invoices to Excel" class="btn btn-primary btn-inside" OnClick="exportBtnYearly_Click" />

                                    </div>

                                    <br />
                                </div>
                            </div>


                        </div>

                        <%-- Version 1 All --%>
                        <div class="tab-content">
                            <div id="" class="tab-pane show active">
                                <div class="block justify-content-center table-responsive">
                                </div>


                            </div>
                        </div>

                    </div>
                </div>


            </div>
        </div>


    </div>

</asp:Content>


