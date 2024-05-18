const express = require("express");
const { login, getUser, getUsers, signupUser, getUsername } = require("./shuffle_db.js");

const app = express()

app.use(express.json())

// get username by user ID
app.use((err, req, res, next) => {
  console.error(err.stack)
  res.status(500).send('Something broke!')
})

// app listener for post

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
app.post("/createConfig", async (req, res) => {
  const trainingSessionData = req.body
  res.status(200).json({message: 'Session created successfully', data: trainingSessionData});
});

app.get("/getConfig", async (req, res) => {
  res.status(200).json(trainingSessionData)
})

app.listen(8080, () => {
  console.log('Server is running on port 8080 hshs')
})