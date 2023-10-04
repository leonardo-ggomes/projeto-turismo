
const Student = {
    RA: "", 
    Nome: "",
    DtIngressoCurso: "",
    Curso: "",
    Hobbie: "",
    VerCarteirinha: function(){
        return "Carteirinha "+this.Nome +" RA: "+this.RA
    },
    RegistroJSON: function() {

        return {
            "RA": this.RA ,
            "Nome": this.RA,
            "DtIngressoCurso": this.DtIngressoCurso,
            "Curso": this.Curso,
            "Hobbie":this.Hobbie
        }
        
    }
}

module.exports = Student