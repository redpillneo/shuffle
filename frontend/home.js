// // // when I click into the progress html it will redirect into that
// document.getElementById('userplaceholder').innerHTML = "hahaha";
// // // click to start new session and it will redirect into that\
// const userID = 1;
// // get the username based on the userID
// const username = getUsername(userID);
// console.log(getUsername)

// function for getting the username with fetch
// async function getUsername(id) {
//   const response = await fetch("http://localhost:8080/user/:id", {
//   })
//   return response
// }


// get the username of the user given the userID

document.getElementById("progressButton").addEventListener("click", function() {
  window.location.href = 'progress.html';
});

document.getElementById("createSessionButton").addEventListener("click", function() {
  window.location.href = 'config.html';
});

// // logout when the user clicked on the logout
// document.getElementById("logout").addEventListener("click", function() {
//   console.log("it's working bitch")
// })


o
