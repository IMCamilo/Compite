package compite

class AdministradorController {

    def index = {
        redirect(action: "proyectos")
    }

    def proyectos = {
        println "Listando todos los Proyectos"
        redirect(controller: "proyecto", action: "index")
    }

    def administrar = {
        //si no tiene nada, simplemente carga la vista index.gsp
    }

    def reportes = {
        //si no tiene nada, simplemente carga la vista index.gsp
    }
}
