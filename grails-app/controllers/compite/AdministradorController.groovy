package compite

import grails.transaction.Transactional

@Transactional(readOnly = true)
class AdministradorController {
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

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
        def projectList = Proyecto.findAll()
        respond Asignacion.list(params), model:[proyectos:projectList]

    }
}
