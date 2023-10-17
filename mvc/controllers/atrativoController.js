const AtrativoDAO = require('../DAO/atrativoDAO.js')

module.exports = (app) => {

    app.get("/getAllAtrativos", async (req, res) => {        
        const atrativoDAO = new AtrativoDAO()

        //Resolve problemas de cors
        res.setHeader("Access-Control-Allow-Origin","*")
        //Retorna no formato Json
        res.json(await atrativoDAO.consultarTodos())        
    })
        
}








