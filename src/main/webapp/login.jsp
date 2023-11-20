<%@ page isELIgnored="false" %>

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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script nonce="33c683b5-5781-432b-9f2f-3cc206e0b91a">(function(w,d){!function(a,b,c,d){a[c]=a[c]||{};a[c].executed=[];a.zaraz={deferred:[],listeners:[]};a.zaraz.q=[];a.zaraz._f=function(e){return function(){var f=Array.prototype.slice.call(arguments);a.zaraz.q.push({m:e,a:f})}};for(const g of["track","set","debug"])a.zaraz[g]=a.zaraz._f(g);a.zaraz.init=()=>{var h=b.getElementsByTagName(d)[0],i=b.createElement(d),j=b.getElementsByTagName("title")[0];j&&(a[c].t=b.getElementsByTagName("title")[0].text);a[c].x=Math.random();a[c].w=a.screen.width;a[c].h=a.screen.height;a[c].j=a.innerHeight;a[c].e=a.innerWidth;a[c].l=a.location.href;a[c].r=b.referrer;a[c].k=a.screen.colorDepth;a[c].n=b.characterSet;a[c].o=(new Date).getTimezoneOffset();if(a.dataLayer)for(const n of Object.entries(Object.entries(dataLayer).reduce(((o,p)=>({...o[1],...p[1]})))))zaraz.set(n[0],n[1],{scope:"page"});a[c].q=[];for(;a.zaraz.q.length;){const q=a.zaraz.q.shift();a[c].q.push(q)}i.defer=!0;for(const r of[localStorage,sessionStorage])Object.keys(r||{}).filter((t=>t.startsWith("_zaraz_"))).forEach((s=>{try{a[c]["z_"+s.slice(7)]=JSON.parse(r.getItem(s))}catch{a[c]["z_"+s.slice(7)]=r.getItem(s)}}));i.referrerPolicy="origin";i.src="../../cdn-cgi/zaraz/sd0d9.js?z="+btoa(encodeURIComponent(JSON.stringify(a[c])));h.parentNode.insertBefore(i,h)};["complete","interactive"].includes(b.readyState)?zaraz.init():a.addEventListener("DOMContentLoaded",zaraz.init)}(w,d,"zarazData","script");})(window,document);</script></head>

<body class="animsition">

    <div class="login-wrap">
        <div class="login-html">
        <form action="login" method="post" class="sign-in-form">
            <input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">Sign In</label>
            <input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">Sign Up</label>
            <div class="login-form">
            
                <div class="sign-in-htm">
                    <div class="group">
                        <label for="user" class="label">Username</label>
                        <input id="user" name="username" type="text" class="input">
                    </div>
                    <div class="group">
                        <label for="pass" class="label">Password</label>
                        <input id="pass" name="password" type="password" class="input" data-type="password">
                    </div>
                    <div class="group">
                        <input id="check" name="rem" type="checkbox" class="check" checked>
                        <label for="check"><span class="icon"></span> Keep me Signed in</label>
                    </div>
                    <div class="group">
                        <input id="btn-sign-in" type="submit" class="button" value="Sign In">
                    </div>
                    <p class="text-danger">${mess}</p>
                    <div class="hr"></div>
                    <div class="foot-lnk">
                        <a href="#forgot">Forgot Password?</a>
                    </div>
                </div>

    
         </form>
         

                <div class="sign-up-htm">
					<form action="signup" method="post" onsubmit="return validateSignUpForm()">



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
					<div class="group">
                        <input id="btn-sign-up" type="submit" class="button" value="Sign Up">
                    </div>
                    <div class="foot-lnk">
						<label for="tab-1">Already Member?</label>
					</div>
					
					<div class="foot-lnk">
					<c:if test="${not empty requestScope.emptyFields}">
					<div class="alert alert-danger">${requestScope.emptyFields}</div>
				</c:if>
				<c:if test="${not empty requestScope.signupError}">
					<div class="alert alert-danger">${requestScope.signupError}</div>
				</c:if>
				</div>
					
					</form>

				</div>
            </div>	
	<script>
        function validateSignUpForm() {
            var username = document.getElementById("username").value;
            var fullname = document.getElementById("fullname").value;
            var password = document.getElementById("password").value;
            var email = document.getElementById("email").value;
            var phone = document.getElementById("phone").value;

            if (username === '' || fullname === '' || password === '' || email === '' || phone === '') {
                alert("Vui lòng điền đầy đủ thông tin.");
                return false;
            }

            // Bạn có thể thêm các điều kiện validate khác tại đây

            return true;
        }
    </script>
    <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
    <script src="js/login.js"></script>
</body>

</html>