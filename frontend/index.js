document.getElementById("signupButton").addEventListener("click", function() {
  window.location.href = 'signup.html';
});

document.getElementById("loginButton").addEventListener("click", function() {
  window.location.href = 'login.html';
});


async function getListOfCards() {
  const response = await fetch("http://localhost:8080/auth/signup", {
    method: "POST",
    body: JSON.stringify({
        "username": "juandelacruz2",
        "password": "12345678"
    }),
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