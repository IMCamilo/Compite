package compite

/**
 * Created by camilo on 16-08-16.
 */
class AuditoriaController {

    def index = {

    }

    def create = {
        def usuarios = Usuario.list()
        [usuarios:usuarios]
    }

    def save = {
        def auditoria = new Auditoria(params)
        auditoria.save flush:true, failOnError:true
        //redirect action: "show", id:auditoria.id
        redirect action: "list"
    }

    def edit = {
        def auditoria = Auditoria.get(params.id)
        [auditoria:auditoria]
    }

    def update = {
        def auditoria = Auditoria.get(params.id)
        auditoria.properties = params
        auditoria.save flush:true, failOnError:true
        redirect action:"show", id:params.id
    }

    def show = {
        def auditoria = Auditoria.get(params.id)
        [auditoria: auditoria]
    }

    def list = {
        def auditorias = Auditoria.list()
        [auditorias: auditorias]
    }

    def delete = {
        def auditoria = Auditoria.get(params.id)
        auditoria.delete flush: true, failOnError: true
        //redirect action: "index"
        redirect action: "list"
    }

}