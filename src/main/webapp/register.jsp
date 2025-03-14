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

<style type="text/css">
	div {
  display: flex;
  justify-content: center;
}

form {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: start;
  background: $main-color;
  margin: 20px 50px;
  padding: 30px;
  width: 320px;
  height: 380px;
  box-shadow: 0px 5px 15px 2px $main-color;
}

h1 {
  color: $accent-color;
  margin: 30px 0 50px 0;
}

@mixin default-view {
  padding: 0 15px;
  width: -webkit-fill-available;
  margin: 15px;
  height: 35px;
  border-radius: 20px;
  font-weight: bold;
}

input {
  @include default-view;
  background: $secondary-color;
  border: 2px solid $secondary-color;
  outline: none;
  color: $accent-color;
  transition: all 500ms ease-out;

  &:focus {
    border: 2px solid $accent-color;
  }
}

button {
  @include default-view;
  background: $accent-color;
  margin: 10px 15px 20px 15px;
  color: $secondary-color;
  transition: all 500ms ease-out;
  animation: lights 4000ms infinite ease-in;
  border: 0;

  &:hover {
    border: 1px solid $secondary-color;
    box-shadow: 0px 0px 10px 2px $secondary-color;
    animation: none;
  }
}

@keyframes lights {
  0% {
    box-shadow: 0px 0px 5px 2px $secondary-color;
  }
  50% {
    box-shadow: 0px 0px 5px 2px $accent-color;
  }
  70% {
    box-shadow: 0px 0px 5px 2px #64896a;
  }
  100% {
    box-shadow: 0px 0px 5px 2px $secondary-color;
  }
}

a {
  color: $secondary-color;
  text-decoration: none;
  font-size: 10px;
  font-weight: bolder;
  opacity: 0.6;
  transition: all 300ms ease-in-out;

  &:hover {
    opacity: 0.9;
  }
}
</style>
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
			
          		<li><a href="index.jsp#contact">Contact</a></li>
				
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
  
  
  <div style="margin-top: 130px;">
  <form action="RegisterServlet" method="post" style="background: #ed8200; border-radius: 20px; height: 500px;">

    <h1 style="color: black;">Register Now</h1>

    <input type="text" name="name" required placeholder="Enter Name" style="margin-bottom: 10px; border-radius: 15px;"/>

    <input type="text" name="mobileNumber" required placeholder="Enter Mobile Number" 
           pattern="\d{10}" title="Enter a valid 10-digit mobile number" 
           style="margin-bottom: 10px; border-radius: 15px;"/>

    <input type="text" name="username" required placeholder="Enter Username" style="margin-bottom: 10px; border-radius: 15px;"/>

    <input type="password" id="password" name="password" required 
           placeholder="Enter Password (6 characters)" maxlength="6" 
           pattern=".{6,6}" title="Password must be exactly 6 characters" 
           style="margin-bottom: 10px; border-radius: 15px;"/>

    <input type="password" id="confirmPassword" name="confirmPassword" required placeholder="Confirm Password" 
           style="margin-bottom: 10px; border-radius: 15px;"/>

    <p id="passwordMismatch" style="color: red; display: none;">Passwords do not match!</p>

    <button type="submit" id="registerButton" style="border-radius: 20px;">Register</button>

    <p>Already have an account? <a href="login.jsp" style="color:white;">Login here</a></p>
</form>
</div>
  
    
    
    
    <footer id="footer" class="footer dark-background" style="height: 130px;">

    

    <div class="container copyright text-center mt-4">
      <p style="color:white;">� <span>Copyright</span> <strong class="px-1 sitename">Mega City Cab</strong> <span>All Rights Reserved</span></p>
      <div class="credits">
        <!-- All the links in the footer should remain intact. -->
        <!-- You can delete the links only if you've purchased the pro version. -->
        <!-- Licensing information: https://bootstrapmade.com/license/ -->
        <!-- Purchase the pro version with working PHP/AJAX contact form: [buy-url] -->
        Designed by <a href="#">CRS</a>
      </div>
    </div>

  </footer>
  <script>
    document.getElementById('confirmPassword').addEventListener('input', function () {
        let password = document.getElementById('password').value;
        let confirmPassword = this.value;
        let warning = document.getElementById('passwordMismatch');
        let button = document.getElementById('registerButton');

        if (password !== confirmPassword) {
            warning.style.display = 'block';
            button.disabled = true;
        } else {
            warning.style.display = 'none';
            button.disabled = false;
        }
    });
</script>
</body>
</html>
