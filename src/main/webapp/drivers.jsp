<%@ page language="java" import="com.cabbooking.model.User" %>
<%
    User admin = (User) session.getAttribute("admin");
    if (admin == null || !"admin".equals(admin.getRole())) {
        response.sendRedirect("admin-login.jsp?error=Unauthorized Access");
        return;
    }
%>
<%@ page language="java" import="java.sql.*" %>
<%@ page import="com.cabbooking.utils.DatabaseConnection" %>
<%
    Connection conn = DatabaseConnection.getInstance().getConnection();
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * FROM drivers");
%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Admin Dashboard</title>

    <!-- Custom fonts for this template-->
    <link href="adminAssets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="adminAssets/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-car"></i>
                </div>
                <div class="sidebar-brand-text mx-3">MegaCityCab</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="index.html">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>Dashboard</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Options
            </div>

           

            <!-- Nav Item - Bookings -->
            <li class="nav-item">
                <a class="nav-link" href="admin-bookings.jsp">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>Bookings</span></a>
            </li>

            <!-- Nav Item - Drivers & Cab -->
            <li class="nav-item">
                <a class="nav-link" href="drivers.jsp">
                    <i class="fas fa-fw fa-table"></i>
                    <span>Drivers & Cab</span></a>
            </li>
            
            <!-- Nav Item - Customers -->
            <li class="nav-item">
                <a class="nav-link" href="admin-customers.jsp">
                    <i class="fas fa-fw fa-table"></i>
                    <span>Customers</span></a>
            </li>
            
            <!-- Nav Item - Inquiry -->
            <li class="nav-item">
                <a class="nav-link" href="inquiry.jsp">
                    <i class="fas fa-fw fa-table"></i>
                    <span>Inquiry</span></a>
            </li>
            
            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Reports
            </div>
            
            <!-- Nav Item - Income Report -->
            <li class="nav-item">
                <a class="nav-link" href="income-report.jsp">
                    <i class="fas fa-fw fa-table"></i>
                    <span>Income Report</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>

                    <!-- Topbar Search -->
                    <form
                        class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                        <div class="input-group">
                            <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
                                aria-label="Search" aria-describedby="basic-addon2">
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="button">
                                    <i class="fas fa-search fa-sm"></i>
                                </button>
                            </div>
                        </div>
                    </form>

                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                        <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                        <li class="nav-item dropdown no-arrow d-sm-none">
                            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-search fa-fw"></i>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                aria-labelledby="searchDropdown">
                                <form class="form-inline mr-auto w-100 navbar-search">
                                    <div class="input-group">
                                        <input type="text" class="form-control bg-light border-0 small"
                                            placeholder="Search for..." aria-label="Search"
                                            aria-describedby="basic-addon2">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button">
                                                <i class="fas fa-search fa-sm"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </li>

                            

                        <div class="topbar-divider d-none d-sm-block"></div>

                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small"> <%= admin.getUsername() %>!</span>
                                <img class="img-profile rounded-circle"
                                    src="adminAssets/img/undraw_profile.svg">
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                              
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="AdminLogoutServlet">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Logout
                                </a>
                            </div>
                        </li>

                    </ul>

                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">Drivers & Cab</h1>
                         <!-- Button to Open Modal -->
    					<button class="btn btn-success mb-3" data-bs-toggle="modal" data-bs-target="#driverModal" onclick="resetForm()">Add New</button>
                    </div>

                    <!-- Content Row -->
                    <div class="row">

                        <!-- DataTales Example -->
                    <div class="card shadow mb-4" style="width: 100%;">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Drivers & Cab Table</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Name</th>
                                            <th>Phone</th>
                                            <th>Vehicle No</th>
                                            <th>Vehicle Type</th>
                                            <th>Model</th>
                                            <th>Seats</th>
                                            <th>Status</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>ID</th>
                                            <th>Name</th>
                                            <th>Phone</th>
                                            <th>Vehicle No</th>
                                            <th>Vehicle Type</th>
                                            <th>Model</th>
                                            <th>Seats</th>
                                            <th>Status</th>
                                            <th>Actions</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <% while (rs.next()) { %>
								        <tr>
								            <td><%= rs.getInt("id") %></td>
								            <td><%= rs.getString("name") %></td>
								            <td><%= rs.getString("phone") %></td>
								            <td><%= rs.getString("vehicle_no") %></td>
								            <td><%= rs.getString("vehicle_type") %></td>
								            <td><%= rs.getString("model") %></td>
								            <td><%= rs.getInt("number_of_seats") %></td>
								            <td><%= rs.getString("status") %></td>
								            <td>
								                <button class="btn btn-warning btn-sm" data-bs-toggle="modal" data-bs-target="#driverModal"
								                        onclick="editDriver('<%= rs.getInt("id") %>', '<%= rs.getString("name") %>', '<%= rs.getString("phone") %>', 
								                                            '<%= rs.getString("vehicle_no") %>', '<%= rs.getString("status") %>', 
								                                            '<%= rs.getString("vehicle_type") %>', '<%= rs.getString("model") %>', 
								                                            '<%= rs.getInt("number_of_seats") %>')">
								                    Edit
								                </button>
								                <form action="DriverServlet" method="post" style="display:inline;">
								                    <input type="hidden" name="action" value="delete">
								                    <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
								                    <button type="submit" class="btn btn-danger btn-sm">Delete</button>
								                </form>
								            </td>
								        </tr>
								        <% } %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    </div>

                    <!-- Content Row -->

                    

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->
            
            
            

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your MegaCityCab 2025</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Bootstrap Modal for Add/Edit -->
<div class="modal fade" id="driverModal" tabindex="-1" aria-labelledby="driverModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="driverModalLabel">Add Driver</h5>
                <button type="button" class="btn btn-danger btn-close " data-bs-dismiss="modal" aria-label="Close">X</button>
            </div>
            <div class="modal-body">
                <form action="DriverServlet" method="post" id="driverForm">
                    <input type="hidden" name="action" id="action" value="add">
                    <input type="hidden" name="id" id="id">
                    <div class="mb-3">
                        <label>Name:</label>
                        <input type="text" name="name" id="name" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label>Phone:</label>
                        <input type="text" name="phone" id="phone" class="form-control" required>
                    </div>
                    
                    <div class="mb-3">
                        <label>Vehicle Type:</label>
                        <input type="text" name="vehicle_type" id="vehicle_type" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label>Model:</label>
                        <input type="text" name="model" id="model" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label>Number of Seats:</label>
                        <input type="number" name="number_of_seats" id="number_of_seats" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label>Vehicle No:</label>
                        <input type="text" name="vehicle_no" id="vehicle_no" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label>Status:</label>
                        <select name="status" id="status" class="form-control" required>
                            <option value="Available">Available</option>
                            <option value="Occupied">Occupied</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary" id="submitButton">Save</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    function resetForm() {
        document.getElementById("driverForm").reset();
        document.getElementById("action").value = "add";
        document.getElementById("id").value = "";
        document.getElementById("driverModalLabel").innerText = "Add Driver";
        document.getElementById("submitButton").innerText = "Add Driver";
    }

    function editDriver(id, name, phone, vehicle_no, status, vehicle_type, model, number_of_seats) {
        document.getElementById("action").value = "edit";
        document.getElementById("id").value = id;
        document.getElementById("name").value = name;
        document.getElementById("phone").value = phone;
        document.getElementById("vehicle_no").value = vehicle_no;
        document.getElementById("status").value = status;
        document.getElementById("vehicle_type").value = vehicle_type;
        document.getElementById("model").value = model;
        document.getElementById("number_of_seats").value = number_of_seats;
        document.getElementById("driverModalLabel").innerText = "Edit Driver";
        document.getElementById("submitButton").innerText = "Update Driver";
    }
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Bootstrap core JavaScript-->
    <script src="adminAssets/vendor/jquery/jquery.min.js"></script>
    <script src="adminAssets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="adminAssets/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="adminAssets/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="adminAssets/adminAssets/vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="adminAssets/js/demo/chart-area-demo.js"></script>
    <script src="adminAssets/js/demo/chart-pie-demo.js"></script>

</body>

</html>
