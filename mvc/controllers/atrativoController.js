const AtrativoDAO = require('../DAO/atrativoDAO.js')
const path = require('path')

module.exports = (app) => {

    app.get("/atrativos", async (req, res) => {        
        const atrativoDAO = new AtrativoDAO()

        //Resolve problemas de cors
        res.setHeader("Access-Control-Allow-Origin","*")
        //Retorna no formato Json
        res.json(await atrativoDAO.consultarTodos())        
    })

    app.post("/atrativo", async (req, res) => {        
        const atrativoDAO = new AtrativoDAO()

        //Destructuring
        const {
            txtid: id,
            txtnomeatrat: nome,
            fileatrat: imagem,
            txtlatperson: latitude,
            txtlongperson: longitude,
            txtdescatrat: descricao
        } = req.body

      
        //Resolve problemas de cors
        res.setHeader("Access-Control-Allow-Origin","*")
        //Retorna no formato Json

        let status;

        if(!id){
            status = await atrativoDAO.cadastrar(nome, imagem, latitude, longitude, descricao)
        }
        else{
            status = await atrativoDAO.atualizar(id, nome, imagem, latitude, longitude, descricao)
        }   

       
        res.json({status})
    })

    app.delete("/atrativo/:id", async (req, res) => {
        res.setHeader("Access-Control-Allow-Origin","*")
        const atrativoDAO = new AtrativoDAO()

        const status = await atrativoDAO.apagar(req.params.id)

        res.json({
            status
        })
    })

    //:id é o parâmetro
    app.put("/atrativo/:id", async (req, res) =>{
        const atrativoDAO = new AtrativoDAO()
        
        const {
            nome,
            descricao,
            lat,
            long,
            imagem,
            id
        } = req.body;
      
        if(id == req.params.id){
          const r =  await atrativoDAO.atualizar(nome, descricao,lat, long, imagem, id)
          res.json({msg: "O total de linhas alteradas: "+r})
        }
        else{
          res.json({msg:"Problema."})
        }     

    })

    app.get("/pagina/listatrativos", (req, res) => {
       res.sendFile(path.resolve('mvc/views/ctrldev/atrativos/listatrativos.html')) 
    }) 

    app.get("/pagina/alteratrativo/:id", async (req, res) =>{
        
        const atrativo = new AtrativoDAO()        
        const r = await atrativo.consultarUm(req.params.id)
        res.render('atrativos/alteratrativos', { r })
    })

    app.get("/pagina/addatrativo", (req, res) => {
       res.sendFile(path.resolve('mvc/views/ctrldev/atrativos/addatrativos.html')) 
    })
        
}












