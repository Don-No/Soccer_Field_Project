<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>Home</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="css/login.css">
<body class="animsition">

	<div class="login-wrap">
		<div class="login-html">
			<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label
				for="tab-1" class="tab">Sign In</label> <input id="tab-2"
				type="radio" name="tab" class="sign-up"><label for="tab-2"
				class="tab">Sign Up</label>

			<div class="login-form">
				<div class="sign-in-htm">
					<div class="group">
						<label for="user" class="label">Username</label> <input id="user"
							type="text" class="input">
					</div>
					<div class="group">
						<label for="pass" class="label">Password</label> <input id="pass"
							type="password" class="input" data-type="password">
					</div>
					<div class="group">
						<input id="check" type="checkbox" class="check" checked> <label
							for="check"><span class="icon"></span> Keep me Signed in</label>
					</div>
					<div class="group">
						<input id="btn-sign-in" type="submit" class="button"
							value="Sign In">
					</div>
					<div class="hr"></div>
					<div class="foot-lnk">
						<a href="#forgot">Forgot Password?</a>
					</div>
				</div>



				<div class="sign-up-htm">
					<form action="signup" method="post">


						<div class="group">
							<label for="username" class="label">Username</label> <input
								type="text" class="input" id="username" name="username">
						</div>
						<div class="group">
							<label for="fullname" class="label">Fullname</label> <input
								type="text" class="input" id="fullname" name="fullname">
						</div>
						<div class="group">
							<label for="password" class="label">Password</label> <input
								type="password" class="input" id="password" name="password">
						</div>
						<div class="group">
							<label for="email" class="label">Email</label> <input type="text"
								class="input" id="email" name="email">
						</div>
						<div class="group">
							<label for="phone" class="label">Phone</label> <input type="text"
								class="input" id="phone" name="phone">
						</div>



						<button type="submit" class="btn btn-primary ">Signup</button>
					</form>

					<div class="foot-lnk">
						<label for="tab-1">Already Member?</a>
					</div>
					<div class="foot-lnk">
					<c:if test="${not empty requestScope.emptyFields}">
					<div class="alert alert-danger">${requestScope.emptyFields}</div>
				</c:if>
				<c:if test="${not empty requestScope.signupError}">
					<div class="alert alert-danger">${requestScope.signupError}</div>
				</c:if></div>



				</div>
				
			</div>
		</div>
	</div>

	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
	<script src="js/login.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>