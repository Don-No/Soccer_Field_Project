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

input.form-control:focus {
    color: #fff;
}
textarea.form-control {
	background-color: #2A3038;
	color: #fff;
	border: 1px solid #ced4da;
	padding: .375rem .75rem;
}

textarea.form-control:focus {
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
									<h4 class="card-title">Pitch Management</h4>
									<form action="updatePitch?pitch_id=${detail.pitchID}"
										method="post">
										<section style="background-color: #050505;">
											<div class="container py-5">

												<div class="row">
													<div class="col-lg-4">
														<div class="card mb-4">
															<div class="card-body text-center">
																<label for="uploadImage"> <img id="previewImage"
																	src="${detail.img}" alt="avatar"
																	class="rounded-circle img-fluid"
																	style="width: 250px; height: 180px; border-radius: 5% !important; cursor: pointer;">
																</label> <input type="file" id="uploadImage" name="uploadImage" id="uploadImage"
																	style="display: none;" accept="image/*">
																<h5 class="my-3">${detail.name}</h5>
																<input type="hidden" id="img_pre" name="img_pre" value="${detail.img}">
															</div>
														</div>

													</div>
													<div class="col-lg-8">
														<div class="card mb-4">
															<div class="card-body">
																<div class="row">
																	<div class="col-sm-3">
																		<p class="mb-0">Pitch Name:</p>
																	</div>
																	<div class="col-sm-9">
																		<input value="${detail.name}" type="text"
																			class="form-control" id="pitchName" name="pitchName"
																			required>
																	</div>
																</div>
																<hr>
																<div class="row">
																	<div class="col-sm-3">
																		<p class="mb-0">Price:</p>
																	</div>
																	<div class="col-sm-9">
																		<input value="${detail.price}" type="text"
																			class="form-control" id="price" name="price" required>
																	</div>
																</div>
																<hr>
																<div class="row">
																	<div class="col-sm-3">
																		<p class="mb-0">Detail:</p>
																	</div>
																	<div class="col-sm-9">
																		<textarea rows="4" cols="150" class="form-control" id="detail" name="detail" required>${detail.detail}</textarea>
																	</div>
																</div>
																<hr>
																<div class="row">
																	<div class="col-sm-3">
																		<p class="mb-0">Pitch type:</p>
																	</div>
																	<div class="col-sm-9">
																		<select class="form-control custom-select"
																			id="pitchTypeID" name="pitchTypeID" required>
																			<c:choose>
																				<c:when test="${detail.pitchTypeID eq 1}">
																					<option value="1" selected>Sân 5</option>
																					<option value="2">Sân 7</option>
																					<option value="3">Sân 11</option>
																				</c:when>
																				<c:when test="${detail.pitchTypeID eq 2}">
																					<option value="1">Sân 5</option>
																					<option value="2" selected>Sân 7</option>
																					<option value="3">Sân 11</option>
																				</c:when>
																				<c:otherwise>
																					<option value="1">Sân 5</option>
																					<option value="2">Sân 7</option>
																					<option value="3" selected>Sân 11</option>
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

<script>
    // Function to handle image preview
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#previewImage').attr('src', e.target.result);
            }

            reader.readAsDataURL(input.files[0]);
        }
    }

    // Trigger file input when the label is clicked
    $('label[for="uploadImage"]').click(function (e) {
        e.preventDefault(); // Prevent default behavior of the label
        $('#uploadImage').click();
    });

    // Handle file input change event
    $('#uploadImage').change(function () {
        readURL(this);
    });
</script>
	<!-- End custom js for this page -->
</body>

</html>