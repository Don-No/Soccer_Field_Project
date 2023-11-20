<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <link rel="icon" href="images/fevicon/fevicon.png" type="image/gif" />
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="author" content="" />

  <title>Soccer Field</title>
  <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700;900&display=swap" rel="stylesheet">
  <link href="css/font-awesome.min.css" rel="stylesheet" />
  <link href="css/style.css" rel="stylesheet" />
  <link href="css/responsive.css" rel="stylesheet" />
  <style>
    .card {
      margin-bottom: 20px;
    }

    .card img {
      width: 100%;
      height: 200px;
      object-fit: cover;
    }

    .card-title {
      margin-bottom: 0;
    }

    .card-price {
      color: red;
      font-weight: bold;
    }

    .card-button {
      display: block;
      width: 100%;
      padding: 10px;
      background-color: #007bff;
      color: #fff;
      text-align: center;
      text-decoration: none;
    }
  </style>
</head>
<body class="sub_page">
  <div class="hero_area">
  
    <%@include file="includes/Navbar.jsp" %> 
    
    
    
  </div>
</br>
  <div class="container">
    <div class="row">
      <c:forEach items="${list_pitch}" var="pitch">
        <div class="col-md-3">
          <div class="card">
            <img src="images/${pitch.img}" alt="Sân bóng">
            <div class="card-body">
              <h3 class="card-title">
                <c:choose>
                  <c:when test="${pitch.pitchTypeID eq 1}">Sân 5</c:when>
                  <c:when test="${pitch.pitchTypeID eq 2}">Sân 7</c:when>
                  <c:when test="${pitch.pitchTypeID eq 3}">Sân 11</c:when>
                  <c:otherwise>Unknown Role</c:otherwise>
                </c:choose>
              </h3>
              <p class="card-price"><span>${pitch.price}</span><span>/h</span></p>
              <a href="Cart.jsp" class="card-button">Booking now</a>
            </div>
          </div>
        </div>
      </c:forEach>
    </div>
  </div>

  <%@include file="includes/Footer.jsp" %> 
  <%@include file="includes/JS_File.jsp" %> 
</body>
</html>
