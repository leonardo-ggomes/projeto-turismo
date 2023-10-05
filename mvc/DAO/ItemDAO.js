const Item = require('../models/ItemModel')
const Db = require('../../repository/Database')

class ItemDAO{

    #db

    constructor(){
        this.#db = Db
    }

    async consultarTodos(){

        let list_items = []

        const query = await this.#db.selectItems()

        for (let index = 0; index < query.length; index++) {

            const item = new Item()

            item.id = query[index].iteId
            item.descricao = query[index].iteDesc
            item.quantidade = query[index].iteQtde

            list_items.push(item.toJson())     
        }
       
        return list_items
    }

}


module.exports = ItemDAO