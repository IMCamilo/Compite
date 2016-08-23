package compite

/**
 * Created by camilo on 16-08-16.
 */
class AsignacionController {

    def index = {
        redirect action: "list"
    }

    def create = {
        [usuarios:Usuario.list(), proyectos:Proyecto.list()]
    }

    def save = {
        def asignacion = new Asignacion(params)
        asignacion.save flush: true, failOnError: true
        redirect action: "show", id:asignacion.id
    }

    def edit = {
        def asignacion = Asignacion.get(params.id)
        [asignacion:asignacion]
    }

    def update = {
        def asignacion = Asignacion.get(params.id)
        asignacion.properties = params
        asignacion.save flush: true, failOnError: true
        redirect action: "show", id:params.id
    }

    def show = {
        def asignacion = Asignacion.get(params.id)
        [asignacion:asignacion]
    }

    def list = {
        [asignaciones:Asignacion.list()]
    }

    def delete = {
        def asignacion = Asignacion.get(params.id)
        asignacion.delete flush: true, failOnError: true
        redirect action: "index"
    }

}
