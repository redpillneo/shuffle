
try {
  fetch('http://localhost:8080/shuffle', {
    method: 'POST', // Specify the HTTP method
    body:  {
      username: username,
      password: password
    }
  })
    .then(response => response.text()) // Read response as text
    .then(data => alert(data)); // Alert the response
} catch (error) {
  console.log('An error occurred!');
}

const username = "username1"
const password = "password1"
   