package compite

/**
 * Created by camilo on 16-08-16.
 */
class EgresoController {

    def index = {

    }

    def create = {
        def usuarios = Usuario.list()
        [usuarios:usuarios]
    }

    def save = {
        def egreso = new Egreso(params)
        egreso.save flush:true, failOnError:true
        redirect action:"show", id:egreso.id
    }

    def edit = {
        def egreso = Egreso.get(params.id)
        [egreso:egreso]
    }

    def update = {
        def egreso = Egreso.get(params.id)
        egreso.properties = params
        egreso.save flush:true, failOnError: true
        redirect action:"show", id:params.id
    }

    def show = {
        def egreso = Egreso.get(params.id)
        [egreso:egreso]
    }

    def list = {
        def egresos = Egreso.list()
        [egresos:egresos]
    }

    def delete = {
        def egreso = Egreso.get(params.id)
        egreso.delete flush: true, failOnError: true
        redirect action:"index"
    }

}
