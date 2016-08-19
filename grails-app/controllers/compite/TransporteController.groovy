package compite

/**
 * Created by camilo on 16-08-16.
 */
class TransporteController {

    def index = {

    }

    def create = {
        def transporte = Transporte.list()
        [transporte:transporte]

    }

    def save = {
        def transporte = new Transporte(params)
        transporte.save flush:true , failOnError:true
        redirect action: show , id:transporte.id
    }

    def edit = {
        def transporte = Transporte.get(params.id)
        [transporte: transporte]
    }

    def update = {
        def transporte = new Transporte(params)
        transporte.properties = params
        transporte.save flush:true , failOnError:true
        redirect action: show , id:transporte.id
    }

    def show = {
        def transporte = Transporte.get(params.id)
        [transporte: transporte]

    }

    def list = {
        def transporte = Transporte.list()
        [transporte:transporte]
    }

    def delete = {
        def transporte = new Transporte(params)
        transporte.properties = params
        transporte.delete flush:true , failOnError:true
        redirect action: show , id:transporte.id
    }

}
