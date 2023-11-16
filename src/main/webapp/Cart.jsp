<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Trang Giỏ Hàng</title>
 <!-- Link CSS Bootstrap -->
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

    <!-- fonts style -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <!-- font awesome style -->
    <link href="css/font-awesome.min.css" rel="stylesheet" />
  
    <!-- Custom styles for this template -->
    <link href="css/style.css" rel="stylesheet" />
    <!-- responsive style -->
    <link href="css/responsive.css" rel="stylesheet" />
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <style>
@import url("https://fonts.googleapis.com/css2?family=League+Spartan:wght@100;200;300;400;500;600;700;800;900&display=swap");
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

#cart{
  overflow-x: auto;
}

#cart table{
  width: 100%;
  border-collapse: collapse;
  table-layout: fixed;
  white-space: nowrap;
}
.pitch_img{
  width: 110px;
  border-radius: 5px;
}
img{
  width: 80px;
  border-radius: 5px;
}
#cart table td:nth-child(1),
#cart table td:nth-child(2),
#cart table td:nth-child(3),
#cart table td:nth-child(4),
#cart table td:nth-child(5),
#cart table td:nth-child(6){
  width: 150px;
  text-align: center;
}
#cart table td:nth-child(5) input{
  width: 70px;
  padding: 10px 5px 10px 15px;
}
#cart table thead{
  border: 1px solid #e2e9e1;
  border-left: none;
  border-right: none;
}
#cart table thead td{
  font-weight: 700;
  text-transform: uppercase;
  font-size: 13px;
  padding: 18px 0;
}
#cart table tbody tr td{
  padding-top: 15px;
}
#cart table tbody td{
  font-size: 13px;
}
#cart-add{
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
}
#coupon{
  width: 50%;
  margin-bottom: 30px;
}
#coupon h3,
#subtotal h3{
  padding-bottom: 15px;
}
#coupon input{
  padding: 10px 20px;
  outline: none;
  width: 60%;
  margin-right: 10px;
  border: 1px solid #e2e9e1;
}
#coupon button,
#subtotal button{
  background-color: #ffffff;
  color: rgb(0, 0, 0);
  padding: 12px 20px;
  border-radius: 10px;
}
#coupon:hover button:hover,
#subtotal:hover button:hover{
  background-color: purple;
  color: white;
  padding: 12px 20px;
}
#subtotal{
  width: 50%;
  margin-bottom: 30px;
  border: 1px solid #e2e9e1;
  padding: 30px;
}
#subtotal table{
  border-collapse: collapse;
  width: 100%;
  margin-bottom: 20px;
}
#subtotal table td{
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
              <li class="nav-item active">
                <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="about.jsp"> About</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="Category.jsp">Products</a>
              </li>

              <li class="nav-item">
                <a class="nav-link" href="contact.html">Contact Us</a>
              </li>
            </ul>
            <div class="user_optio_box">
              <a href="http://127.0.0.1:5500/login.html">
                <i class="fa fa-user" aria-hidden="true"></i>
              </a>
              <a href="Cart.jsp
              ">
                <i class="fa fa-shopping-cart" aria-hidden="true"></i>
              </a>
            </div>
          </div>
        </nav>
      </div>
    </header>
    <hr style="box-shadow:firebrick;">
    <!-- end header section -->


    
  <div class="container" >
    
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
          <tbody>
              <tr>
                  <td>1</td>
                  <td><img src="images/fanta.jpg"></td>
                  <td>Fanta</td>
                  <td>10000</td>
                  <td><input type="number" value="1"></td>
                  <td>10000</td>
              </tr>
              <tr>
                  <td>2</td>
                  <td><img src="images/pepsi.jpg"></td>
                  <td>pepsi</td>
                  <td>10000</td>
                  <td><input type="number" value="1"></td>
                  <td>10000</td>
              </tr>
              <tr>
                  <td>3</td>
                  <td><img src="images/redbull.jpg"></td>
                  <td>redbull</td>
                  <td>10000</td>
                  <td><input type="number" value="1"></td>
                  <td>10000</td>
              </tr>
          </tbody>
      </table>
  </section>

  <section id="cart" class="section-p1">
    <table width="100%">
        <thead>
            <tr class="p-md-4">
                <td>Name</td>
                <td>Images </td>
                <td>Srarttime</td>
                <td>endTime</td>
                <td>date</td>
                <td>price</td>
                <td>SubToltal</td>
                
             
                <!-- <td>action</td> -->
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>1</td>
                <td><img class="pitch_img" src="images/pitch_11A.jpg"></td>
                <td>7:00</td>
                <td>8:00</td>
                <td>
                  <form >
                    <input type="date"style="width: 120px;">
                  </form>
                </td>
                <td>200 EGP</td>
                <td ></td>          
                
            </tr>
            <!-- <tr>
                <td>2</td>
                <td><img src="images/pitch_5A.jpg"></td>
                <td>7:00</td>
                <td>8:00</td>
                <td></td>
                <td>200 EGP</td>
                <td></td>
            
            </tr>
            <tr>
                <td>3</td>
                <td><img src="images/pitch_5E.jpg"></td>
                <td>7:00</td>
                <td>8:00</td>
                <td></td>
                <td>200 EGP</td>
                <td></td>
      
            </tr> -->
        </tbody>
    </table>
</section>

  <!-- ===================== -->
  <!--     cart add details    -->
  <!-- ===================== -->
  <section id="cart-add" class="section-p1">
      <div id="coupon">
          <h3>Discount</h3>
          <style>
          </style>
          <div>
              <input type="text" placeholder="Enter Your CODE" >
              <button class="normals">Enter</button>
          </div>
      </div>
      <div id="subtotal">
          <h3>Cart Totals</h3>
          <table>
              <tr>
                  <td>Product</td>
                  <td>600 EGP</td>
              </tr>
              <tr>
                  <td>Pitch</td>
                  <td>50 EGP</td>
              </tr>
              <tr>
                  <td><strong>Total</strong></td>
                  <td><strong>650 EGP</strong></td>
              </tr>
          </table>
          <button class="normal">Checkout</button>
      </div>
  </section>
  </div>



  <!-- info section -->
  <section class="info_section layout_padding2">
    <div class="container">
      <div class="info_logo">
        <h2>
          HandTime
        </h2>
      </div>
      <div class="row">

        <div class="col-md-3">
          <div class="info_contact">
            <h5>
              About Shop
            </h5>
            <div>
              <div class="img-box">
                <img src="images/location-white.png" width="18px" alt="">
              </div>
              <p>
                Address
              </p>
            </div>
            <div>
              <div class="img-box">
                <img src="images/telephone-white.png" width="12px" alt="">
              </div>
              <p>
                +01 1234567890
              </p>
            </div>
            <div>
              <div class="img-box">
                <img src="images/envelope-white.png" width="18px" alt="">
              </div>
              <p>
                demo@gmail.com
              </p>
            </div>
          </div>
        </div>
        <div class="col-md-3">
          <div class="info_info">
            <h5>
              Informations
            </h5>
            <p>
              ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt
            </p>
          </div>
        </div>

        <div class="col-md-3">
          <div class="info_insta">
            <h5>
              Instagram
            </h5>

          </div>
        </div>

        <div class="col-md-3">
          <div class="info_form ">
            <h5>
              Newsletter
            </h5>
            <form action="">
              <input type="email" placeholder="Enter your email">
              <button>
                Subscribe
              </button>
            </form>
            <div class="social_box">
              <a href="">
                <img src="images/fb.png" alt="">
              </a>
              <a href="">
                <img src="images/twitter.png" alt="">
              </a>
              <a href="">
                <img src="images/linkedin.png" alt="">
              </a>
              <a href="">
                <img src="images/youtube.png" alt="">
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
        &copy; <span id="displayYear"></span> All Rights Reserved By
        <a href="https://html.design/">Free Html Templates</a>
      </p>
    </div>
  </section>
  <!-- footer section -->
  
</body>
</html>