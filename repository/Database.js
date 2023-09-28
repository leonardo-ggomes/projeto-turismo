var mysql  = require('mysql');

var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : '',
  database : 'dbmvc'
});

function selectPersons(){
    const personList = []

    connection.connect();
 
    connection.query('SELECT * FROM PERSONAGENS', function (error, results, fields) {
      if (error) throw error;
      
      if(results){
        for(row in results){
            personList.push(results[row])
        }
      }

      return personList

    });
     
    connection.end();  
    
    // console.log(personList)
}

selectPersons()

