const Atrativo = require('../models/atrativoModel')
const Db = require('../../repository/Database')

class AtrativoDAO{

    #db

    constructor(){
        this.#db = Db
    }

    async consultarTodos(){

        let list_atrativos = []

        const query = await this.#db.selectAtrativos()

        for (let index = 0; index < query.length; index++) {

            const atrativo = new Atrativo()

            atrativo.id = query[index].id_atrativos
            atrativo.nome = query[index].nome_atrativo
            atrativo.latitude = query[index].lat_atrativo
            atrativo.longitude = query[index].long_atrativo
            atrativo.descricao = query[index].desc_atrativo
            atrativo.imagem = query[index].image_atrativo

            list_atrativos.push(atrativo.toJson())     
        }
       
        return list_atrativos
    }

}


module.exports = AtrativoDAO