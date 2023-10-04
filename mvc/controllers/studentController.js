const app = require('../../startup.js')
const studentModel = require('../models/studentModel.js')

app.get("/getAllStudents",(req, res) => {

    res.setHeader("Access-Control-Allow-Origin", "*")

    const studentsList = [] 

    for(let count = 5; count > 0; count--){
        const student = studentModel
        
        student.RA = 101
        student.Nome = "Leonardo"
        student.Hobbie = "Ver Filme"
        student.DtIngressoCurso = "10/08/2025"
        student.Curso = "Blockchain"

        studentsList.push(student.RegistroJSON())

    }

    res.json(studentsList)
})
    






