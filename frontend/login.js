document.getElementById("confirmLogin").addEventListener("click", confirmLogin);

async function confirmLogin() {
  console.log("in login.js")
  const username = document.getElementById("usernameInput").value;
  const password = document.getElementById("passInput").value;
  // TODO: login if the username exists and the password also for that username exists
  // check if such username exists

  // TODO: do checking of confirm password

  const payload = {
    username: username,
    password: password
  };
  console.log(payload)

  const response = await fetch("http://localhost:8080/auth/login", {
    method: "POST",
    body: JSON.stringify(payload),
    headers: { "Content-Type": "application/json" }
  });
  
  const data = await response.json();
  console.log(data);

  if(data){
    window.location.href = 'home.html'
  } else {
    console.log("Check username or password!")
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
