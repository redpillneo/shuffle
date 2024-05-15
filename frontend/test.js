
username = "hellooooo";

async function getUsername(){
  const response = await fetch("http://localhost:8080/user")
}

document.getElementById('p1').innerHTML = username;