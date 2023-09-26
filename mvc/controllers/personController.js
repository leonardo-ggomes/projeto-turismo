const app = require('../../startup.js')
const Personagem = require('../models/PersonagemModel.js')

app.get("/getAllPersons",(req, res) => {
    res.setHeader("Access-Control-Allow-Origin", "*")

    const pokemon = new Personagem("Charmander","Fogo","Masculino")
    const powerRanger = new Personagem("Preto","Mamute","Masculino")
    const cavaleiroZodiaco1 = new Personagem("Seya","Meteoro","Não Binário")
    const cavaleiroZodiaco2 = new Personagem("Shiryu","Dragão","Masculino")

    res.json([
        pokemon.pegarInformacoes(),
        powerRanger.pegarInformacoes(),
        cavaleiroZodiaco1.pegarInformacoes(),
        cavaleiroZodiaco2.pegarInformacoes()
    ])
})
    






