<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>

<head>
    <!-- Basic -->
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <!-- Site Metas -->
    <link rel="icon" href="images/fevicon/fevicon.png" type="image/gif" />
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <title>Soccer Field</title>

    <%@include file="includes/Header.jsp" %>

</head>

<body class="sub_page">

    <div class="hero_area">
        <%@include file="includes/Navbar.jsp" %>
    </div>

    <!-- Product section -->
    <section class="product_section">
    </br>
        <div class="container">
            <div class="product_container">
                <c:forEach items="${list_product}" var="pro">
                    <div class="box">
                        <div class="box-content">
                            <div class="img-box">
                                <img src="images/${pro.img}" alt="${pro.productName}">
                            </div>
                            <div class="detail-box">
                                <div class="text">
                                    <h6>${pro.productName}</h6>
                                    <h5> ${pro.productPrice} <span>VND</span></h5>
                                </div>
                            </div>
                        </div>
                        <div class="btn-box">
                            <a href="#">Add To Cart</a>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </section>

    <%@include file="includes/Footer.jsp" %>
    <%@include file="includes/JS_File.jsp" %>

</body>
</html>
