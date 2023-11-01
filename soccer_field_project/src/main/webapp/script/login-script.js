const sign_in_btn = document.querySelector("#sign-in-btn");
const sign_up_btn = document.querySelector("#sign-up-btn");
const container = document.querySelector(".container");
const nofitication = document.getElementById("nofitication");
const btn_cancel = document.getElementById("btn-cancel");

sign_up_btn.addEventListener("click", () => {
  container.classList.add("sign-up-mode");
  nofitication.style.display = "none";
});

sign_in_btn.addEventListener("click", () => {
  container.classList.remove("sign-up-mode");
  nofitication.style.display = "none";
});


function validateform() {
  var name = document.myform.name.value;
  var password = document.myform.password.value;
  var regexPattern = /^(?=.*[a-zA-Z_])(?=.*[0-9])[a-zA-Z0-9]{6,25}$/;
  
  if (name == null || name == "") {
    alert("Username can't be blank.");
    return false;
  }

  if (!regexPattern.test(name)) {
    alert("Username contains at least 6 to 25 characters, only numbers or only letters are not allow, and no special characters.");
    return false;
  }

  if (password.length < 6) {
    alert("Password must be at least 6 characters long.");
    return false;
  }
  return true;
}

function sign_up_mode() {
  container.classList.add("sign-up-mode");
}

function sign_in_mode(){
  container.classList.remove("sign-up-mode");
}

var signUpNofi = document.getElementById("nofiSignUp");
var signInNofi = document.getElementById("nofiSignIn");
if (signUpNofi.innerHTML === "0") {
  signUpNofi.innerHTML = "Username or Email already exits!";
  sign_up_mode();
}

if(signInNofi.innerHTML === "1" ){
  signInNofi.innerHTML = "Sign up succesfull!"
}

if (signInNofi.innerHTML === "0"){
  signInNofi.innerHTML ="Login Failed ! Check username or password";
}

btn_cancel.addEventListener("click", ()=>{
  nofitication.style.display = "none";
});