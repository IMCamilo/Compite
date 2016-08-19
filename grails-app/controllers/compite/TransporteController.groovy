package compite

/**
 * Created by camilo on 16-08-16.
 */
class TransporteController {

    def index = {
    }

    def create = {
        def usuarios = Usuario.list()
        [usuarios:usuarios]
    }

    def save = {
        def transporte = new Transporte(params)
        transporte.save flush:true , failOnError:true
        redirect action: "show" , id:transporte.id
    }

    def edit = {
        def usuarios = Usuario.list()
        [usuarios:usuarios]
        def transporte = Transporte.get(params.id)
        [transporte: transporte]
    }

    def update = {
        def transporte = Transporte.get(params.id)
        transporte.properties = params
        transporte.save flush:true , failOnError:true
        redirect action: "show" , id:transporte.id
    }

    def show = {
        def transporte = Transporte.get(params.id)
        [transporte: transporte]
    }

    def list = {
        def transportes = Transporte.list()
        [transportes:transportes]
    }

    def delete = {
        def transporte = Transporte.get(params.id)
        transporte.delete flush:true , failOnError:true
        redirect action: "list" , id:transporte.id
    }

}
