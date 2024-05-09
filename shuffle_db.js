import mysql from 'mysql2'
import dotenv from 'dotenv'
dotenv.config()

// create a new MySQL connection
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
  return rows
}

const user = await getUsers(100)
console.log(user)
