<!DOCTYPE html>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>

<head>
<!-- Basic -->
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!-- Mobile Metas -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<!-- Site Metas -->
<link rel="icon" href="images/fevicon/fevicon.png" type="image/gif" />
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta name="author" content="" />

<title>HandTime</title>

<!-- bootstrap core css -->
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />

<!-- fonts style -->
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700;900&display=swap"
	rel="stylesheet">

<!-- font awesome style -->
<link href="css/font-awesome.min.css" rel="stylesheet" />

<!-- Custom styles for this template -->
<link href="css/style.css" rel="stylesheet" />

<!-- responsive style -->
<link href="css/responsive.css" rel="stylesheet" />
<style>
body {
	margin-top: 20px;
	background: #eee;
}

/*panel*/
.panel {
	border: none;
	box-shadow: none;
}

.panel-heading {
	border-color: #eff2f7;
	font-size: 16px;
	font-weight: 300;
}

.panel-title {
	color: #2A3542;
	font-size: 14px;
	font-weight: 400;
	margin-bottom: 0;
	margin-top: 0;
	font-family: 'Open Sans', sans-serif;
}

/*product list*/
.prod-cat li a {
	border-bottom: 1px dashed #d9d9d9;
}

.prod-cat li a {
	color: #3b3b3b;
}

.prod-cat li ul {
	margin-left: 30px;
}

.prod-cat li ul li a {
	border-bottom: none;
}

.prod-cat li ul li a:hover, .prod-cat li ul li a:focus, .prod-cat li ul li.active a,
	.prod-cat li a:hover, .prod-cat li a:focus, .prod-cat li a.active {
	background: none;
	color: #ff7261;
}

.pro-lab {
	margin-right: 20px;
	font-weight: normal;
}

.pro-sort {
	padding-right: 20px;
	float: left;
}

.pro-page-list {
	margin: 5px 0 0 0;
}

.product-list img {
	width: 100%;
	border-radius: 4px 4px 0 0;
	-webkit-border-radius: 4px 4px 0 0;
}

.product-list .pro-img-box {
	position: relative;
}

.adtocart {
	background: #fc5959;
	width: 50px;
	height: 50px;
	border-radius: 50%;
	-webkit-border-radius: 50%;
	color: #fff;
	display: inline-block;
	text-align: center;
	border: 3px solid #fff;
	left: 45%;
	bottom: -25px;
	position: absolute;
}

.adtocart i {
	color: #fff;
	font-size: 25px;
	line-height: 42px;
}

.pro-title {
	color: #5A5A5A;
	display: inline-block;
	margin-top: 20px;
	font-size: 16px;
}

.product-list .price {
	color: #fc5959;
	font-size: 15px;
}

.pro-img-details {
	margin-left: -15px;
}

.pro-img-details img {
	width: 100%;
}

.pro-d-title {
	font-size: 16px;
	margin-top: 0;
}

.product_meta {
	border-top: 1px solid #eee;
	border-bottom: 1px solid #eee;
	padding: 10px 0;
	margin: 15px 0;
}

.product_meta span {
	display: block;
	margin-bottom: 10px;
}

.product_meta a, .pro-price {
	color: #fc5959;
}

.pro-price, .amount-old {
	font-size: 18px;
	padding: 0 10px;
}

.amount-old {
	text-decoration: line-through;
}

.quantity {
	width: 120px;
}

.pro-img-list {
	margin: 10px 0 0 -15px;
	width: 100%;
	display: inline-block;
}

.pro-img-list a {
	float: left;
	margin-right: 10px;
	margin-bottom: 10px;
}

.pro-d-head {
	font-size: 18px;
	font-weight: 300;
}

.container.bootdey {
    margin-top: 20px;
}

.panel {
    border: 1px solid #ddd;
    border-radius: 5px;
    margin-bottom: 20px;
}

.panel-body {
    display: flex;
    align-items: center;
}

.pro-img-details {
    margin-bottom: 20px;
}

.pro-img-details img {
    max-width: 100%;
    height: auto;
    border-radius: 5px;
}

.pro-d-title {
    margin-top: 0;
}

.pro-price {
    font-weight: bold;
    color: #e44d26; /* or any color you prefer */
}

.form-group {
    margin-top: 20px;
}

h2 {
    margin-bottom: 10px;
}

form {
    margin-bottom: 20px;
}

label {
    display: block;
    margin-bottom: 5px;
    font-weight: bold;
}

input[type="date"] {
    width: 100%;
    padding: 8px;
    box-sizing: border-box;
    margin-bottom: 10px;
}

input[type="submit"] {
    background-color: #e44d26;
    color: white;
    border: none;
    padding: 10px 20px;
    border-radius: 5px;
    cursor: pointer;
}

input#selectedDate1 {
    width: 100%;
    padding: 8px;
    box-sizing: border-box;
    margin-bottom: 10px;
}

h3 {
    margin-top: 20px;
}

a {
    text-decoration: none;
    color: #333;
}

a:hover {
    color: #e44d26;
}
div[style="flex-direction: row"] {
    display: flex;
    flex-wrap: wrap; /* Allow wrapping to the next line if needed */
}

/* Style each individual <a> tag */
div[style="flex-direction: row"] a {
    text-decoration: none; /* Remove default underline */
    color: #333; /* Set text color */
    margin: 5px; /* Add some margin between each link */
    padding: 10px; /* Add padding for better spacing */
    border: 1px solid #ddd; /* Add a border */
    border-radius: 5px; /* Add border radius for rounded corners */
    display: flex;
    align-items: center;
    justify-content: center;
}

/* Style the <div> inside each <a> */
div[style="flex-direction: row"] a div {
    /* Add any specific styling for the inner <div> here */
}
</style>

</head>

<body class="sub_page">

	<div class="hero_area">
		<!-- header section strats -->
		<header class="header_section">
			<div class="container-fluid">
				<nav class="navbar navbar-expand-lg custom_nav-container ">
					<a class="navbar-brand" href="index.html"> <span>
							HandTime </span>
					</a>

					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class=""> </span>
					</button>

					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav  ">
							<li class="nav-item "><a class="nav-link" href="index.html">Home
									<span class="sr-only">(current)</span>
							</a></li>
							<li class="nav-item"><a class="nav-link" href="about.html">
									About</a></li>
							<li class="nav-item active"><a class="nav-link"
								href="product.html">Products</a></li>
							<li class="nav-item"><a class="nav-link"
								href="testimonial.html">Testimonial</a></li>
							<li class="nav-item"><a class="nav-link" href="contact.html">Contact
									Us</a></li>
						</ul>
						<div class="user_optio_box">
							<a href=""> <i class="fa fa-user" aria-hidden="true"></i>
							</a> <a href=""> <i class="fa fa-shopping-cart"
								aria-hidden="true"></i>
							</a>
						</div>
					</div>
				</nav>
			</div>
		</header>
		<!-- end header section -->
	</div>

	<div class="container bootdey">
		<div class="col-md-12">
			<section class="panel">
				<div class="panel-body">
					<div class="col-md-6">
						<div class="pro-img-details">
							<img src="${pitch.getImg() }" alt="">
						</div>

					</div>
					<div class="col-md-6">
						<h4 class="pro-d-title">
							<a href="#" class=""> ${pitch.getPitchType().getName() } </a>
						</h4>
						
						<div class="m-bot15">
							<strong>Price : </strong> <span class="pro-price">
								${pitch.getPrice()}</span>
						</div>
						<div class="form-group">
							
							<h2>Available Booking Slots</h2>
														   <fmt:formatDate value="${date}" pattern="yyyy-MM-dd" var="formattedDate" />
							
							<form
								action="ViewPitch?action=updateDate&pid=${pitch.getPitchID()}"
								method="Post">
								<label for="selectedDate">Select Date:</label> 
								
								<input
									type="date" id="selectedDate" name="selectedDate" value="${formattedDate}" required>
								<input type="submit" value="Show Available Slots">
							</form>

							


							<h3>Available Slots:</h3>
							<div style="flex-direction: row">
							
						<c:if test="${sessionScope.acc != null}">
							<c:forEach var="slot" items="${availableSlots}">

								<a href="Order?pid=${pitch.getPitchID()}&time=${slot}&date=${formattedDate}" style="flex-direction: row"><div>${slot}</div></a>
							</c:forEach>
						</c:if>
						<c:if test="${sessionScope.acc == null}">
							<c:forEach var="slot" items="${availableSlots}">
								<a href="LoginUser" style="flex-direction: row" ><div>${slot}</div></a>
							</c:forEach>
						</c:if>	
							
							
							</div>
						</div>
						
					</div>
				</div>
			</section>
		</div>
	</div>




	<!-- footer section -->
	<section class="footer_section">
		<div class="container">
			<p>
				&copy; <span id="displayYear"></span> All Rights Reserved By <a
					href="https://html.design/">Free Html Templates</a>
			</p>
		</div>
	</section>
	<!-- footer section -->

	<!-- jQery -->
	<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
	<!-- popper js -->
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous">
		
	</script>
	<!-- bootstrap js -->
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<!-- custom js -->
	<script type="text/javascript" src="js/custom.js"></script>
	<!-- Google Map -->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCh39n5U-4IoWpsVGUHWdqB6puEkhRLdmI&callback=myMap">
		
	</script>
	<!-- End Google Map -->
	<script type="text/javascript">
		// Get the current date
		var currentDate = new Date();

		// Add 7 days to the current date
		currentDate.setDate(currentDate.getDate() + 0);

		// Format the date as YYYY-MM-DD (required by the date input)
		var formattedDate = currentDate.toISOString().split('T')[0];

		// Set the min attribute for the date input
		document.getElementById('selectedDate').min = formattedDate;
	</script>


</body>

</html>