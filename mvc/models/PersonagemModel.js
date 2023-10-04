class Personagem{
    nome
    poder
    genero
    tamanho
    profissao
    
    constructor(nome,poder,genero){
        this.nome=nome
        this.poder=poder
        this.genero=genero
    }

    andar(){
        console.log("o personagem andou!")
    }
    
    correr(){
        console.log("o personagem correu!")
    }

    pegarInformacoes(){
        return {
            "nome": this.nome,
            "poder": this.poder,
            "genero":this.genero,
            "tamanho":this.tamanho,
            "profissao":this.profissao
        }
    }
}

module.exports = Personagem
