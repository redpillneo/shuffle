document.getElementById("confirmSignup").addEventListener("click", function(){
  const username = document.getElementById("usernameInput").value;
  const password = document.getElementById("passInput").value;
  const confirmPassword = document.getElementById("confPassInput").value;

  if(!username){
    alert("Enter username");
    return;
  }
  if(!password){
    alert("Enter password");
    return;
  }
  if(!confirmPassword){
    alert("Confirm Password");
    return;

  }
  if(password !== confirmPassword){
    alert("Passwords do not match!");
    return;
  }
  alert(username);
  alert(password);


  userSignup(username, password)
    .then(results => {
      console.log('User inserted successfully: ', results);
    })
    .catch(error => {
      console.error('Error inserting user: ', error);
    })
});

