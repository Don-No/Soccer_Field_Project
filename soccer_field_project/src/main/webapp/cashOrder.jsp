<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.lang.Math"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
	color: #fff;
	width: 100px;
}

select.form-control.custom-select option {
	color: #fff;
}
</style>



</head>
<body>
	<div class="container-scroller">
		<!-- partial:../../partials/_sidebar.html -->
		<c:import url="sidebar.jsp" />

		<!-- partial -->
		<div class="container-fluid page-body-wrapper">
			<!-- partial:../../partials/_navbar.html -->
			<nav class="navbar p-0 fixed-top d-flex flex-row">
				<div
					class="navbar-brand-wrapper d-flex d-lg-none align-items-center justify-content-center">
					<a class="navbar-brand brand-logo-mini" href="../../index.html"><img
						src="../../assets/images/logo-mini.svg" alt="logo" /></a>
				</div>
				<div
					class="navbar-menu-wrapper flex-grow d-flex align-items-stretch">
					<button class="navbar-toggler navbar-toggler align-self-center"
						type="button" data-toggle="minimize">
						<span class="mdi mdi-menu"></span>
					</button>
					<ul class="navbar-nav navbar-nav-right">


						<li class="nav-item dropdown"><a class="nav-link"
							id="profileDropdown" href="#" data-toggle="dropdown">
								<div class="navbar-profile">
									<img class="img-xs rounded-circle"
										src="assets/images/faces/face15.jpg" alt="">
									<p class="mb-0 d-none d-sm-block navbar-profile-name">${username}</p>
									<i class="mdi mdi-menu-down d-none d-sm-block"></i>
								</div>
						</a>
							<div
								class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list"
								aria-labelledby="profileDropdown">
								<div class="dropdown-divider"></div>
								<a class="dropdown-item preview-item" href="profileUser">
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
								<a class="dropdown-item preview-item" href="login.jsp">
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
					<div class="page-header">
						<div class="table-responsive">

							<h4>Transaction History</h4>
							<!-- set size page -->
							<c:set var="list_pitch" value="${requestScope.list_order}" />
							<c:set var="pageSize" value="10" />
							<c:set var="currentPage"
								value="${param.pageNumber == null ? 1 : param.pageNumber}" />
							<c:set var="totalPages"
								value="${Math.round(Math.ceil(fn:length(list_order) / pageSize))}" />
							<c:set var="startIndex" value="${(currentPage - 1) * pageSize}" />
							<c:set var="endIndex"
								value="${Math.min(Integer.valueOf(currentPage * pageSize-1),Integer.valueOf( fn:length(list_order)-1))}" />
							<table class="table table-striped">
								<thead>
									<tr>
										<th>Name User</th>
										<th>Total Price</th>
										<th>Time</th>
										<th>Pay Method</th>
										<th>Status</th>
										<th>Action</th>
									</tr>
								</thead>


								<tbody>

									<c:forEach items="${list_order}" var="order"
										begin="${startIndex}" end="${endIndex}">
										<tr>
											<td>${order.username}</td>
											<td>${order.price}</td>
											<td>${order.time}</td>
											<td>${order.payMethod}</td>
											<td><select class="form-control custom-select"
												id="status" name="status" required>
													<c:choose>
														<c:when test="${order.status eq 'Unpaid'}">
															<option value="1" selected>Unpaid</option>
															<option value="2">Cancel</option>
															<option value="3">Paid</option>
														</c:when>
														<c:when test="${order.status eq 'Cancel'}">
															<option value="1">Unpaid</option>
															<option value="2" selected>Cancel</option>
															<option value="3">Paid</option>
														</c:when>
														<c:otherwise>
															<option value="1">Unpaid</option>
															<option value="2">Cancel</option>
															<option value="3" selected>Paid</option>
														</c:otherwise>
													</c:choose>
											</select></td>
											<td class="actions-cell">
												<div class="buttons right nowrap">
													<a href="#" class="button small green --jb-modal show"
														data-target="sample-modal-2" onclick="updateOrderStatus(${order.id})"> <span
														class="icon-button">
															<button type="button"
																style="background-color: #4CAF50; color: #ffffff; width: 37px; height: 27px;">
																<span class="icon"><i class="mdi mdi-check"></i></span>
															</button>

													</span>
													</a>
												</div>
											</td>
										</tr>
									</c:forEach>

								</tbody>
							</table>
							<br>
							<!-- Add pagination links with Bootstrap classes -->
							<nav aria-label="Page navigation">
								<ul class="pagination justify-content-end">
									<li class="page-item"><a class="page-link"
										href="?pageNumber=1" aria-label="First"> <<</a></li>
									<li class="page-item"><a class="page-link"
										href="?pageNumber=${currentPage==1?1:currentPage-1}"
										aria-label="Previous"> <span aria-hidden="true">&lt;</span>
									</a></li>
									<li class="page-item"><a class="page-link" href="#">${currentPage}</a></li>
									<li class="page-item"><a class="page-link"
										href="?pageNumber=${currentPage==totalPage?totalPage:currentPage+1}"
										aria-label="Next"> <span aria-hidden="true">&gt;</span>
									</a></li>
									<li class="page-item"><a class="page-link"
										href="?pageNumber=${totalPages}" aria-label="Last"> >></a></li>
								</ul>
							</nav>
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
	<script>
		function updateOrderStatus(orderId) {
			// Get the selected value from the dropdown
			var selectedStatus = document.getElementById('status').value;

			// Update the href attribute with the selected status
			var link = document
					.querySelector('a[data-target="sample-modal-2"]');
			link.href = 'updateOrder?order_id=' + orderId + '&status='
					+ selectedStatus;
		}
	</script>
	<!-- End custom js for this page -->
</body>
</html>