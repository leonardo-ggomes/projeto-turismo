class Item{

    #id
    #descricao
    #quantidade

    constructor(id, descricao, quantidade){
        this.#id = id 
        this.#descricao = descricao 
        this.#quantidade = quantidade
    }

    get id(){
        return this.#id
    }

    set id(value){
        this.#id = value
    }

    get descricao(){
        return this.#descricao
    }

    set descricao(value){
        this.#descricao = value
    }
    
    get quantidade(){
        return this.#quantidade
    }

    set quantidade(value){
        this.#quantidade = value
    }

    toJson(){

        return {
            "id": this.#id,
            "descricao": this.#descricao,
            "quantidade": this.#quantidade
        }
      
    }
    
}

module.exports = Item