//Este arquivo guarda as configurações do servidor
const express = require('express')
const app = express()
const consign = require('consign')

app.set('view engine','ejs')
app.set('views','mvc/views/ctrldev')

app.use(express.static('mvc/views/public'))

app.use(express.urlencoded({extended: true}))
app.use(express.json())

//Faz a injeção de arquivos dentro do aplicativo
consign()
    .include('mvc/controllers')
    .into(app)


app.listen(3000, () => console.log("Online Server at port 3000"))
module.exports = app


