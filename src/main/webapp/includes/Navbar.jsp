<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <header class="header_section">
      <div class="container-fluid">
        <nav class="navbar navbar-expand-lg custom_nav-container ">
          <a class="navbar-brand" href="index.html">
            <span>
              TEAM 10
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
                <a class="nav-link" href="listPitchUser">Soccer Field</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="listProductUser">Product</a>
              </li>

              <li class="nav-item">
                <a class="nav-link" href="contact.jsp">Contact Us</a>
              </li>
            </ul>
            
            
	            <div class="user_optio_box">
    		<c:if test="${empty sessionScope.user}">

        	<a href="${pageContext.request.contextPath}/login">
		    <i class="fa fa-user" aria-hidden="true"></i>
		        </a>
		    </c:if>
		    <c:if test="${not empty sessionScope.user}">
				${sessionScope.user}
		    </c:if>
		    <a href="${pageContext.request.contextPath}/Cart.jsp">
		        <i class="fa fa-shopping-cart" aria-hidden="true"></i>
		    </a>
		</div>
		
		
		
          </div>
        </nav>
      </div>
    </header>
</body>
</html>