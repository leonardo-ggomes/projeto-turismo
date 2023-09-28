const Personagem = require('../models/PersonagemModel.js')

module.exports = (app) => {

    app.get("/getAllPersons",(req, res) => {

        res.json({
            "status":"OK"
        })
        
    })
        
}








