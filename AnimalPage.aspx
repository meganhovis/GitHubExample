<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AnimalPage.aspx.cs" Inherits="AnimalPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

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

    <!--Import Google Icon Font-->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!-- Compiled and minified CSS -->
    <%--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-rc.2/css/materialize.min.css">--%>
    
    <!-- Scripts used to create the map for geotracking, sshowing the position of the Animal -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-rc.2/js/materialize.min.js"></script>
    <script type="text/javascript">
        var map;
        var poly;
        var directionsService;
        var directionsDisplay;
        var geocoder;
        var start = { lat: -34.397, lng: 150.644 };
        var end = { lat: -34.397, lng: 150.644 };
        var selectedMode = 'DRIVING';
        var tranistModeImage = {
            DRIVING: "https://media.giphy.com/media/11UMYzdwjIbLjy/giphy.gif",
            WALKING: "https://media.giphy.com/media/11UMYzdwjIbLjy/giphy.gif",
            BICYCLING:
                "https://media.giphy.com/media/11UMYzdwjIbLjy/giphy.gif",
            TRANSIT: "https://media.giphy.com/media/11UMYzdwjIbLjy/giphy.gif"
        }
        function initMap() {
            directionsDisplay = new google.maps.DirectionsRenderer();
            directionsService = new google.maps.DirectionsService()
            geocoder = new google.maps.Geocoder;
            infoWindow = new google.maps.InfoWindow;
            // Try HTML5 geolocation.
            if (navigator.geolocation) {

                //Live tracking
                navigator.geolocation.watchPosition(function (position) {
                    //Get current postion
                    var pos = new google.maps.LatLng(
                        position.coords.latitude,
                        position.coords.longitude);

                    //Show Lat Long
                    document.getElementById("position").textContent =
                        'Lat: ' + position.coords.latitude +
                        ' Long: ' + position.coords.longitude;

                    // reverse geocode lat long to get zip code
                    getZipCodeFromPosition(geocoder, map, pos, infoWindow);

                    addLatLng(pos);
                });

                //SHow current postion
                navigator.geolocation.getCurrentPosition(function (position) {
                    //Get current postion
                    var pos = {
                        lat: position.coords.latitude,
                        lng: position.coords.longitude
                    };
                    console.log(pos);

                    //Focus map to current postion
                    map = new google.maps.Map(document.getElementById('map'), {
                        center: pos,
                        zoom: 11
                    });

                    //Add Marker on current postion
                    marker = new google.maps.Marker({ position: pos, map: map });

                    //Show Info Window

                    // infoWindow =.setContent('Location found.');
                    infoWindow = new google.maps.InfoWindow({
                        content: 'Location found.',
                        maxWidth: 200
                    });
                    infoWindow.setPosition(pos);

                    infoWindow.open(map);
                    map.setCenter(pos);

                    //Route Between two points
                    start = pos;
                    end = new google.maps.LatLng(18.5922, 73.6845);
                    calcRoute(start, end);

                    //Draw Polygon
                    poly = new google.maps.Polyline({
                        strokeColor: '#FF0000',
                        strokeOpacity: 1.0,
                        strokeWeight: 3
                    });
                    poly.setMap(map);
                    // Add a listener for the click event
                    map.addListener('click', function (event) {

                        console.log("Click: " + event.latLng);

                        addLatLng(event.latLng);
                    });

                    //addLatLng);

                }, function () {
                    handleLocationError(true, infoWindow, map.getCenter());
                });
            } else {
                // Browser doesn't support Geolocation
                handleLocationError(false, infoWindow, map.getCenter());
            }
        }
        // Handles click events on a map, and adds a new point to the Polyline.
        function addLatLng(latLng) {
            var path = poly.getPath();

            console.log("Show Location: " + latLng);
            // Because path is an MVCArray, we can simply append a new coordinate
            // and it will automatically appear.
            path.push(latLng);
            // Add a new marker at the new plotted point on the polyline.
            var marker = new google.maps.Marker({
                position: latLng,
                title: '#' + path.getLength(),
                map: map
            });
        }
        function showPosition(position) {

            var pos = {
                lat: position.coords.latitude,
                lng: position.coords.longitude
            }

            console.log("Show Postion: " + pos)

            var testPath = poly.getPath();
            // Because path is an MVCArray, we can simply append a new coordinate
            // and it will automatically appear.
            testPath.push(pos);
            // Add a new marker at the new plotted point on the polyline.
            var marker = new google.maps.Marker({
                position: pos,
                title: '#' + testPath.getLength(),
                map: map
            });
        }
        //Reverse GeoCode position into Address and ZipCOde
        function getZipCodeFromPosition(geocoder, map, latlng, userLocationInfoWindow) {
            geocoder.geocode({ 'location': latlng }, function (result, status) {
                if (status === 'OK') {
                    if (result[0]) {
                        console.log("GeoCode Results Found:" + JSON.stringify(result));
                        //Display Address
                        document.getElementById("address").textContent = "Address: " + result[0].formatted_address;
                        //Update Info Window on Server Map
                        userLocationInfoWindow.setPosition(latlng);
                        userLocationInfoWindow.setContent('<IMG BORDER="0" ALIGN="Left" SRC=' + tranistModeImage[selectedMode] + ' style ="width:50px; height:50px"><h6 class ="pink-text">You Are Here</h4> <p class = "purple-text" style ="margin left:30px;">' + result[0].formatted_address + '</p>');

                        userLocationInfoWindow.open(map);
                        map.setCenter(latlng);
                        //Try to Get Postal Code
                        var postal = null;
                        var city = null;
                        var state = null;
                        var country = null;
                        for (var i = 0; i < result.length; ++i) {
                            if (result[i].types[0] == "postal_code") {
                                postal = result[i].long_name;
                            }
                            if (result[i].types[0] == "administrative_area_level_1") {
                                state = result[i].long_name;
                            }
                            if (result[i].types[0] == "locality") {
                                city = result[i].long_name;
                            }
                            if (result[i].types[0] == "country") {
                                country = result[i].long_name;
                            }
                        }
                        if (!postal) {
                            geocoder.geocode({ 'location': result[0].geometry.location }, function (results, status) {
                                if (status == google.maps.GeocoderStatus.OK) {
                                    //Postal Code Not found, Try to get Postal code for City
                                    var result = results[0].address_components;
                                    for (var i = 0; i < result.length; ++i) {
                                        if (result[i].types[0] == "postal_code") {
                                            postal = result[i].long_name;
                                        }
                                    }
                                    if (!postal) {
                                        //Postal Code Not found
                                        document.getElementById("postal").value = 'No Postal Code Found  for this location';
                                    } else {
                                        //Postal Code found
                                        document.getElementById("postal").value = +postal;
                                    }
                                }
                            });
                        } else {
                            //Postal Code found
                            document.getElementById("postal").value = +postal;
                        }
                        // console.log("STATE: " + state);
                        // console.log("CITY: " + city);
                        // console.log("COUNTRY: " + country);
                    } else {
                        window.alert('No results found');
                    }
                } else {
                    window.alert('Geocoder failed due to: ' + status);
                }
            });
        }
        function calcRoute(start, end) {

            var request = {
                origin: start,
                destination: end,
                travelMode: google.maps.TravelMode[selectedMode],
            };
            directionsService.route(request, function (response, status) {
                if (status == google.maps.DirectionsStatus.OK) {
                    directionsDisplay.setDirections(response);
                    directionsDisplay.setMap(map);
                } else {
                    alert("Directions Request from " + start.toUrlValue(6) + " to " + end.toUrlValue(6) + " failed: " + status);
                }
            });
        }
        function handleLocationError(browserHasGeolocation, infoWindow, pos) {
            infoWindow.setPosition(pos);
            infoWindow.setContent(browserHasGeolocation ?
                'Error: The Geolocation service failed.' :
                'Error: Your browser doesn\'t support geolocation.');

            infoWindow.open(map);
        }
        $(document).ready(function () {
            $('.sidenav').sidenav();
            $('select').formSelect();
            $("#transitMode").on('change', function () {
                selectedMode = document.getElementById('transitMode').value;
                console.log("selectedMode" + selectedMode)
                calcRoute(start, end);
            });
        });
    </script>

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

                <li class="nav-item dropdown no-arrow ">
                    <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">

                        <span>Payment</span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right">
                        <a class="dropdown-item" href="Payment.aspx">New Payment Form</a>
                        <a class="dropdown-item" href="Invoices.aspx">Invoices</a>

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

            <li class="nav-item active dropdown no-arrow ">
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
            <li class="nav-item dropdown no-arrow">
                <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">

                    <span>Payment</span>
                </a>
                <div class="dropdown-menu dropdown-menu-right">
                    <a class="dropdown-item" href="Payment.aspx">New Payment Form</a>
                    <a class="dropdown-item" href="Invoices.aspx">Invoices</a>

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
            <div class="container-fluid ">

                <%--buttons for Add and Edit Animals as pop ups on the Animal Page--%>
                <section class="login-block  col-lg-10 col-xl-8 col-md-10 col-s-5 mx-auto ">
                    
                    <div class="container1">
                        <div class="card  mx-auto mt-3">
                            <div class="card-header NewUserTitle text-center">
                                Animal Listing
                            </div>
                            <div class="card-body">
                                <div class="mx-auto d-flex justify-content-center">
                                    <div class="btn btn-primary btn-inside" data-target="#AddAnimalModal" data-toggle="modal"><i class="fas fa-plus" style="margin-right: 5px;"></i>Add Animal</div>
                                    <div class="btn btn-primary btn-inside" data-target="#EditAnimalModal" data-toggle="modal"><i class="fas fa-pencil-alt " style="margin-right: 5px;"></i>Edit Animal</div>
                                </div>

                                <br />

                                <asp:Panel ID="p" runat="server" DefaultButton="btnSearch">

                                    <div class="row mx-auto d-flex justify-content-center">

                                        <div class=" col-xl-3 col-lg-4 col-md-3 col-sm-0 col-xs-0">
                                        </div>

                                        <div class="col-xl-4 col-lg-0 col-md-0 col-sm-0 col-xs-0"></div>
                                        <div class="col-xl-3 col-lg-5 col-md-6 col-sm-8 col-xs-8 text-right ">
                                            <asp:TextBox class=" form-control" ID="txtSearch" runat="server"></asp:TextBox>

                                        </div>

                                        <div class="col-xl-2 col-lg-3 col-md-3 col-sm-3 col-xs-3 ">
                                            <asp:Button ID="btnSearch" runat="server" class="btn-block btn" Style="background-color: #C7BFC4;" Text="Search" OnClick="btnSearch_Click" />
                                        </div>
                                    </div>
                                    </asp:Panel>




                                <%--Animal Search Bar and Results--%>
                                    <div class="col-lg-12 col-md-12 col-s-12 mx-auto">

                                        <div class="container1 block">
                                            <div runat="server" id="AnimalSearchDiv">

                                                <div runat="server" id="ViewAnimals">
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


                                                        <div class="col-md-12 mx-auto d-flex justify-content-center">
                                                            <br />
                                                            <br />
                                                            <%--results of the Search for an Animal--%>
                                                            <asp:GridView ID="gridSearch" class="table table-bordered table-borderless table-striped table-condensed " HeaderStyle-BackColor="#C7BFC4"
                                                                HeaderStyle-ForeColor="Black" runat="server" AutoGenerateColumns="False" AllowSorting="True">
                                                                <Columns>
                                                                    <asp:BoundField DataField="AnimalType" HeaderText="Animal Type" SortExpression="AnimalType" />
                                                                    <asp:BoundField DataField="AnimalName" HeaderText="Animal Name" SortExpression="AnimalName" />
                                                                    <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                                                                </Columns>
                                                            </asp:GridView>

                                                            <br />
                                                            <br />
                                                            <br />
                                                        </div>
                                                    </div>
                                                </div>



                                            </div>
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

                                            <%-- this div  is the internal div to create the Tabs to view the different types of Animals--%>

                                            <ul class="nav nav-tabs block4" id="myTab" role="tablist">
                                                <li class="nav-item">
                                                    <a class="nav-link active TabStyle" data-toggle="tab" href="#AnimalsAllTab" style="color: black;">All</a>
                                                </li>
                                                <li class="nav-item">
                                                    <a class="nav-link TabStyle" data-toggle="tab" href="#AnimalsMammalTab" style="color: black;">Mammal</a>
                                                </li>
                                                <li class="nav-item">
                                                    <a class="nav-link TabStyle" data-toggle="tab" href="#AnimalsReptileTab" style="color: black;">Reptile</a>
                                                </li>
                                                <li class="nav-item">
                                                    <a class="nav-link TabStyle" data-toggle="tab" href="#AnimalsBirdTab" style="color: black;">Bird</a>
                                                </li>
                                          
                                            </ul>
                                              <%--View all Animals--%>
                                            <div class="tab-content">
                                                <div id="AnimalsAllTab" class="container1 block3 tab-pane  WildTable active">
                                                    <div class="InternalAnimalTab">
                                                        <div class="grid-mammal text-center">

                                                            <h4 class="alert d-none d-md-block" style="background-color: #C7BFC4 !important; color: Black !important;">Mammal</h4>
                                                            <h4 class="alert d-md-none" style="background-color: #C7BFC4 !important; color: Black !important;">M</h4>

                                                            <asp:GridView ID="GridView1" class="table table-borderless table-condensed table-striped  " runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource4" AllowSorting="True">
                                                                <Columns>
                                                                    <asp:BoundField DataField="AnimalType" HeaderText="Animal Type" SortExpression="AnimalType" Visible="False">
                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField DataField="AnimalName" SortExpression="AnimalName">

                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                    </asp:BoundField>


                                                                </Columns>

                                                            </asp:GridView>
                                                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:WildTekConnectionString %>"
                                                                SelectCommand="SELECT [AnimalType], [AnimalName] FROM [Animal] WHERE ([AnimalType] = 'Mammal') ORDER BY [AnimalName]"></asp:SqlDataSource>
                                                        </div>
                                                         
                                                        <div class="grid-reptile text-center">

                                                            <h4 class="alert d-none d-md-block" style="background-color: #C7BFC4 !important; color: Black !important;">Reptile</h4>
                                                            <h4 class="alert d-md-none" style="background-color: #C7BFC4 !important; color: Black !important;">R</h4>

                                                            <asp:GridView ID="GridView2" class="table table-borderless table-condensed table-striped  " runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource5" AllowSorting="True">
                                                                <Columns>
                                                                    <asp:BoundField DataField="AnimalType" HeaderText="Animal Type" SortExpression="AnimalType" Visible="False" />
                                                                    <asp:BoundField DataField="AnimalName" SortExpression="AnimalName" />

                                                                </Columns>
                                                            </asp:GridView>

                                                            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:WildTekConnectionString %>" SelectCommand="SELECT [AnimalName], [AnimalType] FROM [Animal] WHERE ([AnimalType] = 'Reptile') ORDER BY [AnimalName]"></asp:SqlDataSource>


                                                        </div>
                                                       
                                                        <div class="grid-bird text-center ">

                                                            <h4 class="alert d-none d-md-block" style="background-color: #C7BFC4 !important; color: Black !important;">Bird</h4>
                                                            <h4 class="alert d-md-none" style="background-color: #C7BFC4 !important; color: Black !important;">B</h4>
                                                            <asp:GridView ID="GridView3" class="table table-borderless table-condensed table-striped " runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource6" AllowSorting="True">
                                                                <Columns>
                                                                    <asp:BoundField DataField="AnimalName" SortExpression="AnimalName" />

                                                                </Columns>
                                                            </asp:GridView>

                                                            <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:WildTekConnectionString %>" SelectCommand="SELECT [AnimalType], [AnimalName] FROM [Animal] WHERE ([AnimalType] = 'Bird') ORDER BY [AnimalName]" ProviderName="System.Data.SqlClient"></asp:SqlDataSource>
                                                        </div>
                                                    </div>
                                                </div>

                                                  <%--View Mammals--%>
                                                <div id="AnimalsMammalTab" class="container1 block3 tab-pane text-center WildTable">
                                                    <div class="InternalAnimalTab">

                                                        <div class="row mx-auto d-flex justify-content-center">
                                                            <div class="col-4">
                                                                <h4 class="alert d-none d-lg-block" style="background-color: #C7BFC4 !important; color: Black !important;">Animal Name</h4>
                                                                <h4 class=" d-md-none" style="background-color: #AB9993 !important; color: white !important;">Name</h4>
                                                                <h4 class="alert d-none d-md-block d-lg-none" style="background-color: #C7BFC4 !important; color: Black !important;">Name</h4>
                                                            </div>

                                                            <div class="col-4">
                                                                <h4 class="alert d-none d-md-block" style="background-color: #C7BFC4 !important; color: Black !important;">Status</h4>
                                                                <h4 class=" d-md-none " style="background-color: #AB9993 !important; color: white !important;">Status</h4>
                                                            </div>
                                                            <div class="col-4">
                                                                <h4 class="alert d-none d-md-block" style="background-color: #C7BFC4 !important; color: Black !important;">Image</h4>
                                                                <h4 class=" d-md-none" style="background-color: #AB9993 !important; color: white !important;">Image</h4>
                                                            </div>
                                                        </div>

                                                        <asp:GridView ID="gridAnimalMammal" class="table table-borderless table-striped table-condensed" runat="server" AutoGenerateColumns="False" AllowSorting="True" DataSourceID="SqlDataSource2" OnRowDataBound="gridMammal_RowDataBound">
                                                            <Columns>
                                                                <%-- <asp:BoundField DataField="AnimalType" HeaderText="Animal Type" SortExpression="AnimalType" Visible="False" />--%>
                                                                <asp:BoundField DataField="AnimalName" SortExpression="AnimalName">
                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="Status" SortExpression="Status">
                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                </asp:BoundField>
                                                                <asp:TemplateField>
                                                                    <ItemTemplate>
                                                                        <img src='<%# Eval("AnimalImage") %>' id="imageControl" runat="server" />

                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                            </Columns>

                                                        </asp:GridView>
                                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:WildTekConnectionString %>"
                                                            SelectCommand="SELECT [AnimalType], [AnimalName], [Status], [AnimalImage] FROM [Animal] WHERE ([AnimalType] = @AnimalType) ORDER BY [Status], [AnimalName]">
                                                            <SelectParameters>
                                                                <asp:Parameter DefaultValue="Mammal" Name="AnimalType" Type="String" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>

                                                    </div>
                                                </div>



                                                  <%--View Reptiles--%>
                                                <div id="AnimalsReptileTab" class="container1 block3 tab-pane  text-center WildTable">
                                                    <div class="InternalAnimalTab">

                                                        <div class="row mx-auto d-flex justify-content-center">
                                                            <div class="col-4">
                                                                <h4 class="alert d-none d-lg-block" style="background-color: #C7BFC4 !important; color: Black !important;">Animal Name</h4>
                                                                <h4 class=" d-md-none " style="background-color: #AB9993 !important; color: white !important;">Name</h4>
                                                                <h4 class="alert d-none d-md-block d-lg-none" style="background-color: #C7BFC4 !important; color: Black !important;">Name</h4>
                                                            </div>

                                                            <div class="col-4">
                                                                <h4 class="alert d-none d-md-block" style="background-color: #C7BFC4 !important; color: Black !important;">Status</h4>
                                                                <h4 class=" d-md-none " style="background-color: #AB9993 !important; color: white !important;">Status</h4>
                                                            </div>
                                                            <div class="col-4">
                                                                <h4 class="alert d-none d-md-block" style="background-color: #C7BFC4 !important; color: Black !important;">Image</h4>
                                                                <h4 class=" d-md-none" style="background-color: #AB9993 !important; color: white !important;">Image</h4>
                                                            </div>
                                                        </div>
                                                        <asp:GridView ID="gridReptile" class="table table-borderless table-condensed  table-striped " runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowSorting="True" OnRowDataBound="gridReptile_RowDataBound">
                                                            <Columns>
                                                                <%--  <asp:BoundField DataField="AnimalType"  SortExpression="AnimalType" Visible="False" /> --%>
                                                                <asp:BoundField DataField="AnimalName" SortExpression="AnimalName">
                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="Status" SortExpression="Status">
                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                </asp:BoundField>
                                                                <asp:TemplateField>
                                                                    <ItemTemplate>
                                                                        <img src='<%# Eval("AnimalImage") %>' id="imageControl" runat="server" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                            </Columns>
                                                        </asp:GridView>
                                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WildTekConnectionString %>" SelectCommand="SELECT [AnimalName], [AnimalType], [Status], [AnimalImage] FROM [Animal] WHERE ([AnimalType] = @AnimalType) ORDER BY [Status], [AnimalName]">
                                                            <SelectParameters>
                                                                <asp:Parameter DefaultValue="Reptile" Name="AnimalType" Type="String" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                    </div>
                                                </div>



                                                  <%--View Birds--%>
                                                <div id="AnimalsBirdTab" class="container1 block3 tab-pane text-center  WildTable">
                                                    <div class="InternalAnimalTab">

                                                        <div class="row mx-auto d-flex justify-content-center">
                                                            <div class="col-4">
                                                                <h4 class="alert d-none d-lg-block" style="background-color: #C7BFC4 !important; color: Black !important;">Animal Name</h4>
                                                                <h4 class=" d-md-none " style="background-color: #AB9993 !important; color: white !important;">Name</h4>
                                                                <h4 class="alert d-none d-md-block d-lg-none" style="background-color: #C7BFC4 !important; color: Black !important;">Name</h4>
                                                            </div>

                                                            <div class="col-4">
                                                                <h4 class="alert d-none d-md-block" style="background-color: #C7BFC4 !important; color: Black !important;">Status</h4>
                                                                <h4 class=" d-md-none " style="background-color: #AB9993 !important; color: white !important;">Status</h4>
                                                            </div>
                                                            <div class="col-4">
                                                                <h4 class="alert d-none d-md-block" style="background-color: #C7BFC4 !important; color: Black !important;">Image</h4>
                                                                <h4 class=" d-md-none" style="background-color: #AB9993 !important; color: white !important;">Image</h4>
                                                            </div>
                                                        </div>
                                                        <asp:GridView ID="gridBird" class="table table-borderless table-condensed  table-striped" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" AllowSorting="True" OnRowDataBound="gridBird_RowDataBound">

                                                            <Columns>
                                                                <%--   <asp:BoundField DataField="AnimalType"   SortExpression="AnimalType" Visible="False" /> --%>
                                                                <asp:BoundField DataField="AnimalName" SortExpression="AnimalName">
                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="Status" SortExpression="Status">
                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                </asp:BoundField>
                                                                <asp:TemplateField>
                                                                    <ItemTemplate>
                                                                        <img src='<%# Eval("AnimalImage") %>' id="imageControl" runat="server" />

                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                            </Columns>
                                                        </asp:GridView>

                                                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:WildTekConnectionString %>" SelectCommand="SELECT [AnimalType], [AnimalName], [Status], [AnimalImage] FROM [Animal] WHERE ([AnimalType] = @AnimalType) ORDER BY [Status], [AnimalName]">
                                                            <SelectParameters>
                                                                <asp:Parameter DefaultValue="Bird" Name="AnimalType" Type="String" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                    </div>
                                                </div>


                                                <div id="Location" class="container1 block3 tab-pane text-center  WildTable">
                                                    <div class="InternalAnimalTab">

                                                        <div>

                                                            <div class="row">
                                                                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                    <div class="card">
                                                                        <div class="card-image">
                                                                            <div>
                                                                                <div id="map" style="height: 500px !important"></div>
                                                                            </div>

                                                                        </div>
                                                                        <div class="card-content">
                                                                            <p id="address"></p>

                                                                            <p><a href="#" id="position"></a></p>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <%--http://localhost:58211/createUser.aspx--%>
                                                            </div>




                                                            <!--   Map Section   -->


                                                        </div>
                                                    </div>

                                                </div>
                                            </div>


                                        </div>
                                    </div>
                            </div>
                            <div runat="server" id="Div1">
                            </div>

                        </div>
                    </div>
            </div>
        </div>


        </section>         

 <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB6OktBOKr6jyThXCq7EZNfZop81VImSJs&libraries=places&callback=initMap">
 </script>



    </div>
      <%--Ability to Add an Animal--%>
    <div class="modal fade" id="AddAnimalModal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title text-center" style="font-size: 145% !important; color: #e2561d !important;">Add Animal</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div runat="server" id="AnimalAddDiv">
                        <p>&nbsp;</p>
                        <div class="row">
                            <div class=" col-md-4 InternalAnimalForm">
                                <h6>Animal Type</h6>
                            </div>
                            <div class=" col-md-3 InternalAnimalForm">
                                <asp:DropDownList class="form-control style=" ID="ddlAnimalType" runat="server">
                                    <asp:ListItem>--Animal Type--</asp:ListItem>
                                    <asp:ListItem>Bird</asp:ListItem>
                                    <asp:ListItem>Mammal</asp:ListItem>
                                    <asp:ListItem>Reptile</asp:ListItem>
                                </asp:DropDownList>&nbsp;&nbsp;
                            </div>
                        </div>
                        <div class="row">
                            <div class=" col-md-4 InternalAnimalForm">
                                <h6>Animal Name</h6>
                            </div>
                            <div class=" col-md-3 InternalAnimalForm">
                                <asp:TextBox class="InternalAnimalForm" placeholder=" Animal Name" ID="txtAnimalName" runat="server"></asp:TextBox>&nbsp&nbsp
                            </div>
                        </div>
                        <div>
                        </div>
                        <div class="row">
                            <div class=" col-md-4 InternalAnimalForm">
                                <h6>Status</h6>
                            </div>
                            <div class=" col-md-3 InternalAnimalForm">
                                <asp:DropDownList class="form-control" ID="ddlAnimalStatus" runat="server">
                                    <asp:ListItem>--Status--</asp:ListItem>
                                    <asp:ListItem>Active</asp:ListItem>
                                    <asp:ListItem>Inactive</asp:ListItem>

                                </asp:DropDownList>&nbsp;&nbsp;
                            </div>

                        </div>
                        <div class="row">
                            <div class=" col-md-4 InternalAnimalForm">
                                Upload Picture:
                                <asp:FileUpload ID="FileUpload1" runat="server" />
                            </div>
                        </div>
                        <div class="row">
                            <div class=" col-md-4 InternalAnimalForm">
                                <asp:Image ID="animalImage" runat="server" />
                            </div>
                        </div>
                        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>&nbsp;
            <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <asp:Button ID="Button3" class="btn btn-primary btn-inside" runat="server" Text="Submit" OnClick="btnAdd_Click" />
                    <%-- <button type="button" class="btn btn-primary btn-inside">Save changes</button>--%>
                </div>
            </div>
        </div>
    </div>




    <!-- Edit Animal Modal -->

    <div class="modal fade" id="EditAnimalModal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title text-center" style="font-size: 145% !important; color: #e2561d !important;">Edit Animal</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="ddlAnimal" EventName="SelectedIndexChanged" />
                        <asp:AsyncPostBackTrigger ControlID="btnUpdate" EventName="Click" />
                    </Triggers>
                    <ContentTemplate>
                        <div class="modal-body">
                            <div runat="server" id="AnimalEditDiv">
                                <p>&nbsp;</p>
                                <div class="row">
                                    <div class=" col-md-4 InternalAnimalForm">
                                        <h6>Select Animal</h6>
                                    </div>
                                    <div class=" col-md-3 InternalAnimalForm">
                                        <asp:DropDownList class="form-control" ID="ddlAnimal" runat="server" AppendDataBoundItems="false" AutoPostBack="true" ViewStateMode="Enabled" EnableViewState="true" DataTextField="AnimalName" DataValueField="AnimalID" OnSelectedIndexChanged="ddlAnimal_SelectedIndexChanged1">
                                            <asp:ListItem>--Select Animal--</asp:ListItem>
                                        </asp:DropDownList>&nbsp&nbsp
                                    </div>
                                </div>
                                <div class="row">
                                    <div class=" col-md-4 InternalAnimalForm">
                                        <h6>Animal Type</h6>
                                    </div>
                                    <div class=" col-md-3 InternalAnimalForm">
                                        <asp:DropDownList class="form-control" ID="ddlAnimalTypeEdit" runat="server" AutoPostBack="True">
                                            <%-- Github Merge issue: other version did not have autopostback --%>
                                            <asp:ListItem Text="--Animal Type--" Value=""></asp:ListItem>

                                            <%-- <asp:ListItem>All</asp:ListItem> --%>
                                            <asp:ListItem Text="Bird" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="Mammal" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Reptile" Value="2"></asp:ListItem>
                                        </asp:DropDownList>&nbsp;&nbsp; 
                                    </div>
                                </div>
                                <div class="row">
                                    <div class=" col-md-4 InternalAnimalForm">
                                        <h6>Animal Name</h6>
                                    </div>
                                    <div class=" col-md-3 InternalAnimalForm">
                                        <asp:TextBox ID="txtBoxAnimalName" placeholder=" Animal Name" runat="server"></asp:TextBox>&nbsp&nbsp
                                    </div>
                                </div>
                                <div class="row">
                                    <div class=" col-md-4 InternalAnimalForm">
                                        <h6>Status</h6>
                                    </div>
                                    <div class=" col-md-3 InternalAnimalForm">
                                        <asp:DropDownList class="form-control" ID="ddlStatus" runat="server">
                                            <asp:ListItem>--Status--</asp:ListItem>
                                            <asp:ListItem>Active</asp:ListItem>
                                            <asp:ListItem>Inactive</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <asp:Button ID="btnUpdate" class="btn btn-primary btn-inside" runat="server" Text="Save Changes" OnClick="btnUpdate1_Click" Enabled="true"></asp:Button>

                                </div>

                                <div></div>
                                <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
                                &nbsp;<asp:Label ID="Label4" runat="server" Text=""></asp:Label>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>





    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Page level plugin JavaScript-->
    <script src="vendor/chart.js/Chart.min.js"></script>


    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin.min.js"></script>




    </div>

    </div>
</asp:Content>
