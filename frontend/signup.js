document.getElementById("confirmSignup").addEventListener("click", confirmSignup);

async function confirmSignup() {
  const username = document.getElementById("usernameInput").value;
  const password = document.getElementById("passInput").value;
  const confirmPassword = document.getElementById("confPassInput").value;

  // TODO: do checking of confirm password
  if(password !== confirmPassword){
    alert("Password do not match!")
    return
  }

  const payload = {
    username: username,
    password: password
  };
  console.log(payload)

  const response = await fetch("http://localhost:8080/auth/signup", {
    method: "POST",
    body: JSON.stringify(payload),
    headers: { "Content-Type": "application/json" }
  });
  
  const data = await response.json();
  console.log(data);

  if(response.ok) {
    console.log("Success!");
    window.location.href = 'home.html'
  } else {
    console.log("Error!" + data.error);
  }
}
// fetch("http://localhost:8080/shuffle", {
//   method: "POST",
//   body: JSON.stringify({
//     username: username,
//     password: password,
//   }),
//   headers: {
//       "Content-Type": "application/json"
//   }
// });
