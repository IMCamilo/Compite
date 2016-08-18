package compite

/**
 * Created by camilo on 16-08-16.
 */
class EmpresaController {

    def index = {
    }

    def create = {
    }

    def save = {
        def empresa = new Empresa(params)
        empresa.save flush:true, failOnError:true
        redirect action:'show', id:empresa.id
    }

    def edit = {
        def empresa = Empresa.get(params.id)
        [empresa:empresa]
    }

    def update = {
        def empresa = Empresa.get(params.id)
        empresa.properties = params
        empresa.save flush: true, failOnError: true
        redirect action: "show", id:params.id
    }

    def show = {
        def empresa = Empresa.get(params.id)
        [empresa:empresa]
    }

    def list = {
        def empresas = Empresa.list()
        [empresas:empresas]
    }

    def delete = {
        def empresa = Empresa.get(params.id)
        empresa.delete flush: true, failOnError: true
        redirect action: "index"
    }

}