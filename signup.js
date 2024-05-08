
document.getElementById("confirmSignup").addEventListener("click", function(){
  var username = document.getElementById("usernameInput").value;
  var password = document.getElementById("passInput").value;
  var confirmPassword = document.getElementById("confPassInput").value;

  if(password !== confirmPassword){
    alert("Passwords do not match!");
    return;
  }

  submitSignupForm(username, password, confirmPassword); 
});



