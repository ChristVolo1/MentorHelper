
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!-- Main Menu Section -->
<section class="menu">
	<nav class="navbar navigation">
	    <div class="container">
	      <div class="navbar-header">
	      	<img class="img-responsive" src="static/images/shop/MentorHelperLogo_small.jpg" alt="logo image"/>
	      	<h2 class="menu-title">Main Menu</h2>
	      	
	        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
	          <span class="sr-only">Toggle navigation</span>
	          <span class="icon-bar"></span>
	          <span class="icon-bar"></span>
	          <span class="icon-bar"></span>
	        </button>

	      </div><!-- / .navbar-header -->

	      <!-- Navbar Links -->
	      <div id="navbar" class="navbar-collapse collapse text-center">
	        <ul class="nav navbar-nav">

	          <!-- Home -->
	          <li class="dropdown ">
	            <a href="index">Home</a>
	          </li><!-- / Home -->

			 <!-- <li class="dropdown dropdown-slide">
	            <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="350" role="button" 
	            aria-haspopup="true" aria-expanded="false">Shop <span class="tf-ion-ios-arrow-down"></span></a>
	            <ul class="dropdown-menu">
				<li class="dropdown-header">Store Shopping</li>
				<li role="separator" class="divider"></li>
				<li><a href="#">Shop</a></li>
				<c:if test="${not empty itemlist}">
				<li><a href="#"> Cart </a></li>	
				</c:if>
	            </ul>
	          </li> -->
	          

	          <!-- Pages -->
	          <li class="dropdown full-width dropdown-slide"> <!-- was  medium-width -->
	            <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="350" role="button"
	             aria-haspopup="true" aria-expanded="false">Company<span class="tf-ion-ios-arrow-down"></span></a>
	            <div class="dropdown-menu">
	              	<div class="row">

		                <!-- Introduction -->
		                <div class="col-sm-3 col-xs-12">
		                	<ul>
								<li class="dropdown-header">Info</li>
								<li role="separator" class="divider"></li>
								<li><a href="contact"> Contact </a></li>
								<li><a href="about">About Us</a></li>
								<!-- <li><a href="#">Services</a></li> -->								
		                	</ul>
		                </div>
						<!--  <c:if test="${not empty loggedInuser}">-->
		                <!-- User Interface -->
		                <!-- <div class="col-sm-3 col-xs-12">
		                	<ul>
								<li class="dropdown-header">Dashboard</li>
								<li role="separator" class="divider"></li>
								<li><a href="profile">Profile Details</a></li>
								<c:if test="${role eq 'ADMIN'}">
								<li><a href="#">Orders</a></li>
								</c:if>
								<li><a href="#">My Orders</a></li>
								
		                	</ul>
		                </div>
		                </c:if>
		                <c:if test="${empty loggedInuser}">
		                User Interface
		                <div class="col-sm-3 col-xs-12">
		                	<ul>
								<li class="dropdown-header">Dashboard</li>
								<li role="separator" class="divider"></li>
								<li><a href="#">FAQ</a></li>
								<li><a href="#">Address</a></li>
								
		                	</ul>
		                </div>
		                </c:if>  -->

		                <!-- Utility -->
		                <div class="col-sm-3 col-xs-12">
		                	<ul>
								<li class="dropdown-header">Members</li>
								<li role="separator" class="divider"></li>
							    <c:choose>
				                <c:when test="${empty loggedInuser}">
								<li><a href="login">Login </a></li>
								<li><a href="signup">Register </a></li>
								</c:when>
				  			    <c:otherwise>
								<li><a href="customers">All Users </a></li>	<!-- he put All Users outside the c: loops so they can only be accessed by logged in users -->							
								<a id="logout_link" href="logout"> ${loggedInuser} | Logout</a>
								</c:otherwise>
								</c:choose>
		                	</ul>
		                </div>

		                <!-- Mega Menu -->
		                <div class="col-sm-3 col-xs-12"> 
		                	<a href="shop">
			                	<img class="img-responsive" src="static/images/shop/younger-helping2.jpg" alt="menu image" />
		                	</a>
		                </div>
	              	</div><!-- / .row -->
	            </div><!-- / .dropdown-menu -->
	          </li><!-- / Pages -->
			
			  <c:if test="${not empty loggedInuser}">
	          <li><a href="profile">Profile</a></li>
	          </c:if>
	          <c:choose>
	          <c:when test="${empty loggedInuser}">
	          <li><a href="login">Login </a></li>
			  <li><a href="signup">Register </a></li>
	          </c:when>
	          <c:otherwise>
			  <li><a href="logout"> Logout</a></li>
			  </c:otherwise>
			  </c:choose>
							
			

	          <!-- Search -->
	          <!-- <li class="dropdown search dropdown-slide">
	            <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown"><i class="tf-ion-ios-search-strong"></i> </a>
	            <ul class="dropdown-menu search-dropdown">
	              <li><form action="post"><input type="search" class="form-control" placeholder="Search for Services in Your Area"></form></li>
	            </ul> -->
	          </li><!-- / Search-->
	          	
	         </ul><!-- / .nav .navbar-nav -->

	      	</div><!--/.navbar-collapse -->
	    </div><!-- / .container -->
	</nav>
</section>