const mysql = require('mysql2')

class DatabaseMySql{

    #connection

    constructor(){
      this.#connection = mysql.createPool({
        database: 'bdgp',
        user:'root',
        password:'',
        host:'localhost'
      }).promise()
    }

    async selectAtrativos(){
      const query = await this.#connection.query('select * from atrativos')
      return query[0]
    }

    async insertAtrativo(param){
      const sql = `insert into atrativos (nome_atrativo, lat_atrativo, long_atrativo, desc_atrativo, image_atrativo)
       values ('${param.nome}','${param.latitude}','${param.longitude}','${param.descricao}','${param.imagem}')`
       
      const query = await this.#connection.execute(sql)
      return query[0]
    }   

    async deleteAtrativos(id){
      const sql = 'delete from atrativos where id_atrativos = '+id

      const res = await this.#connection.execute(sql)
      console.log(res)
      return res[0]
    }
    

}

module.exports = DatabaseMySql