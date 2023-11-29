<!DOCTYPE html>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>

<head>
  <!-- Basic -->
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <!-- Mobile Metas -->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <!-- Site Metas -->
  <link rel="icon" href="images/fevicon/fevicon.png" type="image/gif" />
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="author" content="" />

  <title>HandTime</title>

  <!-- bootstrap core css -->
  <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
 
  <!-- fonts style -->
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700;900&display=swap" rel="stylesheet">

  <!-- font awesome style -->
  <link href="css/font-awesome.min.css" rel="stylesheet" />

  <!-- Custom styles for this template -->
 <link href="css/style.css" rel="stylesheet" />

  <!-- responsive style -->
  <link href="css/responsive.css" rel="stylesheet" />
  <style >
  .search_section{
	background: #f5f5f5;
}
.header-search {
    padding: 15px 0px;
}

.header-search form {
    position: relative;
}

/*.header-search form .input-select {*/
/*    margin-right: -4px;*/
/*    border-radius: 40px 0px 0px 40px;*/
/*}*/

.header-search form .input {
    width: 40%;
    margin-right: -5px;
    border-radius: 40px 0px 0px 40px;
    height: 40px;
    border-color: #8019c8;
}

.header-search form .search-btn {
    height: 40px;
    width: 100px;
    background: #8019c8;
    color: #FFF;
    font-weight: 700;
    border: none;
    border-radius: 0px 40px 40px 0px;
}



.store-pagination {
    float: right;
}

.store-pagination li {
    display: inline-block;
    width: 40px;
    height: 40px;
    line-height: 40px;
    text-align: center;
    background-color: #FFF;
    border: 1px solid #E4E7ED;
    -webkit-transition: 0.2s all;
    transition: 0.2s all;
}

.store-pagination li + li {
    margin-left: 5px;
}

.store-pagination li:hover {
    background-color: #E4E7ED;
    color: #D10024;
}

.store-pagination li.active {
    background-color: #8019c8;
    border-color: #8019c8;
    color: #FFF;
    font-weight: 500;
    cursor: default;
}

.store-pagination li a {
    display: block;
}
  
  </style>

</head>

<body class="sub_page">

  <div class="hero_area">
    <!-- header section strats -->
    <header class="header_section">
      <div class="container-fluid">
        <nav class="navbar navbar-expand-lg custom_nav-container ">
          <a class="navbar-brand" href="index.html">
            <span>
              HandTime
            </span>
          </a>

          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class=""> </span>
          </button>

          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav  ">
              <li class="nav-item ">
                <a class="nav-link" href="index.html">Home <span class="sr-only">(current)</span></a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="about.html"> About</a>
              </li>
              <li class="nav-item active">
                <a class="nav-link" href="product.html">Products</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="testimonial.html">Testimonial</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="contact.html">Contact Us</a>
              </li>
            </ul>
            <div class="user_optio_box">
              <a href="">
                <i class="fa fa-user" aria-hidden="true"></i>
              </a>
              <a href="">
                <i class="fa fa-shopping-cart" aria-hidden="true"></i>
              </a>
            </div>
          </div>
        </nav>
      </div>
    </header>
    <!-- end header section -->
  </div>

  <!-- product section -->
<!--   <section class="search_section"> -->
  
<!-- 				<div class="col-md-12 hidden-sm hidden-xs" > -->
<!--                     <div class="header-search" style=" text-align: center; "> -->

<!--                         <form action="./store?process=3" method="post"> -->
<!--                             <input class="input" placeholder="Search here" name="searchKey"> -->
<!--                             <button class="search-btn">Search</button> -->
<!--                         </form> -->
<!--                     </div> -->
<!--                 </div> -->
<!--                 </section> -->
  <section class="product_section ">
    <div class="container">
      <div class="product_heading">
        <h2>
          Nước uống
        </h2>
      </div>
      <div class="product_container">
        <c:forEach items="${products}" var="p">
       
        <div class="box">
          <div class="box-content">
            <div class="img-box">
              <img src="${p.getImg()}" alt="">
            </div>
            <div class="detail-box">
              <div class="text">
                <h6>
                  ${p.getProductName()}
                </h6>
               
              </div>
              <div class="like">
                <h6>
                  ${p.getPrice()}<span>VNĐ</span> 
                </h6>
               
                <h6> <span>Remaining: </span>  ${p.getQuantity()}</h6>
              </div>
            </div>
          </div>
          <div class="btn-box">
            <a href="">
              Add To Cart
            </a>
          </div>
        </div>
         </c:forEach>
      </div>
    </div>
  </section>
<div class="store-filter clearfix">
                    
                    <ul class="store-pagination" id="store-pagination">
                        <li id="nav-page-prev" value="${currpage - 1}">
                            <a href="#">
                                <i class="fa fa-angle-left"></i>
                            </a>
                        </li>

                        <li class="active" id="curr_page">1</li>

                        <li id="nav-page-next" value="${currpage + 1}">
                            <a href="#">
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                </div>
  <!-- end product section -->


 

  <!-- footer section -->
  <section class="footer_section">
    <div class="container">
      <p>
        &copy; <span id="displayYear"></span> All Rights Reserved By
        <a href="https://html.design/">Free Html Templates</a>
      </p>
    </div>
  </section>
  <!-- footer section -->

  <!-- jQery -->
  <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
  <!-- popper js -->
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous">
  </script>
  <!-- bootstrap js -->
  <script type="text/javascript" src="js/bootstrap.js"></script>
  <!-- custom js -->
  <script type="text/javascript" src="js/custom.js"></script>
  <!-- Google Map -->
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCh39n5U-4IoWpsVGUHWdqB6puEkhRLdmI&callback=myMap">
  </script>
  <!-- End Google Map -->

</body>

</html>