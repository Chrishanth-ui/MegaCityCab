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

<!DOCTYPE html>
<html lang="en">

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

  <!-- =======================================================
  * Template Name: Bootslander
  * Template URL: https://bootstrapmade.com/bootslander-free-bootstrap-landing-page-template/
  * Updated: Aug 07 2024 with Bootstrap v5.3.3
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body class="index-page">

  <header id="header" class="header d-flex align-items-center fixed-top">
    <div class="container-fluid container-xl position-relative d-flex align-items-center justify-content-between">

      <a href="index.jsp" class="logo d-flex align-items-center">
        <!-- Uncomment the line below if you also wish to use an image logo -->
        <!-- <img src="assets/img/logo.png" alt=""> -->
        <h1 class="sitename">Mega City Cab</h1>
      </a>

      <nav id="navmenu" class="navmenu">
        <ul>
	          <li><a href="#hero" class="active">Home</a></li>
	          <li><a href="#about">About</a></li>
	          <li><a href="#features">Features</a></li>
	          <li><a href="#team">Team</a></li>
			  
		  	<% if (isLoggedIn) { %>			        
	        	<li><a href="booking.jsp">Bookings</a></li>
	        <% } %>
			
          		<li><a href="#contact">Contact</a></li>
				
			<% if (isLoggedIn) { %>
	            <li><a href="LogoutServlet" class="btn-get-started">Logout</a></li>
	        <% } else { %>
	            <li><a href="login.jsp" class="btn-get-started">Login</a></li>
	        <% } %>
        </ul>
        <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
      </nav>

    </div>
  </header>

  <main class="main">

    <!-- Hero Section -->
    <section id="hero" class="hero section dark-background">
      <img src="assets/img/hero-bg-2.jpg" alt="" class="hero-bg">

      <div class="container">
        <div class="row gy-4 justify-content-between">
          <div class="col-lg-4 order-lg-last hero-img" data-aos="zoom-out" data-aos-delay="100">
            <img src="assets/img/hero-img.png" class="img-fluid animated" alt="">
          </div>

          <div class="col-lg-6  d-flex flex-column justify-content-center" data-aos="fade-in">
            <h1>Book Your Ride with <span>MegaCityCab</span></h1>
            <p>We are a team of skilled professionals efficient cab booking platforms</p>
            <div class="d-flex">
            <% if (isLoggedIn) { %>		
              <a href="booking.jsp" class="btn-get-started" style="margin-right:15px;">Book Now</a>
              <a href="#contact" class="btn-get-started">Contact</a>
            <% } else { %>
            	<a href="login.jsp" class="btn-get-started" style="margin-right:15px;">Login</a>
              	<a href="register.jsp" class="btn-get-started">Signup</a>
            <% } %>
            </div>
          </div>

        </div>
      </div>

      <svg class="hero-waves" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 24 150 28 " preserveAspectRatio="none">
        <defs>
          <path id="wave-path" d="M-160 44c30 0 58-18 88-18s 58 18 88 18 58-18 88-18 58 18 88 18 v44h-352z"></path>
        </defs>
        <g class="wave1">
          <use xlink:href="#wave-path" x="50" y="3"></use>
        </g>
        <g class="wave2">
          <use xlink:href="#wave-path" x="50" y="0"></use>
        </g>
        <g class="wave3">
          <use xlink:href="#wave-path" x="50" y="9"></use>
        </g>
      </svg>

    </section><!-- /Hero Section -->

    <!-- About Section -->
    <section id="about" class="about section">

      <div class="container" data-aos="fade-up" data-aos-delay="100">
        <div class="row align-items-xl-center gy-5">

          <div class="col-xl-5 content">
            <h3>About Us</h3>
            <h2>Reliable and Hassle-Free Cab Booking</h2>
            <p>We provide a seamless and efficient cab booking experience, ensuring safe and comfortable rides for our customers. Whether you need a quick trip across town or a long-distance journey, our professional drivers and well-maintained vehicles are here to serve you. Book your ride with ease and travel stress-free!</p>
            <a href="#contact" class="read-more"><span>Contact Us</span><i class="bi bi-arrow-right"></i></a>
          </div>

          <div class="col-xl-7">
            <div class="row gy-4 icon-boxes">

              <div class="col-md-6" data-aos="fade-up" data-aos-delay="200">
                <div class="icon-box">
					<i class="bi bi-car-front-fill"></i>
					<h3>Convenient Rides</h3>
					<p>Enjoy quick, reliable, and affordable cab services at your fingertips. Whether it's a daily commute or a special trip, we ensure a comfortable and hassle-free ride.</p>
                </div>
              </div> <!-- End Icon Box -->

              <div class="col-md-6" data-aos="fade-up" data-aos-delay="300">
                <div class="icon-box">
					<i class="bi bi-clipboard-check"></i>
					<h3>Hassle-Free Cab Booking</h3>
					<p>Experience a smooth and effortless cab booking process. Our platform is designed for quick reservations, ensuring you get a ride whenever you need it.</p>
                </div>
              </div> <!-- End Icon Box -->

              <div class="col-md-6" data-aos="fade-up" data-aos-delay="400">
                <div class="icon-box">
					<i class="bi bi-command"></i>
					<h3>Reliable Ride Management</h3>
					<p>Effortlessly manage your bookings and enjoy a seamless ride experience. We provide reliable services with the highest standards of safety and comfort.</p>
                </div>
              </div> <!-- End Icon Box -->

              <div class="col-md-6" data-aos="fade-up" data-aos-delay="500">
				<div class="icon-box">
				    <i class="bi bi-graph-up-arrow"></i>
				    <h3>Track Your Ride Progress</h3>
				    <p>Stay updated on your ride status in real-time. Our tracking feature helps you monitor the route and estimated time of arrival for a smooth journey.</p>
				</div>
              </div> <!-- End Icon Box -->

            </div>
          </div>

        </div>
      </div>

    </section><!-- /About Section -->

	<!-- Features Section -->
	<section id="features" class="features section">

	  <div class="container">

	    <div class="row gy-4">

	      <!-- Feature 1: Book a Ride -->
	      <div class="col-lg-3 col-md-4" data-aos="fade-up" data-aos-delay="100">
	        <div class="features-item">
	          <i class="bi bi-car-front" style="color: #ffbb2c;"></i>
	          <h3><a href="" class="stretched-link">Book a Ride</a></h3>
	          
	        </div>
	      </div><!-- End Feature Item -->

	      <!-- Feature 2: Real-Time Tracking -->
	      <div class="col-lg-3 col-md-4" data-aos="fade-up" data-aos-delay="200">
	        <div class="features-item">
	          <i class="bi bi-map" style="color: #5578ff;"></i>
	          <h3><a href="" class="stretched-link">Real-Time Tracking</a></h3>
	          
	        </div>
	      </div><!-- End Feature Item -->

	      <!-- Feature 3: Multiple Payment Options -->
	      <div class="col-lg-3 col-md-4" data-aos="fade-up" data-aos-delay="300">
	        <div class="features-item">
	          <i class="bi bi-credit-card" style="color: #e80368;"></i>
	          <h3><a href="" class="stretched-link">Multiple Payments</a></h3>
	          
	        </div>
	      </div><!-- End Feature Item -->

	      <!-- Feature 4: Ride History -->
	      <div class="col-lg-3 col-md-4" data-aos="fade-up" data-aos-delay="400">
	        <div class="features-item">
	          <i class="bi bi-clock" style="color: #e361ff;"></i>
	          <h3><a href="" class="stretched-link">Ride History</a></h3>
	          
	        </div>
	      </div><!-- End Feature Item -->

	      <!-- Feature 5: Instant Fare Estimate -->
	      <div class="col-lg-3 col-md-4" data-aos="fade-up" data-aos-delay="500">
	        <div class="features-item">
	          <i class="bi bi-cash" style="color: #47aeff;"></i>
	          <h3><a href="" class="stretched-link">Instant Fare Estimate</a></h3>
	          
	        </div>
	      </div><!-- End Feature Item -->

	      <!-- Feature 6: Customer Support -->
	      <div class="col-lg-3 col-md-4" data-aos="fade-up" data-aos-delay="600">
	        <div class="features-item">
	          <i class="bi bi-headset" style="color: #ffa76e;"></i>
	          <h3><a href="" class="stretched-link">Customer Support</a></h3>
	          
	        </div>
	      </div><!-- End Feature Item -->

	      <!-- Feature 7: Driver Ratings -->
	      <div class="col-lg-3 col-md-4" data-aos="fade-up" data-aos-delay="700">
	        <div class="features-item">
	          <i class="bi bi-star" style="color: #11dbcf;"></i>
	          <h3><a href="" class="stretched-link">Driver Ratings</a></h3>
	          
	        </div>
	      </div><!-- End Feature Item -->

	      <!-- Feature 8: Multiple Ride Options -->
	      <div class="col-lg-3 col-md-4" data-aos="fade-up" data-aos-delay="800">
	        <div class="features-item">
	          <i class="bi bi-car-side" style="color: #4233ff;"></i>
	          <h3><a href="" class="stretched-link">Multiple Ride Options</a></h3>
	          
	        </div>
	      </div><!-- End Feature Item -->

	      <!-- Feature 9: Ride Scheduling -->
	      <div class="col-lg-3 col-md-4" data-aos="fade-up" data-aos-delay="900">
	        <div class="features-item">
	          <i class="bi bi-calendar" style="color: #b2904f;"></i>
	          <h3><a href="" class="stretched-link">Ride Scheduling</a></h3>

	        </div>
	      </div><!-- End Feature Item -->

	      <!-- Feature 10: Safety Features -->
	      <div class="col-lg-3 col-md-4" data-aos="fade-up" data-aos-delay="1000">
	        <div class="features-item">
	          <i class="bi bi-shield-lock" style="color: #b20969;"></i>
	          <h3><a href="" class="stretched-link">Safety Features</a></h3>
	          
	        </div>
	      </div><!-- End Feature Item -->

	      <!-- Feature 11: Discounts & Offers -->
	      <div class="col-lg-3 col-md-4" data-aos="fade-up" data-aos-delay="1100">
	        <div class="features-item">
	          <i class="bi bi-percent" style="color: #ff5828;"></i>
	          <h3><a href="" class="stretched-link">Discounts & Offers</a></h3>	          
	        </div>
	      </div><!-- End Feature Item -->

	      <!-- Feature 12: Share Ride -->
	      <div class="col-lg-3 col-md-4" data-aos="fade-up" data-aos-delay="1200">
	        <div class="features-item">
	          <i class="bi bi-person-lines-fill" style="color: #29cc61;"></i>
	          <h3><a href="" class="stretched-link">Share Ride</a></h3>         
	        </div>
	      </div><!-- End Feature Item -->

	    </div>

	  </div>

	</section><!-- /Features Section -->


    <!-- Stats Section -->
    <section id="stats" class="stats section light-background">

      <div class="container" data-aos="fade-up" data-aos-delay="100">

        <div class="row gy-4">

          <div class="col-lg-3 col-md-6 d-flex flex-column align-items-center">
            <i class="bi bi-emoji-smile"></i>
            <div class="stats-item">
              <span data-purecounter-start="0" data-purecounter-end="232" data-purecounter-duration="1" class="purecounter"></span>
              <p>Happy Clients</p>
            </div>
          </div><!-- End Stats Item -->

          <div class="col-lg-3 col-md-6 d-flex flex-column align-items-center">
            <i class="bi bi-journal-richtext"></i>
            <div class="stats-item">
              <span data-purecounter-start="0" data-purecounter-end="521" data-purecounter-duration="1" class="purecounter"></span>
              <p>Rides</p>
            </div>
          </div><!-- End Stats Item -->

          <div class="col-lg-3 col-md-6 d-flex flex-column align-items-center">
            <i class="bi bi-headset"></i>
            <div class="stats-item">
              <span data-purecounter-start="0" data-purecounter-end="1463" data-purecounter-duration="1" class="purecounter"></span>
              <p>Hours Of Support</p>
            </div>
          </div><!-- End Stats Item -->

          <div class="col-lg-3 col-md-6 d-flex flex-column align-items-center">
            <i class="bi bi-people"></i>
            <div class="stats-item">
              <span data-purecounter-start="0" data-purecounter-end="15" data-purecounter-duration="1" class="purecounter"></span>
              <p>Hard Workers</p>
            </div>
          </div><!-- End Stats Item -->

        </div>

      </div>

    </section><!-- /Stats Section -->

	
	
    <!-- Details Section -->
    <section id="details" class="details section">

		<!-- Section Title -->
		<div class="container section-title" data-aos="fade-up">
		  <h2>Cab Booking Details</h2>
		  <div><span>Explore Our</span> <span class="description-title">Booking Features</span></div>
		</div><!-- End Section Title -->
		
		
      <div class="container">

        <div class="row gy-4 align-items-center features-item">
          <div class="col-md-5 d-flex align-items-center" data-aos="zoom-out" data-aos-delay="100">
            <img src="assets/img/details-1.png" class="img-fluid" alt="">
          </div>
          <div class="col-md-7" data-aos="fade-up" data-aos-delay="100">
			<h3>Quick and Easy Cab Booking</h3>
		     <p class="fst-italic">
		       Booking a cab has never been easier. Simply choose your pickup location, select your destination, and confirm your booking in just a few clicks.
		     </p>
		     <ul>
		       <li><i class="bi bi-check"></i><span> Choose from multiple payment options, including cash and card.</span></li>
		       <li><i class="bi bi-check"></i> <span>Track your cab in real-time with live updates.</span></li>
		       <li><i class="bi bi-check"></i> <span>Enjoy 24/7 customer support for any booking-related issues.</span></li>
		     </ul>
          </div>
        </div><!-- Features Item -->

        <div class="row gy-4 align-items-center features-item">
          <div class="col-md-5 order-1 order-md-2 d-flex align-items-center" data-aos="zoom-out" data-aos-delay="200">
            <img src="assets/img/details-2.png" class="img-fluid" alt="">
          </div>
          <div class="col-md-7 order-2 order-md-1" data-aos="fade-up" data-aos-delay="200">
            <h3>Comfortable Rides with a Variety of Options</h3>
			<p class="fst-italic">
			  Whether you're traveling solo or with a group, we offer a wide range of vehicles to meet your needs.
			</p>
			<p>
			  Choose from economy, luxury, or XL cabs. Our fleet is well-maintained, ensuring a safe and comfortable journey. Whether you're traveling for business or leisure, we have the right vehicle for you.
			</p>
          </div>
        </div><!-- Features Item -->

        

      </div>

    </section><!-- /Details Section -->

  
    <!-- Testimonials Section -->
    <section id="testimonials" class="testimonials section dark-background">

      <img src="assets/img/testimonials-bg.jpg" class="testimonials-bg" alt="">

      <div class="container" data-aos="fade-up" data-aos-delay="100">

        <div class="swiper init-swiper">
          <script type="application/json" class="swiper-config">
            {
              "loop": true,
              "speed": 600,
              "autoplay": {
                "delay": 5000
              },
              "slidesPerView": "auto",
              "pagination": {
                "el": ".swiper-pagination",
                "type": "bullets",
                "clickable": true
              }
            }
          </script>
          <div class="swiper-wrapper">

            <div class="swiper-slide">
              <div class="testimonial-item">
                <img src="assets/img/testimonials/testimonials-1.jpg" class="testimonial-img" alt="">
                <h3>Saul Goodman</h3>
                <h4>Ceo &amp; Founder</h4>
                <div class="stars">
                  <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                </div>
                <p>
                  <i class="bi bi-quote quote-icon-left"></i>
                  <span>Proin iaculis purus consequat sem cure digni ssim donec porttitora entum suscipit rhoncus. Accusantium quam, ultricies eget id, aliquam eget nibh et. Maecen aliquam, risus at semper.</span>
                  <i class="bi bi-quote quote-icon-right"></i>
                </p>
              </div>
            </div><!-- End testimonial item -->

            <div class="swiper-slide">
              <div class="testimonial-item">
                <img src="assets/img/testimonials/testimonials-2.jpg" class="testimonial-img" alt="">
                <h3>Sara Wilsson</h3>
                <h4>Designer</h4>
                <div class="stars">
                  <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                </div>
                <p>
                  <i class="bi bi-quote quote-icon-left"></i>
                  <span>Export tempor illum tamen malis malis eram quae irure esse labore quem cillum quid cillum eram malis quorum velit fore eram velit sunt aliqua noster fugiat irure amet legam anim culpa.</span>
                  <i class="bi bi-quote quote-icon-right"></i>
                </p>
              </div>
            </div><!-- End testimonial item -->

            <div class="swiper-slide">
              <div class="testimonial-item">
                <img src="assets/img/testimonials/testimonials-3.jpg" class="testimonial-img" alt="">
                <h3>Jena Karlis</h3>
                <h4>Store Owner</h4>
                <div class="stars">
                  <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                </div>
                <p>
                  <i class="bi bi-quote quote-icon-left"></i>
                  <span>Enim nisi quem export duis labore cillum quae magna enim sint quorum nulla quem veniam duis minim tempor labore quem eram duis noster aute amet eram fore quis sint minim.</span>
                  <i class="bi bi-quote quote-icon-right"></i>
                </p>
              </div>
            </div><!-- End testimonial item -->

            <div class="swiper-slide">
              <div class="testimonial-item">
                <img src="assets/img/testimonials/testimonials-4.jpg" class="testimonial-img" alt="">
                <h3>Matt Brandon</h3>
                <h4>Freelancer</h4>
                <div class="stars">
                  <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                </div>
                <p>
                  <i class="bi bi-quote quote-icon-left"></i>
                  <span>Fugiat enim eram quae cillum dolore dolor amet nulla culpa multos export minim fugiat minim velit minim dolor enim duis veniam ipsum anim magna sunt elit fore quem dolore labore illum veniam.</span>
                  <i class="bi bi-quote quote-icon-right"></i>
                </p>
              </div>
            </div><!-- End testimonial item -->

            <div class="swiper-slide">
              <div class="testimonial-item">
                <img src="assets/img/testimonials/testimonials-5.jpg" class="testimonial-img" alt="">
                <h3>John Larson</h3>
                <h4>Entrepreneur</h4>
                <div class="stars">
                  <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                </div>
                <p>
                  <i class="bi bi-quote quote-icon-left"></i>
                  <span>Quis quorum aliqua sint quem legam fore sunt eram irure aliqua veniam tempor noster veniam enim culpa labore duis sunt culpa nulla illum cillum fugiat legam esse veniam culpa fore nisi cillum quid.</span>
                  <i class="bi bi-quote quote-icon-right"></i>
                </p>
              </div>
            </div><!-- End testimonial item -->

          </div>
          <div class="swiper-pagination"></div>
        </div>

      </div>

    </section><!-- /Testimonials Section -->

	
    <!-- Team Section -->
    <section id="team" class="team section">

      <!-- Section Title -->
      <div class="container section-title" data-aos="fade-up">
        <h2>Team</h2>
        <div><span>Check Our</span> <span class="description-title">Team</span></div>
      </div><!-- End Section Title -->

      <div class="container">

        <div class="row gy-5">

          <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="100">
            <div class="member">
              <div class="pic"><img src="assets/img/team/team-1.jpg" class="img-fluid" alt=""></div>
              <div class="member-info">
                <h4>Walter White</h4>
                <span>Chief Executive Officer</span>
                <div class="social">
                  <a href=""><i class="bi bi-twitter-x"></i></a>
                  <a href=""><i class="bi bi-facebook"></i></a>
                  <a href=""><i class="bi bi-instagram"></i></a>
                  <a href=""><i class="bi bi-linkedin"></i></a>
                </div>
              </div>
            </div>
          </div><!-- End Team Member -->

          <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="200">
            <div class="member">
              <div class="pic"><img src="assets/img/team/team-2.jpg" class="img-fluid" alt=""></div>
              <div class="member-info">
                <h4>Sarah Jhonson</h4>
                <span>Product Manager</span>
                <div class="social">
                  <a href=""><i class="bi bi-twitter-x"></i></a>
                  <a href=""><i class="bi bi-facebook"></i></a>
                  <a href=""><i class="bi bi-instagram"></i></a>
                  <a href=""><i class="bi bi-linkedin"></i></a>
                </div>
              </div>
            </div>
          </div><!-- End Team Member -->

          <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="300">
            <div class="member">
              <div class="pic"><img src="assets/img/team/team-3.jpg" class="img-fluid" alt=""></div>
              <div class="member-info">
                <h4>William Anderson</h4>
                <span>CTO</span>
                <div class="social">
                  <a href=""><i class="bi bi-twitter-x"></i></a>
                  <a href=""><i class="bi bi-facebook"></i></a>
                  <a href=""><i class="bi bi-instagram"></i></a>
                  <a href=""><i class="bi bi-linkedin"></i></a>
                </div>
              </div>
            </div>
          </div><!-- End Team Member -->

        </div>

      </div>

    </section><!-- /Team Section -->


   <!-- FAQ Section -->
	<section id="faq" class="faq section light-background">
	
	  <div class="container-fluid">
	
	    <div class="row gy-4">
	
	      <div class="col-lg-7 d-flex flex-column justify-content-center order-2 order-lg-1">
	
	        <div class="content px-xl-5" data-aos="fade-up" data-aos-delay="100">
	          <h3><span>Frequently Asked </span><strong>Questions</strong></h3>
	          <p>
	            Have questions about our cab booking service? Find the answers below!
	          </p>
	        </div>
	
	        <div class="faq-container px-xl-5" data-aos="fade-up" data-aos-delay="200">
	
	          <div class="faq-item faq-active">
	            <i class="faq-icon bi bi-question-circle"></i>
	            <h3>How do I book a cab?</h3>
	            <div class="faq-content">
	              <p>Booking a cab is easy! Simply enter your pickup and drop-off locations, select your preferred ride, and confirm your booking.</p>
	            </div>
	            <i class="faq-toggle bi bi-chevron-right"></i>
	          </div><!-- End Faq item-->
	
	          <div class="faq-item">
	            <i class="faq-icon bi bi-question-circle"></i>
	            <h3>Can I schedule a ride in advance?</h3>
	            <div class="faq-content">
	              <p>Yes! You can schedule your ride in advance by selecting the "Schedule Ride" option and choosing your preferred date and time.</p>
	            </div>
	            <i class="faq-toggle bi bi-chevron-right"></i>
	          </div><!-- End Faq item-->
	
	          <div class="faq-item">
	            <i class="faq-icon bi bi-question-circle"></i>
	            <h3>What payment methods do you accept?</h3>
	            <div class="faq-content">
	              <p>We accept multiple payment options including credit/debit cards, online wallets, and cash payments upon arrival.</p>
	            </div>
	            <i class="faq-toggle bi bi-chevron-right"></i>
	          </div><!-- End Faq item-->
	
	          <div class="faq-item">
	            <i class="faq-icon bi bi-question-circle"></i>
	            <h3>How can I cancel or modify my booking?</h3>
	            <div class="faq-content">
	              <p>You can cancel or modify your booking through the "My Rides" section in your account. Please note that cancellation charges may apply.</p>
	            </div>
	            <i class="faq-toggle bi bi-chevron-right"></i>
	          </div><!-- End Faq item-->
	
	        </div>
	
	      </div>
	
	      <div class="col-lg-5 order-1 order-lg-2">
	        <img src="assets/img/faq.jpg" class="img-fluid" alt="FAQ Image" data-aos="zoom-in" data-aos-delay="100">
	      </div>
	      
	    </div>
	
	  </div>
	
	</section><!-- /FAQ Section -->


    <!-- Contact Section -->
    <section id="contact" class="contact section">

      <!-- Section Title -->
      <div class="container section-title" data-aos="fade-up">
        <h2>Contact</h2>
        <div><span>Check Our</span> <span class="description-title">Contact</span></div>
       
      </div><!-- End Section Title -->

      <div class="container" data-aos="fade" data-aos-delay="100">

        <div class="row gy-4">

          <div class="col-lg-4">
            <div class="info-item d-flex" data-aos="fade-up" data-aos-delay="200">
              <i class="bi bi-geo-alt flex-shrink-0"></i>
              <div>
                <h3>Address</h3>
                <p>A108 Adam Street, Mega City, MC 535022</p>
              </div>
            </div><!-- End Info Item -->

            <div class="info-item d-flex" data-aos="fade-up" data-aos-delay="300">
              <i class="bi bi-telephone flex-shrink-0"></i>
              <div>
                <h3>Call Us</h3>
                <p>+94 74 055 5244</p>
              </div>
            </div><!-- End Info Item -->

            <div class="info-item d-flex" data-aos="fade-up" data-aos-delay="400">
              <i class="bi bi-envelope flex-shrink-0"></i>
              <div>
                <h3>Email Us</h3>
                <p>Megacitycab@example.com</p>
              </div>
            </div><!-- End Info Item -->

          </div>

          <div class="col-lg-8">
            <form action="ContactServlet" method="post" enctype="application/x-www-form-urlencoded">
            
            <div class="row">
            
             	<div class="col-md-6 ml-2 mb-2">
			    <input type="text" name="name" class="form-control" placeholder="Your Name" required>
			    </div>
			    
			     <div class="col-md-6 ml-2 mb-2">
			    <input type="email" name="email" class="form-control" placeholder="Your Email" required>
			    </div>
			    
			    <div class="col-md-12 mb-2">
			    <input type="text" name="subject" class="form-control" placeholder="Subject" required>
			    </div>
			    
			    <div class="col-md-12 mb-2">
			    <textarea name="message" class="form-control" rows="6" placeholder="Message" required></textarea>
			    </div>
			    
			    <div class="col-md-12 ml-2 mb-2 text-center">
			    <button type="submit" style="
										    color: var(--contrast-color);
										    background: var(--accent-color);
										    border: 0;
										    padding: 10px 30px;
										    transition: 0.4s;
										    border-radius: 50px;
										">Send Message</button>
			    </div>

			  </div>
			</form>

          </div><!-- End Contact Form -->
          
          


        </div>

      </div>

    </section><!-- /Contact Section -->

  </main>

  <footer id="footer" class="footer dark-background">

    <div class="container footer-top">
      <div class="row gy-4">
        <div class="col-lg-4 col-md-6 footer-about">
          <a href="index.html" class="logo d-flex align-items-center">
            <span class="sitename">Mega City Cab</span>
          </a>
          <div class="footer-contact pt-3" style="color:white;">
            <p>A108 Adam Street, Mega City, MC 535022</p>
            <p>New York, NY 535022</p>
            <p class="mt-3"><strong>Phone:</strong> <span>+94 74 055 5244</span></p>
            <p><strong>Email:</strong> <span>Megacitycab@example.com</span></p>
          </div>
          <div class="social-links d-flex mt-4">
            <a href=""><i class="bi bi-twitter-x"></i></a>
            <a href=""><i class="bi bi-facebook"></i></a>
            <a href=""><i class="bi bi-instagram"></i></a>
            <a href=""><i class="bi bi-linkedin"></i></a>
          </div>
        </div>

        <div class="col-lg-2 col-md-3 footer-links">
          <h4>Useful Links</h4>
          <ul>
            <li><a href="#">Home</a></li>
            <li><a href="#">About us</a></li>
            <li><a href="#">Services</a></li>
            <li><a href="#">Terms of service</a></li>
            <li><a href="#">Privacy policy</a></li>
          </ul>
        </div>

		<div class="col-lg-2 col-md-3 footer-links">
		  <h4>Our Services</h4>
		  <ul>
		    <li><a href="#">Instant Cab Booking</a></li>
		    <li><a href="#">Scheduled Rides</a></li>
		    <li><a href="#">Airport Transfers</a></li>
		    <li><a href="#">Corporate Travel</a></li>
		    <li><a href="#">Luxury & Budget Cabs</a></li>
		  </ul>
		</div>


        <div class="col-lg-4 col-md-12 footer-newsletter">
          <h4>Our Newsletter</h4>
          <p style="clolr:white;">Subscribe to our newsletter and receive the latest news about our products and services!</p>
          <form action="forms/newsletter.php" method="post" class="php-email-form">
            <div class="newsletter-form"><input type="email" name="email"><input type="submit" value="Subscribe"></div>
            <div class="loading">Loading</div>
            <div class="error-message"></div>
            <div class="sent-message" style="clolr:white;">Your subscription request has been sent. Thank you!</div>
          </form>
        </div>

      </div>
    </div>

    <div class="container copyright text-center mt-4">
      <p>© <span>Copyright</span> <strong class="px-1 sitename">Mega City Cab</strong> <span>All Rights Reserved</span></p>
      <div class="credits">
        <!-- All the links in the footer should remain intact. -->
        <!-- You can delete the links only if you've purchased the pro version. -->
        <!-- Licensing information: https://bootstrapmade.com/license/ -->
        <!-- Purchase the pro version with working PHP/AJAX contact form: [buy-url] -->
        Designed by <a href="#">CRS</a>
      </div>
    </div>

  </footer>

  <!-- Scroll Top -->
  <a href="#" id="scroll-top" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Preloader -->
  <div id="preloader"></div>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>
  <script src="assets/vendor/aos/aos.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>

  <!-- Main JS File -->
  <script src="assets/js/main.js"></script>

</body>

</html>
