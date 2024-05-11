import express from 'express'
const app = express()

app.use(express.json())

import {getUser, getUsers, signupUser} from './shuffle_db.js'


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
  res.status(201).send(result)
})

app.listen(8080, () => {
  console.log('Server is running on port 8080 hshs')
})