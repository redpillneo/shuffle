const express = require("express");
const { login, getUser, getUsers, signupUser, getUsername } = require("./shuffle_db.js");

const app = express()

app.use(express.json())

app.get("/shuffle/:id", (req, res) => {
  const id = req.params.id
  res.send(id)
})

// app.get("/user", (req, res) => {
//   // return the user
// })

// get username by user ID
app.get("/user/:id", async (req, res) => {
  const userID = req.params.id
  console.log(userID)
  const username = await getUsername(userID)
  res.send(userID)
  // const username = getUsername()
  // res.send(username)
  // const userID = req.body;
  // const result = await getUsername(userID);
  if(result.success) {
    console.log(result)
  } else {
    console.error("something broke in fetching username")
  }

})
app.use((err, req, res, next) => {
  console.error(err.stack)
  res.status(500).send('Something broke!')
})

// app listener for post
app.post("/shuffle", async (req, res) => {
  const {username, password} = req.body
  const result = await signupUser(username, password)

  if(result.success) {
    res.status(201).send(result)
  } else {
    console.log(result.status);
    res.status(result.status || 500).send(result);
  }
  
})

app.get("/test", (req, res) => {
  res.send({ message: "Hello world" });
})

app.post("/auth/signup", async (req, res) => {
  const { username, password } = req.body;
  const result = await signupUser(username, password);

  if(result.success) {
    res.status(201).send(result)
  } else {
    console.log(result.status);
    alert("username already used")
    res.status(result.status || 500).send(result);
  }
});

app.post("/auth/login", async (req, res) => {
  console.log("inside signup")
  const {username, password} = req.body;
  const [result] = await login(username, password);

  if(result.success) {
    res.status(201).send(result)
  } else {
    console.log(result.status);
    res.status(result.status || 500).send(result);
  }
});

// post the configuration of the training session
app.post("/createSession", async (req, res) => {
  const {deck_no, card_no, time_mode, recall_mode} = req.body
  console.log(deck_no)
  console.log(card_no)
  console.log(time_mode)
  console.log(recall_mode)
});

app.listen(8080, () => {
  console.log('Server is running on port 8080 hshs')
})