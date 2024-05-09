dbtry();

const connection = require('./shuffle_db')
function dbtry(){

  connection.query("SELECT * from standard_cards where card_suite = 'Hearts'", (error, results, fields) => {
    if(error){
      console.error('Error executing SQL query: ', error);
    } else {
      console.log('Query results: ', results);
    }
  })

}


connection.end()