<%@ page import="java.util.HashMap"%>
<%@ page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Trang Giỏ Hàng</title>
<!-- Link CSS Bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

<!-- fonts style -->
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700;900&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
<!-- font awesome style -->
<link href="css/font-awesome.min.css" rel="stylesheet" />

<!-- Custom styles for this template -->
<link href="css/style.css" rel="stylesheet" />
<!-- responsive style -->
<link href="css/responsive.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<style>
@import
	url("https://fonts.googleapis.com/css2?family=League+Spartan:wght@100;200;300;400;500;600;700;800;900&display=swap")
	;

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: "League Spartan", sans-serif;
}

a {
	text-decoration: none;
}

ul {
	list-style: none;
}

.section-p1 {
	padding: 40px 20px;
}
/* =============================================================================================================================*/
/* =============================================================================================================================*/
/*  */
/*                                                Cart Page 
/*  */
/* =============================================================================================================================*/
/* =============================================================================================================================*/
#cart {
	overflow-x: auto;
}

#cart table {
	width: 100%;
	border-collapse: collapse;
	table-layout: fixed;
	white-space: nowrap;
}

.pitch_img {
	width: 110px;
	border-radius: 5px;
}

img {
	width: 80px;
	border-radius: 5px;
}

#cart table td:nth-child(1), #cart table td:nth-child(2), #cart table td:nth-child(3),
	#cart table td:nth-child(4), #cart table td:nth-child(5), #cart table td:nth-child(6)
	{
	width: 150px;
	text-align: center;
}

#cart table td:nth-child(5) input {
	width: 70px;
	padding: 10px 5px 10px 15px;
}

#cart table thead {
	border: 1px solid #e2e9e1;
	border-left: none;
	border-right: none;
}

#cart table thead td {
	font-weight: 700;
	text-transform: uppercase;
	font-size: 13px;
	padding: 18px 0;
}

#cart table tbody tr td {
	padding-top: 15px;
}

#cart table tbody td {
	font-size: 13px;
}

#cart-add {
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
}

#coupon {
	width: 50%;
	margin-bottom: 30px;
}

#coupon h3, #subtotal h3 {
	padding-bottom: 15px;
}

#coupon input {
	padding: 10px 20px;
	outline: none;
	width: 60%;
	margin-right: 10px;
	border: 1px solid #e2e9e1;
}

#coupon button, #subtotal button {
	background-color: #ffffff;
	color: rgb(0, 0, 0);
	padding: 12px 20px;
	border-radius: 10px;
}

#coupon:hover button:hover, #subtotal:hover button:hover {
	background-color: purple;
	color: white;
	padding: 12px 20px;
}

#subtotal {
	width: 50%;
	margin-bottom: 30px;
	border: 1px solid #e2e9e1;
	padding: 30px;
}

#subtotal table {
	border-collapse: collapse;
	width: 100%;
	margin-bottom: 20px;
}

#subtotal table td {
	width: 50%;
	border: 1px solid #e2e9e1;
	padding: 10px;
	font-size: 13px;
}
</style>
</head>
<body>

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
							<li class="nav-item active"><a class="nav-link"
								href="index.jsp">Home <span class="sr-only">(current)</span></a>
							</li>
							<li class="nav-item"><a class="nav-link" href="about.jsp">
									About</a></li>
							<li class="nav-item"><a class="nav-link" href="Category.jsp">Products</a>
							</li>

							<li class="nav-item"><a class="nav-link" href="contact.html">Contact
									Us</a></li>
						</ul>
						<div class="user_optio_box">
							<a href="http://127.0.0.1:5500/login.html"> <i
								class="fa fa-user" aria-hidden="true"></i>
							</a> <a href="Cart.jsp
              "> <i
								class="fa fa-shopping-cart" aria-hidden="true"></i>
							</a>
						</div>
					</div>
				</nav>
			</div>
		</header>
		<hr style="box-shadow: firebrick;">
		<!-- end header section -->



		<div class="container">

			<!-- ===================== -->
			<!---     cart details    --->
			<!-- ===================== -->
			<section id="cart" class="section-p1">
				<table width="100%">
					<thead>
						<tr>
							<td>Id</td>
							<td>Image</td>
							<td>Name</td>
							<td>Price</td>
							<td>Quantity</td>
							<td>Subtotal</td>
						</tr>
					</thead>
					<tbody id="cart-product">



						<c:forEach items="${products}" var="p" varStatus="loop">
							<tr>
								<td id="${p.getProductID()}">${p.getProductID()}</td>
								<td><img src="${p.getImg()}"></td>
								<td>${p.getProductName()}</td>
								<td>${p.getPrice()}<span>VNĐ</span></td>
								<td><input type="number" value="0" min="0" max="${p.getQuantity() }" class="quantityInput"
									onchange="updateSubtotal(this)"></td>
								<td class="subtotal" id="subtotal_product_${loop.index}"></td>

							</tr>
						</c:forEach>
					</tbody>
				</table>
			</section>

			<section id="cart" class="section-p1">
				<table width="100%">
					<thead>
						<tr class="p-md-4">
							<td>Name</td>
							<td>Images</td>
							<td>Starttime</td>
							<td>endTime</td>
							<td>date</td>
							<td>price</td>
							<td>SubToltal</td>


							<!-- <td>action</td> -->
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>${pitch.getPitchID()}</td>
							<td><img class="pitch_img" src="${pitch.getImg() }"></td>
							<td>${starttime}</td>
							<td>${endtime }</td>
							<td>${date }</td>
							<td>${pitch.getPrice() }</td>
							<td>${pitchPrice }</td>

						</tr>

					</tbody>
				</table>
			</section>

			<!-- ===================== -->
			<!--     cart add details    -->
			<!-- ===================== -->
			<section id="cart-add" class="section-p1">

				<div id="subtotal">
					<h3>Cart Totals</h3>
					<table>
						<tr>
							<td>Product</td>
							<td id="total_product">0 VNĐ</td>
						</tr>
						<tr>
							<td>Pitch</td>
							<td>${pitchPrice }VNĐ</td>
						</tr>
						<tr>
							<td><strong>Total</strong></td>
							<td id="total_overall"><strong>0 VNĐ</strong></td>
						</tr>
					</table>
					<a href="Checkout?pid=${pitch.getPitchID()}&pitchPrice=${pitchPrice}&startTime=${starttime}&endTime=${endtime }&date=${date}" class="normal" onclick="checkout()">Checkout</a>
<!-- 					<button class="normal" onclick="checkout()">Checkout</button> -->
				</div>
			</section>
		</div>



		<!-- info section -->
		<section class="info_section layout_padding2">
			<div class="container">
				<div class="info_logo">
					<h2>HandTime</h2>
				</div>
				<div class="row">

					<div class="col-md-3">
						<div class="info_contact">
							<h5>About Shop</h5>
							<div>
								<div class="img-box">
									<img src="images/location-white.png" width="18px" alt="">
								</div>
								<p>Address</p>
							</div>
							<div>
								<div class="img-box">
									<img src="images/telephone-white.png" width="12px" alt="">
								</div>
								<p>+01 1234567890</p>
							</div>
							<div>
								<div class="img-box">
									<img src="images/envelope-white.png" width="18px" alt="">
								</div>
								<p>demo@gmail.com</p>
							</div>
						</div>
					</div>
					<div class="col-md-3">
						<div class="info_info">
							<h5>Informations</h5>
							<p>ipsum dolor sit amet, consectetur adipiscing elit, sed do
								eiusmod tempor incididunt</p>
						</div>
					</div>

					<div class="col-md-3">
						<div class="info_insta">
							<h5>Instagram</h5>

						</div>
					</div>

					<div class="col-md-3">
						<div class="info_form ">
							<h5>Newsletter</h5>
							<form action="">
								<input type="email" placeholder="Enter your email">
								<button>Subscribe</button>
							</form>
							<div class="social_box">
								<a href=""> <img src="images/fb.png" alt="">
								</a> <a href=""> <img src="images/twitter.png" alt="">
								</a> <a href=""> <img src="images/linkedin.png" alt="">
								</a> <a href=""> <img src="images/youtube.png" alt="">
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

		<!-- end info_section -->

		<!-- footer section -->
		<section class="footer_section">
			<div class="container">
				<p>
					&copy; <span id="displayYear"></span> All Rights Reserved By <a
						href="https://html.design/">Free Html Templates</a>
				</p>
			</div>
		</section>

		<script>
		function checkout() {
			console.log("check")
			// Convert the hashmap to a JSON string
			var jsonString = JSON.stringify(myHashMap);

			// Use AJAX to send the JSON string to the servlet
			var xhr = new XMLHttpRequest();
			xhr.open("POST", "Checkout", true);
			xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");

			xhr.onreadystatechange = function() {
			    if (xhr.readyState == 4 && xhr.status == 200) {
			        // Handle the response from the servlet if needed
			        console.log(xhr.responseText);
			    }
			};
			console.log(xhr.responseText)
			xhr.send(jsonString);
		}
			// Creating a simple "hashmap" in JavaScript
			var myHashMap = {};

			// Adding key-value pairs to the "hashmap"

			function updateSubtotal(inputElement) {
				//var id = inputElement.parentNode.previousElementSibling.previousElementSibling.previousElementSibling.previousElementSibling.textContent;
				var id = inputElement.parentNode.parentNode.firstElementChild.textContent;
				
				var price = parseFloat(inputElement.parentNode.previousElementSibling.textContent);
				var quantity = parseInt(inputElement.value);
				var subtotalElement = inputElement.parentNode.nextElementSibling;
				myHashMap[id] = quantity;
				console.log(myHashMap)
				// Calculate the subtotal for the current product
				var subtotal = price * quantity;

				// Update the subtotal element for the current product
				subtotalElement.textContent = subtotal.toFixed(0) + " VNĐ";

				// Update the total after updating the subtotal for the current product
				updateTotal();

			}

			function updateTotal() {
				var totalProduct = 0;

				// Calculate the total for products
				var productRows = document
						.querySelectorAll('#cart-product .subtotal');
				productRows.forEach(function(row) {
					totalProduct += parseFloat(row.textContent) || 0; // Ensure a valid number, default to 0 if NaN
				});

				// Update the total element for products
				document.getElementById('total_product').textContent = totalProduct
						.toFixed(0)
						+ " VNĐ";

				// Check if pitchPrice is a valid number
				var pitchPrice = parseFloat("${pitchPrice}");
				if (!isNaN(pitchPrice)) {
					// Calculate and update the overall total
					var overallTotal = totalProduct + pitchPrice;
					document.getElementById('total_overall').textContent = overallTotal
							.toFixed(0)
							+ " VNĐ";
				} else {
					// Handle the case when pitchPrice is not a valid number
					document.getElementById('total_overall').textContent = "Error: Pitch price is not valid";
				}
			}
		</script>
</body>
</html>