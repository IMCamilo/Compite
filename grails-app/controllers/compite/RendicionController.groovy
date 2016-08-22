package compite

/**
 * Created by camilo on 16-08-16.
 */
class RendicionController {

    def index = {
    }

    def create = {
        [proyectos:Proyecto.list(), usuarios:Usuario.list()]
    }

    def save = {
        def rendicion = new Rendicion(params)
        rendicion.save flush:true, failOnError:true
        redirect action:"list"
    }

    def edit = {
        def rendicion = Rendicion.get(params.id)
        [proyectos:Proyecto.list(), usuarios:Usuario.list(), rendicion:rendicion]
    }

    def update = {
        def rendicion = Rendicion.get(params.id)
        rendicion.properties = params
        rendicion.save flush:true, failOnError:true
        redirect action:"list"
    }

    def show = {
        [rendicion: Rendicion.get(params.id)]
    }

    def list = {
        [rendiciones: Rendicion.list()]
    }

    def delete = {
        def rendicion = Rendicion.get(params.id)
        rendicion.delete flush:true, failOnError:true
        redirect action:"list"
    }

}
