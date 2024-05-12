document.getElementById("confirmSignup").addEventListener("click", confirmSignup);


async function confirmSignup() {
  const username = document.getElementById("usernameInput").value;
  const password = document.getElementById("passInput").value;
  const confirmPassword = document.getElementById("confPassInput").value;

  // TODO: do checking of confirm password

  const payload = {
    username: username,
    password: password
  };

  const response = await fetch("http://localhost:8080/auth/signup", {
    method: "POST",
    body: JSON.stringify(payload),
    headers: { "Content-Type": "application/json" }
  });
  
  const data = await response.json();
  console.log(data);

  if(response.ok) {
    console.log("Success!");
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
