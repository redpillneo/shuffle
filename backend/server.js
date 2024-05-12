const express = require("express");
const { getUser, getUsers, signupUser } = require("./shuffle_db.js");

const app = express()

app.use(express.json())

app.get("/shuffle", (req, res) => {
  res.send("this should be the notes")
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
    res.status(result.status || 500).send(result);
  }
});

app.listen(8080, () => {
  console.log('Server is running on port 8080 hshs')
})