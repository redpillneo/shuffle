import mysql from 'mysql2'
import dotenv from 'dotenv'
dotenv.config()

const pool = mysql.createPool({
  host: process.env.MYSQL_HOST,
  user: process.env.MYSQL_USER,
  password: process.env.MYSQL_PASSWORD,
  database: process.env.MYSQL_DATABASE
}).promise()

async function getUsers(){
  const [rows] = await pool.query("SELECT * FROM shuffle_users")
  return rows
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
  const hasDuplicate = await checkDuplicate(username)
  const validPassword = await checkPassword(password)
  if(!validPassword){
    console.error("Password too long, must be equal or less than 8 alpha-num characters")
    return
  }
  if(!hasDuplicate){
    const [result] = await pool.query(`
    INSERT INTO 
    shuffle_users (username, password)
    VALUES (?, ?)`, [username, password])
    return result.insertId
  } else {
    console.error("username already used!")
  }
}

const result = await signupUser("joenne", "hehehe")
console.log(result)

