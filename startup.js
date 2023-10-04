//Este arquivo guarda as configurações do servidor
const express = require('express')
const app = express()

app.listen(3000, () => console.log("Online Server at port 3000"))
module.exports = app

const studentController = require('./mvc/controllers/studentController.js')


