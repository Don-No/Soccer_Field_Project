<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.io.*, java.util.*, java.text.*"%>
<%@ page import="java.util.List" %>


<!DOCTYPE html>
<html>
<head>
<!-- Your HTML head content goes here -->
<script type="text/javascript">

</script>
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
.btn {
    display: inline-block;
    padding: 10px 20px;
    text-align: center;
    text-decoration: none;
    font-size: 16px;
    font-weight: bold;
    cursor: pointer;
    color: #fff;
    background-color: #007bff;
    border: 1px solid #007bff;
    border-radius: 4px;
    transition: background-color 0.3s;
}

.btn:hover {
    background-color: #0056b3;
}

.order-submit {
    margin-top: 20px;
    background-color: #28a745;
    border: 1px solid #28a745;
}

.order-submit:hover {
    background-color: #218838;
}

</style>
</head>
<body>
	<!-- Your HTML body content goes here -->


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

				
					<c:set var="totalProduct" value="0" />
				<c:forEach items="${datalist}" var="p">
					<tr>
						<td>${p.getProductId()}</td>
						<td><img src="${p.getProduct().getImg()}"></td>
						<td>${p.getProduct().getProductName()}</td>
						<td>${p.getProduct().getPrice()}<span>VNĐ</span></td>
						<td>${p.getQuantity() }</td>
						<td>${p.getProduct().getPrice() * p.getQuantity()}
						  <c:set var="totalProduct" value="${totalProduct + p.getProduct().getPrice() * p.getQuantity()}" />
						
						</td>

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
	<c:set var="Total" value="${pitchPrice+totalProduct }"/>
	<section id="cart-add" class="section-p1">

				<div id="subtotal">
					<h3>Cart Totals</h3>
					<table>
						<tr>
							<td>Product</td>
							<td>${totalProduct} VNĐ</td>
						</tr>
						<tr>
							<td>Pitch</td>
							<td>${pitchPrice}VNĐ</td>
						</tr>
						<tr>
							<td><strong>Total</strong></td>
							<td><strong>${Total} VNĐ</strong></td>
						</tr>
					</table>
<%-- 					<a href="Checkout?pid=${pitch.getPitchID()}&pitchPrice=${pitchPrice}&startTime=${starttime}&endTime=${endtime }&date=${date}" class="normal" onclick="checkout()">Checkout</a> --%>
<!-- 					<button class="normal" onclick="checkout()">Checkout</button> -->
				</div>
			</section>
			<form action="PlaceOrder" method="post">
			 		  <input type="hidden" name="pid" value="${pitch.getPitchID()}">
                    <input type="hidden" name="datalist" value="${datalist}">
                    <input type="hidden" name="starttime" value="${starttime}">
                    <input type="hidden" name="endtime" value="${endtime }">
                    <input type="hidden" name="total" value="${Total}">
                     <input type="hidden" name="date" value="${date}">
                     <input type="hidden" name="bookingprice" value="${pitchPrice }">
                    <input type="submit" name="order"
                           class="btn primary-btn order-submit"
                           value="place order">
			</form>
	
</body>
</html>