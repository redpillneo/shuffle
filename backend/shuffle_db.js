const mysql = require("mysql2");
const dotenv = require("dotenv");

console.log(process.env);
dotenv.config()

const pool = mysql.createPool({
  host: process.env.MYSQL_HOST,
  user: process.env.MYSQL_USER,
  password: process.env.MYSQL_PASSWORD,
  database: process.env.MYSQL_DATABASE
}).promise()

// initial functions to get and post data from the shuffle_db MySQL database
// returns JSON formatted information, or inserts users (in signupUser() function) and return
// the ID

async function getUsers(){
  const [rows] = await pool.query("SELECT * FROM shuffle_users")
  return rows
}

async function getUserbyName(username){
  const [rows] = await pool.query(`
    SELECT user_ID 
    FROM shuffle_users
    where username = ?
  `, [username])
  return rows
}

// get user name by ID
async function getUsername(id){
  console.log("here")
  const [rows] = await pool.query(`
    SELECT username 
    FROM shuffle_users
    WHERE user_id = ?
    `, [id])
  return rows[0]
}

async function getUser(id){
  const [rows] = await pool.query(`
    SELECT * 
    FROM shuffle_users
    WHERE user_id = ?
    `, [id])
  return rows[0]
}

async function checkDuplicate(username){
  const [rows] = await pool.query(`
    SELECT user_ID
    FROM shuffle_users
    WHERE username = ?
  `, [username])
  if(rows[0]) {return true}
  else { return false}
}

async function checkPassword(password){
  if(password.length <= 8) return true
  else return false
}

async function signupUser(username, password){
  console.log("Hi")
  const hasDuplicate = await checkDuplicate(username)
  const validPassword = await checkPassword(password)
  if(!validPassword){
    console.error("Password too long, must be equal or less than 8 alpha-num characters")
    return { success: false, status: 400, error: "Password too long, must be equal or less than 8 alpha-num characters" }
  }
  if(!hasDuplicate){
    const [result] = await pool.query(`
    INSERT INTO 
    shuffle_users (username, password)
    VALUES (?, ?)`, [username, password])
    return { success: true, data: result.insertId }
  } else {
    console.error("username already used!")
    return { success: false, status: 409, error: "username already used!"}
  }
}

// make a function that returns true if such username with password exists
async function login(username, password){
  console.log("login function called")
  const [result] = await pool.query(`
    SELECT user_ID from shuffle_users
    where username = ? and
    password = ?
  `, [username, password])
  console.log(result[0])
  if(result[0]) {return result}
  else {
    return {success: false, error: "username does not exist"}
  }}



module.exports = { login, getUsers, getUser, checkDuplicate, checkPassword, signupUser };