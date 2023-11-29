<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>
<!-- partial:partials/_sidebar.html -->
<nav class="sidebar sidebar-offcanvas" id="sidebar">
	<div
		class="sidebar-brand-wrapper d-none d-lg-flex align-items-center justify-content-center fixed-top">
		<h2>Admin Page</h2>
	</div>
	<ul class="nav">
		<li class="nav-item nav-category"><span class="nav-link">Management</span>
		</li>

		<li class="nav-item menu-items"><a class="nav-link"
			href="AdminPage"> <span class="menu-icon"> <i
					class="mdi mdi-account-circle"></i>
			</span> <span class="menu-title">User Management</span>
		</a></li>


		<li class="nav-item menu-items"><a class="nav-link"
			data-toggle="collapse" href="#ui-basic" aria-expanded="false"
			aria-controls="ui-basic"> <span class="menu-icon"> <i
					class="mdi mdi-laptop"></i>
			</span> <span class="menu-title">Product Management</span> <i
				class="menu-arrow"></i>
		</a>


			<div class="collapse" id="ui-basic">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"><a class="nav-link" href="admin_product">List
							Product</a></li>
					<li class="nav-item"><a class="nav-link" href="addProduct.jsp">Add
							Product</a></li>
				</ul>
			</div></li>


		<li class="nav-item menu-items"><a class="nav-link"
			href="listPitch"> <span class="menu-icon"> <i
					class="mdi mdi-code-equal"></i>
			</span> <span class="menu-title">Pitch Management</span>
		</a></li>

		<li class="nav-item menu-items"><a class="nav-link"
			href="listOrder"> <span class="menu-icon"> <i
					class="mdi mdi-newspaper"></i>
			</span> <span class="menu-title">Order Management</span>
		</a></li>
	</ul>
</nav>
















































