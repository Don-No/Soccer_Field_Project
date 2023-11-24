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


    <!-- Bootstrap -->
    <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>
   


<!-- Custom styles for this template -->
<link href="css/style.css" rel="stylesheet" />

<!-- responsive style -->
<link href="css/responsive.css" rel="stylesheet" />
<style>

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

	<section class="orders" style="margin: 80px 0">
    <div class="container">
        <h1 class="heading">placed orders</h1>
        <h4 style="color: green"> ${success}</h4>
        <h4 style="color: red">  ${warning}</h4>

        <c:forEach items="${orders}" var="ord">
            <div class="panel-group" id="accordion">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapse${ord.id}">Order Id: AE${ord.id} <br> ${ord.getOrderDate()}</a>
                        </h4>
                    </div>
                    <div id="collapse${ord.id}" class="panel-collapse collapse">
                        <div class="panel-body">
                            <p> Placed on : <span>${ord.getOrderDate()}</span> </p>
                            <p> Name : <span>${ord.getCustomer().getName()}</span> </p>
                            <p> Email : <span>${ord.getCustomer().getEmail()}</span> </p>
                            <p> Phone Number : <span>${ord.getCustomer().getPhone()}</span> </p>
                            <p> Address : <span>${ord.getCustomer().getAddress()}</span> </p>
                            <p> Payment method : <span
                                    style="color: ${ord.getPaymentMethod() == "Pending" ? red : green} ">
                                    ${ord.getPaymentMethod()}
                            </span>
                            </p>
                            <c:set var="totalPrice" value="0" />
                            <p>Products: <br>
                                <c:forEach items="${ord.getOrderDetail()}" var="orderDetail" >
                                        <span>
                                           [ ${orderDetail.getProduct().getProduct().getName()} : ${orderDetail.getPrice()} x ${orderDetail.getQuantityOrdered()}] <br>
                                        </span>
                                    <c:set  var="totalPrice"
                                            value="${totalPrice + (orderDetail.getPrice() * orderDetail.getQuantityOrdered()) }"/>
                                </c:forEach>
                            </p>

                            <p>Grand Total: <span>${totalPrice}</span></p>
                            <p>Status: <span>${ord.getStatus()}</span></p>
                            <p>
                                <c:set var="PendingStatus" value="Pending"/>
                                <c:set var="PAYPAL" value="PAYPAL"/>
                                <c:set var="VNPAY" value="VNPAY"/>

                                <c:if test="${ord.getStatus() == PendingStatus && ord.getPaymentMethod() != PAYPAL && ord.getPaymentMethod() != VNPAY}">
                                    <a class="btn" href="order?action=cancelOrder&&oid=${ord.getId()}" onclick="return confirm('Are you sure cancel this order?');">
                                        Cancel Order
                                    </a>
                                </c:if>

                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>

            <%--            </c:when>--%>

            <%--        </c:choose>--%>

    </div>



</section>
	


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
	

</body>

</html>