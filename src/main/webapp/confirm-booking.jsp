<%@ page language="java" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page language="java" import="com.cabbooking.model.User" %>
<%
    // Get the session and check if the user is logged in
    HttpSession sessionObj = request.getSession(false);
   // boolean isLoggedIn = (sessionObj != null && sessionObj.getAttribute("user") != null);
    User user = (User) session.getAttribute("user");
    boolean isLoggedIn = (user != null);
%>
<% 
    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String currentDateTime = sdf.format(new java.util.Date());
    String referenceNumber = "MC" + System.currentTimeMillis();
%>

<%
    String pickup = request.getParameter("pickup");
    String dropoff = request.getParameter("dropoff");

    // Distance-based fare calculation
    int distance = 10; // Default distance (for short routes)
    int pricePerKm = 3; 
    int baseFare = 5;

    if (pickup.equals("Colombo") && dropoff.equals("Galle")) distance = 125;
    else if (pickup.equals("Colombo") && dropoff.equals("Kandy")) distance = 120;
    else if (pickup.equals("Colombo") && dropoff.equals("Negombo")) distance = 40;
    else if (pickup.equals("Kandy") && dropoff.equals("Colombo")) distance = 120;
    else if (pickup.equals("Colombo") && dropoff.equals("Matara")) distance = 160;
    else if (pickup.equals("Colombo") && dropoff.equals("Kurunegala")) distance = 94;
    else if (pickup.equals("Colombo") && dropoff.equals("Gampaha")) distance = 30;
    else if (pickup.equals("Colombo") && dropoff.equals("Anuradhapura")) distance = 205;
    else if (pickup.equals("Colombo") && dropoff.equals("Polonnaruwa")) distance = 225;
    else if (pickup.equals("Colombo") && dropoff.equals("Ratnapura")) distance = 80;
    else if (pickup.equals("Colombo") && dropoff.equals("Nuwara Eliya")) distance = 175;
    else if (pickup.equals("Colombo") && dropoff.equals("Jaffna")) distance = 398;
    else if (pickup.equals("Colombo") && dropoff.equals("Trincomalee")) distance = 260;
    else if (pickup.equals("Colombo") && dropoff.equals("Hambantota")) distance = 238;
    else if (pickup.equals("Colombo") && dropoff.equals("Badulla")) distance = 224;
    else if (pickup.equals("Colombo") && dropoff.equals("Puttalam")) distance = 130;
    else if (pickup.equals("Colombo") && dropoff.equals("Batticaloa")) distance = 314;
    else if (pickup.equals("Colombo") && dropoff.equals("Mannar")) distance = 305;
    else if (pickup.equals("Colombo") && dropoff.equals("Mullaitivu")) distance = 350;
    else if (pickup.equals("Colombo") && dropoff.equals("Kataragama")) distance = 290;
    else if (pickup.equals("Colombo") && dropoff.equals("Chilaw")) distance = 85;
    else if (pickup.equals("Colombo") && dropoff.equals("Dambulla")) distance = 148;
    else if (pickup.equals("Colombo") && dropoff.equals("Ella")) distance = 205;
    else if (pickup.equals("Colombo") && dropoff.equals("Avissawella")) distance = 60;
    else if (pickup.equals("Colombo") && dropoff.equals("Hatton")) distance = 135;
    else if (pickup.equals("Colombo") && dropoff.equals("Bandarawela")) distance = 200;
    else if (pickup.equals("Colombo") && dropoff.equals("Vavuniya")) distance = 260;
    else if (pickup.equals("Colombo") && dropoff.equals("Ampara")) distance = 350;
    else if (pickup.equals("Colombo") && dropoff.equals("Kilinochchi")) distance = 360;
    else if (pickup.equals("Colombo") && dropoff.equals("Kalpitiya")) distance = 165;
    else if (pickup.equals("Colombo") && dropoff.equals("Mihintale")) distance = 210;
    else if (pickup.equals("Colombo") && dropoff.equals("Sigiriya")) distance = 170;
    else if (pickup.equals("Colombo") && dropoff.equals("Passikudah")) distance = 320;
    else if (pickup.equals("Colombo") && dropoff.equals("Maduru Oya")) distance = 290;
    else if (pickup.equals("Colombo") && dropoff.equals("Yala")) distance = 270;
    else if (pickup.equals("Colombo") && dropoff.equals("Tangalle")) distance = 195;
    else if (pickup.equals("Colombo") && dropoff.equals("Bentota")) distance = 65;
    else if (pickup.equals("Colombo") && dropoff.equals("Weligama")) distance = 145;
    else if (pickup.equals("Colombo") && dropoff.equals("Deniyaya")) distance = 170;
    else if (pickup.equals("Colombo") && dropoff.equals("Mirissa")) distance = 150;
    else if (pickup.equals("Colombo") && dropoff.equals("Pelmadulla")) distance = 110;
    else if (pickup.equals("Colombo") && dropoff.equals("Wellawaya")) distance = 210;
    else if (pickup.equals("Colombo") && dropoff.equals("Kekirawa")) distance = 180;
    else if (pickup.equals("Colombo") && dropoff.equals("Embilipitiya")) distance = 185;
    else if (pickup.equals("Colombo") && dropoff.equals("Hingurakgoda")) distance = 240;
    else if (pickup.equals("Colombo") && dropoff.equals("Palavi")) distance = 120;
    else if (pickup.equals("Colombo") && dropoff.equals("Medawachchiya")) distance = 225;
    else if (pickup.equals("Colombo") && dropoff.equals("Tissamaharama")) distance = 260;
    else if (pickup.equals("Colombo") && dropoff.equals("Galgamuwa")) distance = 180;
    else if (pickup.equals("Colombo") && dropoff.equals("Kalawana")) distance = 125;
    else if (pickup.equals("Colombo") && dropoff.equals("Mawanella")) distance = 105;
    else distance = 15; // Default for other routes


    double totalFare = baseFare + (distance * pricePerKm);
%>

<html>
<head>
    <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>Mega City Cab</title>
  <meta name="description" content="">
  <meta name="keywords" content="">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Fonts -->
  <link href="https://fonts.googleapis.com" rel="preconnect">
  <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Raleway:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Main CSS File -->
  <link href="assets/css/main.css" rel="stylesheet">
  
  <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@200;300;400;500;600;700&display=swap" rel="stylesheet">


</head>
<body>
<header id="header" class="header d-flex align-items-center fixed-top" style="background-color: #ed8200;">
    <div class="container-fluid container-xl position-relative d-flex align-items-center justify-content-between">

      <a href="index.jsp" class="logo d-flex align-items-center">
        <!-- Uncomment the line below if you also wish to use an image logo -->
        <!-- <img src="assets/img/logo.png" alt=""> -->
        <h1 class="sitename">Mega City Cab</h1>
      </a>

      <nav id="navmenu" class="navmenu">
        <ul>
	          <li><a href="index.jsp#hero" >Home</a></li>
	          <li><a href="index.jsp#about">About</a></li>
	          <li><a href="index.jsp#features">Features</a></li>
	          <li><a href="index.jsp#team">Team</a></li>
			  
		  	<% if (isLoggedIn) { %>			        
	        	<li><a href="bookings.jsp">Bookings</a></li>
	        <% } %>
			
          		<li><a href="#contact">Contact</a></li>
				
			<% if (isLoggedIn) { %>
	            <li><a href="LogoutServlet" class="btn-get-started">Logout</a></li>
	        <% } else { %>
	            <li><a href="login.jsp" class="active btn-get-started">Login</a></li>
	        <% } %>
        </ul>
        <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
      </nav>

    </div>
  </header>
  

<div style="width: 320px; margin: 95px  auto; margin-bottom: 20px; padding: 20px; font-family: monospace; font-size: 14px; border: 2px solid #000; background: #fff; text-align: center; box-shadow: 2px 2px 10px rgba(0,0,0,0.2);">
    <h2 style="margin: 0; padding: 5px; border-bottom: 2px dashed #000;">Mega City Cab</h2>

    <p style="margin: 5px 0;"><strong>Date & Time:</strong> <%= currentDateTime %></p>
    <p style="margin: 5px 0;"><strong>Ref No:</strong> <%= referenceNumber %></p>

    <hr style="border: 1px dashed #000; margin: 10px 0;">

    <table style="width: 100%; text-align: left; font-size: 14px;">
        <tr>
            <td><strong>Pickup:</strong></td>
            <td style="text-align: right;"><%= pickup %></td>
        </tr>
        <tr>
            <td><strong>Drop-off:</strong></td>
            <td style="text-align: right;"><%= dropoff %></td>
        </tr>
        <tr>
            <td><strong>Fare:</strong></td>
            <td style="text-align: right;">Rs.<%= totalFare %></td>
        </tr>
    </table>

    <hr style="border: 1px dashed #000; margin: 10px 0;">

    <p style="font-weight: bold; margin: 5px 0;">TOTAL AMOUNT: Rs.<%= totalFare %></p>
    
    <hr style="border: 1px dashed #000; margin: 10px 0;">

    <!-- Placeholder for barcode -->
    <div style="width: 100%; height: 50px; background: repeating-linear-gradient(90deg, black, black 2px, white 2px, white 4px); margin-bottom: 10px;"></div>

    <p style="font-weight: bold;">*** THANK YOU! ***</p>

    <form action="BookingServlet" method="post">
        <input type="hidden" name="pickup" value="<%= pickup %>">
        <input type="hidden" name="dropoff" value="<%= dropoff %>">
        <input type="hidden" name="fare" value="<%= totalFare %>">
        <button type="submit" style="padding: 8px 16px; font-size: 14px; border-radius: 5px; background-color: black; color: white; border: none; cursor: pointer; margin-top: 10px;">Confirm Booking</button>
        
        <button type="button" onclick="window.location.href='booking.jsp'" style="padding: 8px 16px; font-size: 14px; border-radius: 5px; background-color: red; color: white; border: none; cursor: pointer; margin-top: 10px;">Cancel Booking</button>
    </form>
</div>

    


  
    
    
    
    <footer id="footer" class="footer dark-background" style="height: 130px;">

    

    <div class="container copyright text-center mt-4">
      <p style="color:white;">© <span>Copyright</span> <strong class="px-1 sitename">Mega City Cab</strong> <span>All Rights Reserved</span></p>
      <div class="credits">
        <!-- All the links in the footer should remain intact. -->
        <!-- You can delete the links only if you've purchased the pro version. -->
        <!-- Licensing information: https://bootstrapmade.com/license/ -->
        <!-- Purchase the pro version with working PHP/AJAX contact form: [buy-url] -->
        Designed by <a href="#">CRS</a>
      </div>
    </div>

  </footer>
</body>
</html>
