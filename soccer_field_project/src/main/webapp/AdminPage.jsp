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
</head>

<body>
	<div class="container-scroller">
		<!-- partial:partials/_sidebar.html -->
		<nav class="sidebar sidebar-offcanvas" id="sidebar">
			<div
				class="sidebar-brand-wrapper d-none d-lg-flex align-items-center justify-content-center fixed-top">
				<a class="sidebar-brand brand-logo" href="index.html"><img
					src="assets/images/logo.svg" alt="logo" /></a> <a
					class="sidebar-brand brand-logo-mini" href="index.html"><img
					src="assets/images/logo-mini.svg" alt="logo" /></a>
			</div>
			<ul class="nav">
				<li class="nav-item profile">
					<div class="profile-desc">
						<div class="profile-pic">
							<div class="count-indicator">
								<img class="img-xs rounded-circle "
									src="assets/images/faces/face15.jpg" alt=""> <span
									class="count bg-success"></span>
							</div>
							<div class="profile-name">
								<h5 class="mb-0 font-weight-normal">Henry Klein</h5>
								<span>Gold Member</span>
							</div>
						</div>
						<a href="#" id="profile-dropdown" data-toggle="dropdown"><i
							class="mdi mdi-dots-vertical"></i></a>
						<div
							class="dropdown-menu dropdown-menu-right sidebar-dropdown preview-list"
							aria-labelledby="profile-dropdown">
							<a href="#" class="dropdown-item preview-item">
								<div class="preview-thumbnail">
									<div class="preview-icon bg-dark rounded-circle">
										<i class="mdi mdi-settings text-primary"></i>
									</div>
								</div>
								<div class="preview-item-content">
									<p class="preview-subject ellipsis mb-1 text-small">Account
										settings</p>
								</div>
							</a>
							<div class="dropdown-divider"></div>
							<a href="#" class="dropdown-item preview-item">
								<div class="preview-thumbnail">
									<div class="preview-icon bg-dark rounded-circle">
										<i class="mdi mdi-onepassword  text-info"></i>
									</div>
								</div>
								<div class="preview-item-content">
									<p class="preview-subject ellipsis mb-1 text-small">Change
										Password</p>
								</div>
							</a>
							<div class="dropdown-divider"></div>
							<a href="#" class="dropdown-item preview-item">
								<div class="preview-thumbnail">
									<div class="preview-icon bg-dark rounded-circle">
										<i class="mdi mdi-calendar-today text-success"></i>
									</div>
								</div>
								<div class="preview-item-content">
									<p class="preview-subject ellipsis mb-1 text-small">To-do
										list</p>
								</div>
							</a>
						</div>
					</div>
				</li>
				<li class="nav-item nav-category"><span class="nav-link">Navigation</span>
				</li>
				<li class="nav-item menu-items" onclick="reloadPage()"><a class="nav-link"
					href="#"> <span class="menu-icon"> <i
							class="mdi mdi-speedometer"></i>
					</span> <span class="menu-title">User Management</span>
				</a></li>
				<li class="nav-item menu-items"><a class="nav-link"
					href="admin_product"> <span class="menu-icon"> <i
							class="mdi mdi-table-large"></i>
					</span> <span class="menu-title">Product Management</span>
				</a></li>
				<li class="nav-item menu-items"><a class="nav-link"
					href="chartjs.html"> <span class="menu-icon"> <i
							class="mdi mdi-chart-bar"></i>
					</span> <span class="menu-title">Charts</span>
				</a></li>
				<li class="nav-item menu-items"><a class="nav-link"
					href="mdi.html"> <span class="menu-icon"> <i
							class="mdi mdi-contacts"></i>
					</span> <span class="menu-title">Icons</span>
				</a></li>
			</ul>
		</nav>
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
			<!-- partial -->
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="row ">
						<div class="col-12 grid-margin">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">User Management</h4>
									<div class="table-responsive">
										<table class="table table-striped">
											<thead>
												<tr>
													<th>User</th>
													<th>Name</th>
													<th>Gmail</th>
													<th>Phone</th>
													<th>Role</th>
													<th>Action</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${list_user}" var="user">
													<tr>
														<td class="py-1"><img
															src="assets/images/faces-clipart/pic-1.png" alt="image" />
														</td>
														<td>${user.username}</td>
														<td>${user.email}</td>
														<td>${user.phone}</td>
														<td><c:choose>
																<c:when test="${user.role eq 1}">
      															Admin
    															</c:when>
																<c:when test="${user.role eq 2}">
      															User
   																</c:when>
																<c:otherwise>
      															Unknown Role
    															</c:otherwise>
															</c:choose></td>

														<td class="actions-cell">
															<div class="buttons right nowrap">
																<button class="button small green --jb-modal show"
																	data-target="sample-modal-2" type="button">
																	<span class="icon"><i class="mdi mdi-eye"></i></span>
																</button>
																<button class="button small red --jb-modal"
																	data-target="sample-modal" type="button">
																	<span class="icon"><i class="mdi mdi-trash-can"></i></span>
																</button>
															</div>
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
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