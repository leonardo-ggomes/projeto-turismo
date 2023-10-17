var mysql  = require('mysql2');

var connection = mysql.createPool({
  host     : 'localhost',
  user     : 'root',
  password : '',
  database : 'bdgp'
}).promise();

async function selectAtrativos(){
  const query = await connection.query('select * from atrativos')
  return query[0]
}

module.exports = {
  selectAtrativos
}

