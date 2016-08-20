package compite

/**
 * Created by camilo on 16-08-16.
 */
class ProyectoController {

    def index = {
    }

    def create = {
        [empresas:Empresa.list()]
    }

    def save = {
        def proyecto = new Proyecto(params)
        proyecto.save flush:true, failOnError:true
        redirect action:"list"
    }

    def edit = {
        def proyecto = Proyecto.get(params.id)
        [proyecto:proyecto]
    }

    def update = {
        def proyecto = Proyecto.get(params.id)
        proyecto.properties = params
        proyecto.save flush: true, failOnError: true
        redirect action: "list"
    }

    def show = {
        def proyecto = Proyecto.get(params.id)
        [proyecto:proyecto]
    }

    def list = {
        def proyecto = Proyecto.list()
        [proyecto:proyecto]
    }

    def delete = {
        def proyecto = Proyecto.get(params.id)
        proyecto.delete flush: true, failOnError: true
        redirect action: "list"
    }

}
