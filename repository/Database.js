var mysql  = require('mysql2');

var connection = mysql.createPool({
  host     : 'localhost',
  user     : 'root',
  password : '',
  database : 'bdback'
}).promise();

async function selectItems(){
  const query = await connection.query('select * from item')
  return query[0]
}

module.exports = {
  selectItems
}

