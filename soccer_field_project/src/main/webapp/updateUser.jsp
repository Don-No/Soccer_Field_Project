User
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Admin Page</title>
<!-- plugins:css -->
<link rel="stylesheet"
	href="assets/vendors/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet" href="assets/vendors/css/vendor.bundle.base.css">
<!-- endinject -->
<!-- Plugin css for this page -->
<link rel="stylesheet"
	href="assets/vendors/jvectormap/jquery-jvectormap.css">
<link rel="stylesheet"
	href="assets/vendors/flag-icon-css/css/flag-icon.min.css">
<link rel="stylesheet"
	href="assets/vendors/owl-carousel-2/owl.carousel.min.css">
<link rel="stylesheet"
	href="assets/vendors/owl-carousel-2/owl.theme.default.min.css">
<!-- End plugin css for this page -->
<!-- inject:css -->
<!-- endinject -->
<!-- Layout styles -->
<link rel="stylesheet" href="assets/css/style.css">
<!-- End layout styles -->
<link rel="shortcut icon" href="assets/images/favicon.png" />

<style>
select.form-control.custom-select {
	background-color: #2A3038;
	color: #fff;
	border: 1px solid #ced4da;
	padding: .375rem .75rem;
}

select.form-control.custom-select::after {
        content: '\25BC';
        color: #fff;
        position: absolute;
        top: 50%;
        right: 12px;
        transform: translateY(-50%);
    }

input.form-control {
	background-color: #2A3038;
	color: #fff;
	border: 1px solid #ced4da;
	padding: .375rem .75rem;
}

input.form-control[readonly] {
	background-color: #2A3038;
	color: #fff;
}
</style>
</head>

<body>
	<div class="container-scroller">
		<!-- partial:partials/_sidebar.html -->
		<c:import url="sidebar.jsp" />
		<!-- partial -->
		<div class="container-fluid page-body-wrapper">
			<!-- partial:partials/_navbar.html -->
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
				
					<button
						class="navbar-toggler navbar-toggler-right d-lg-none align-self-center"
						type="button" data-toggle="offcanvas">
						<span class="mdi mdi-format-line-spacing"></span>
					</button>
				</div>
			</nav>
			<!-- partial -->
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="row ">
						<div class="col-12 grid-margin">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">User Management</h4>
									<form action="updateUser?user_id=${detail.userID}"
										method="post">
										<section style="background-color: #050505;">
											<div class="container py-5">

												<div class="row">
													<div class="col-lg-4">
														<div class="card mb-4">
															<div class="card-body text-center">
																<img src="assets/images/faces-clipart/pic-1.png" alt="avatar"
																	class="rounded-circle img-fluid" style="width: 150px;">
																<h5 class="my-3">${detail.username}</h5>
															</div>
														</div>

													</div>
													<div class="col-lg-8">
														<div class="card mb-4">
															<div class="card-body">
																<div class="row">
																	<div class="col-sm-3">
																		<p class="mb-0">Full Name:</p>
																	</div>
																	<div class="col-sm-9">
																		<input value="${detail.fullname}" type="text"
																			class="form-control" id="fullName" name="fullName"
																			readonly="" required>
																	</div>
																</div>
																<hr>
																<div class="row">
																	<div class="col-sm-3">
																		<p class="mb-0">Email:</p>
																	</div>
																	<div class="col-sm-9">
																		<input value="${detail.email}" type="text"
																			class="form-control" id="email" name="email"
																			readonly="" required>
																	</div>
																</div>
																<hr>
																<div class="row">
																	<div class="col-sm-3">
																		<p class="mb-0">Phone:</p>
																	</div>
																	<div class="col-sm-9">
																		<input value="${detail.phone}" type="text"
																			class="form-control" id="phoneNumber"
																			name="phoneNumber" readonly="" required>
																	</div>
																</div>
																<hr>
																<div class="row">
																	<div class="col-sm-3">
																		<p class="mb-0">Address:</p>
																	</div>
																	<div class="col-sm-9">
																		<input value="${detail.address}" type="text"
																			class="form-control" id="address" name="address"
																			readonly="" required>
																	</div>
																</div>
																<hr>
																<div class="row">
																	<div class="col-sm-3">
																		<p class="mb-0">Role:</p>
																	</div>
																	<div class="col-sm-9">
																		<select class="form-control custom-select"
																			id="roleUser" name="roleUser" required>
																			<c:choose>
																				<c:when test="${detail.role eq 1}">
																					<option value="1" selected>Admin</option>
																					<option value="2">User</option>
																				</c:when>
																				<c:when test="${detail.role eq 2}">
																					<option value="1">Admin</option>
																					<option value="2" selected>User</option>
																				</c:when>
																				<c:otherwise>
																					<option value="1">Admin</option>
																					<option value="2">User</option>
																				</c:otherwise>
																			</c:choose>
																		</select>
																	</div>
																</div>
																<div class="row mt-3">
																	<div class="offset-sm-3 col-sm-9">
																		<button type="submit"
																			class="btn btn-primary float-right">Submit</button>
																	</div>
																</div>
															</div>

														</div>

													</div>
												</div>
											</div>
										</section>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- main-panel ends -->
	</div>
	<!-- page-body-wrapper ends -->
	</div>
	<!-- container-scroller -->
	<!-- plugins:js -->
	<script src="assets/vendors/js/vendor.bundle.base.js"></script>
	<!-- endinject -->
	<!-- Plugin js for this page -->
	<script src="assets/vendors/chart.js/Chart.min.js"></script>
	<script src="assets/vendors/progressbar.js/progressbar.min.js"></script>
	<script src="assets/vendors/jvectormap/jquery-jvectormap.min.js"></script>
	<script
		src="assets/vendors/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
	<script src="assets/vendors/owl-carousel-2/owl.carousel.min.js"></script>
	<!-- End plugin js for this page -->
	<!-- inject:js -->
	<script src="assets/js/off-canvas.js"></script>
	<script src="assets/js/hoverable-collapse.js"></script>
	<script src="assets/js/misc.js"></script>
	<script src="assets/js/settings.js"></script>
	<script src="assets/js/todolist.js"></script>
	<!-- endinject -->
	<!-- Custom js for this page -->
	<script src="assets/js/dashboard.js"></script>

	<script>
		function reloadPage() {
			location.reload();
		}
	</script>
	<!-- End custom js for this page -->
</body>

</html>