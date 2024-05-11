const username = "natnat4"  
const password = "natnat3"

fetch("http://localhost:8080/shuffle", {
  method: "POST",
  body: JSON.stringify({
    username: username,
    password: password,
  }),
  headers: {
    "Content-type": "text/plain"
  },
  "mode":"no-cors"
});
