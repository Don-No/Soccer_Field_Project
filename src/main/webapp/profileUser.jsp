<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

   

    <link rel="icon" href="/imgs/logo.png">
    <!-- Google font -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

    <!-- Bootstrap -->
    <link type="text/css" rel="stylesheet" href="./css/bootstrap.min.css"/>
    <link rel="icon" href="imgs/logos/360_F_451269306_U5VVjfXzU2OZLyaLOKmkI73SCwBcjgvF.jpg" type="image/x-icon">

    <!-- Slick -->
    <link type="text/css" rel="stylesheet" href="./css/slick.css"/>
    <link type="text/css" rel="stylesheet" href="./css/slick-theme.css"/>

    <!-- nouislider -->
    <link type="text/css" rel="stylesheet" href="./css/nouislider.min.css"/>

    <!-- Font Awesome Icon -->
    <link rel="stylesheet" href="./css/font-awesome.min.css">
    <!-- Custom stlylesheet -->
    <link rel="stylesheet" href="./css/profile.css">
    <link rel="stylesheet" href="./css/style.css">

    <style>
        .show {
            display: block;
        }
        .hide {
            display: none;
        }

		span {
      display: inline;
    width: 250px;
    height: 20px;
    padding: 5px;
    text-align: center;
}
         .form__msg {
    font-size: 12px;
    color: red;
    margin: 0 0 12px 4px;
    line-height: 12px;
}
        .form__group-change {
            width: 100%;
            display: flex;
            align-items: baseline;
            flex-wrap: wrap;
        }
        
    </style>
    
    <script>
        function goBack() {
            window.history.back();
        }
    </script>

</head>
<body>
<button onclick="goBack()">Back</button>



<div class="body-container">
    <div class="body-container__profile ${hide}">

        <div class="profile__header">
            <h3 class="profile__heading">My Profile</h3>
            <div class="profile__title">Manage profile information for account security</div>
        </div>
        <div class="profile__body">
         <span class="form__msg" style="color: green; font-size: 20px;">${msgProfile}</span>
            <form action="ProfileUser?action=updateProfile" method="post" class="profile__form" id="form-profile">
                <div class="form__group">
                    <label for="fullname" class="form__label">Fullname</label>
                    <input name="fullname" id="fullname" class="form__input" type="text" value="${infomation.getFullname()}"
                           required/>
                           <span class="form__msg"></span>
                </div>
                <div class="form__group">
                    <label for="email" class="form__label">Email</label>
                    <input name="email" id="email" class="form__input" type="text" value="${infomation.getEmail()}"
                           required/>
                           <span class="form__msg"></span>
                </div>
                <div class="form__group">
                    <label for="phonenumber" class="form__label">Phone number</label>
                    <input name="phonenumber" id="phonenumber" class="form__input" type="text" value="${infomation.getPhone()}"
                           required/>
                           <span class="form__msg"></span>
                </div>
                <div class="form__group">
                    <label for="address" class="form__label">Address</label>
                    <input name="address" id="address" class="form__input" type="text"
                           value="${infomation.getAddress()}" required/>
                           <span class="form__msg"></span>
                </div>
               
               
                <button class="btn form__btn">Save</button>
            </form>
        </div>
    </div>

	
    <div class="body-container__profile" style="display: ${show};">
        <div class="profile__header" style="margin-bottom: 16px;">
            <h3 class="profile__heading">Change Password</h3>
            <div class="profile__title">Change Password for account security</div>
        </div>
        <div class="profile__body">
            <span class="form__msg" style="color: green; font-size: 20px;">${success}</span>
            <form action="ProfileUser?action=changePassword" method="post" class="profile__form" id="form-change-password">
                <div class="form__group-change">
                    <input id="oldpassword" name="oldpassword" class="form__input" value="" type="password" placeholder="Old Password" />
                    <span class="form__msg">${msg}</span>
                </div>
                <div class="form__group-change">
                    <input id="newpassword" name="newpassword" class="form__input" value="" type="password" placeholder="New Password" />
                    <span class="form__msg"></span>
                </div>
                <div class="form__group-change">
                    <input id="confirmnewpassword" name="confirmnewpassword" class="form__input" value="" type="password" placeholder="Comfirm New Password" />
                    <span class="form__msg"></span>
                </div>
                <button class="btn form__btn">Save</button>
            </form>
        </div>
    </div>

</div>

<!-- FOOTER -->
  


<!-- /FOOTER -->

<!-- jQuery Plugins -->
<script src="./js/jquery.min.js"></script>
<script src="./js/bootstrap.min.js"></script>
<script src="./js/slick.min.js"></script>
<script src="./js/nouislider.min.js"></script>
<script src="./js/jquery.zoom.min.js"></script>
<script src="./js/main.js"></script>

<script src="js/validator.js"></script>


<script>
Validator({
    form: '#form-profile',
    formGroupSelector: '.form__group',
    errorSelector: '.form__msg',
        rules: [
        Validator.isRequiredFullName('#fullname'),
        Validator.isRequired('#email','Enter your email address to sign in'),
        Validator.isEmail('#email'),
        Validator.isRequired('#phonenumber'),
        Validator.isPhoneNumber('#phonenumber'),
        Validator.isRequired('#address'),
        ,
    ],

});

    Validator({
        form: '#form-change-password',
        formGroupSelector: '.form__group-change',
        errorSelector: '.form__msg',
        password: '#form-change-password #newpassword',
        confirmPassword: '#form-change-password #confirmnewpassword',
        rules: [
            Validator.isRequired('#oldpassword'),
            Validator.isPassword('#oldpassword', 8),
            Validator.isRequired('#newpassword'),
            Validator.isPassword('#newpassword', 8),
            Validator.isConfirmedPassword('#newpassword', function () {
                return document.querySelector('#form-change-password #confirmnewpassword').value;
            }, 'New Password and Comfirm New Password must be the same'),
            Validator.isRequired('#confirmnewpassword'),
            Validator.isPassword('#confirmnewpassword', 8),
            Validator.isConfirmed('#confirmnewpassword', function () {
                return document.querySelector('#form-change-password #newpassword').value;
            }, 'New Password and Comfirm New Password must be the same'),
        ],

    });

</script>
</body>
</html>
