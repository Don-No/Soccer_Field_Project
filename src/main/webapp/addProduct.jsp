<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Admin Page</title>
<link rel="stylesheet"
	href="assets/vendors/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet" href="assets/vendors/css/vendor.bundle.base.css">
<link rel="stylesheet"
	href="assets/vendors/jvectormap/jquery-jvectormap.css">
<link rel="stylesheet"
	href="assets/vendors/flag-icon-css/css/flag-icon.min.css">
<link rel="stylesheet"
	href="assets/vendors/owl-carousel-2/owl.carousel.min.css">
<link rel="stylesheet"
	href="assets/vendors/owl-carousel-2/owl.theme.default.min.css">
<link rel="stylesheet" href="assets/css/style.css">
<link rel="shortcut icon" href="assets/images/favicon.png" />
</head>

<body>
	<div class="container-scroller">
		<c:import url="sidebar.jsp" />
		<div class="container-fluid page-body-wrapper">
			<nav class="navbar p-0 fixed-top d-flex flex-row">
				<div
					class="navbar-brand-wrapper d-flex d-lg-none align-items-center justify-content-center">
					<a class="navbar-brand brand-logo-mini" href="index.html"><img
						src="assets/images/logo-mini.svg" alt="logo" /></a>
				</div>
				<div
					class="navbar-menu-wrapper flex-grow d-flex align-items-stretch">
					<button class="navbar-toggler navbar-toggler align-self-center"
						type="button" data-toggle="minimize">
						<span class="mdi mdi-menu"></span>
					</button>
					<ul class="navbar-nav navbar-nav-right">
						<li class="nav-item nav-settings d-none d-lg-block"></li>

						<li class="nav-item dropdown"><a class="nav-link"
							id="profileDropdown" href="#" data-toggle="dropdown">
								<div class="navbar-profile">
									<img class="img-xs rounded-circle"
										src="assets/images/faces/face15.jpg" alt="">
									<p class="mb-0 d-none d-sm-block navbar-profile-name">Henry
										Klein</p>
									<i class="mdi mdi-menu-down d-none d-sm-block"></i>
								</div>
						</a>
							<div
								class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list"
								aria-labelledby="profileDropdown">
								<div class="dropdown-divider"></div>
								<a class="dropdown-item preview-item">
									<div class="preview-thumbnail">
										<div class="preview-icon bg-dark rounded-circle">
											<i class="mdi mdi-account-circle text-success"></i>
										</div>
									</div>
									<div class="preview-item-content">
										<p class="preview-subject mb-1">Profile</p>
									</div>
								</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item preview-item">
									<div class="preview-thumbnail">
										<div class="preview-icon bg-dark rounded-circle">
											<i class="mdi mdi-logout text-danger"></i>
										</div>
									</div>
									<div class="preview-item-content">
										<p class="preview-subject mb-1">Log out</p>
									</div>
								</a>
							</div></li>
					</ul>
					<button
						class="navbar-toggler navbar-toggler-right d-lg-none align-self-center"
						type="button" data-toggle="offcanvas">
						<span class="mdi mdi-format-line-spacing"></span>
					</button>
				</div>
			</nav>
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="row ">
						<div class="col-12 grid-margin">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">Add Product</h4>
									<div class="table-responsive">
										<!-- Add Product Form -->
										
										<form action="addProduct" method="post" enctype="multipart/form-data">
    
    <div class="form-group">
        <label for="productName">Name:</label>
        <input type="text" class="form-control" id="productName" name="productName" required>
    </div>
    <div class="form-group">
        <label for="productPrice">Price:</label>
        <input type="text" class="form-control" id="productPrice" name="productPrice" required>
    </div>
    <div class="form-group">
        <label for="productQuantity">Quantity:</label>
        <input type="text" class="form-control" id="productQuantity" name="productQuantity" required>
    </div>
    <div class="form-group">
        <label for="productImage">Image:</label>
        <input type="file" name="productImage" class="form-control-file" id="productImage" required>
    </div>
    <button type="submit" class="btn btn-primary">Submit</button>
</form>

										<!-- End Add Product Form -->
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>
	<script src="assets/vendors/js/vendor.bundle.base.js"></script>
	<script src="assets/vendors/chart.js/Chart.min.js"></script>
	<script src="assets/vendors/progressbar.js/progressbar.min.js"></script>
	<script src="assets/vendors/jvectormap/jquery-jvectormap.min.js"></script>
	<script
		src="assets/vendors/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
	<script src="assets/vendors/owl-carousel-2/owl.carousel.min.js"></script>
	<script src="assets/js/off-canvas.js"></script>
	<script src="assets/js/hoverable-collapse.js"></script>
	<script src="assets/js/misc.js"></script>
	<script src="assets/js/settings.js"></script>
	<script src="assets/js/todolist.js"></script>
	<script src="assets/js/dashboard.js"></script>
</body>
</html>