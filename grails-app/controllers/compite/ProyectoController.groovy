package compite

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ProyectoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        def listaEmpresas = Empresa.findAll()
        params.max = Math.min(max ?: 10, 100)
        respond Proyecto.list(params), model:[proyectoCount: Proyecto.count(), empresas:listaEmpresas]
    }

    def show(Proyecto proyecto) {
        respond proyecto
    }

    def create() {
        respond new Proyecto(params)
    }

    @Transactional
    def save() {
        String[] empresaObtenida = ((String) params.nombreEmpresa).split(" ・ ");
        params.empresa = empresaObtenida[1]

        def proyecto = new Proyecto(params)
        if (proyecto == null) {
            "Proyecto viene null"
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (proyecto.hasErrors()) {
            "Proyecto tiene errores"
            transactionStatus.setRollbackOnly()
            respond proyecto.errors, view:'index'
            return
        }

        proyecto.save flush:true, failOnError: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'proyecto.label', default: 'Proyecto'), proyecto.id])
                redirect proyecto
            }
            '*' { respond proyecto, [status: CREATED] }
        }
    }

    def edit(Proyecto proyecto) {
        def empresa = Empresa.findById(proyecto.empresaId)
        def listaEmpresas = Empresa.findAll()
        respond proyecto, model: [empresas: listaEmpresas, empresa: empresa]
    }

    @Transactional
    def update() {
        String[] empresaObtenida = ((String) params.nombreEmpresa).split(" ・ ");
        params.empresa = empresaObtenida[1]

        def proyecto = Proyecto.get(params.id)
        proyecto.properties = params

        if (proyecto == null) {
            println "Proyecto viene null"
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }


        if (proyecto.hasErrors()) {
            println "Proyecto tiene errores"
            transactionStatus.setRollbackOnly()
            respond proyecto.errors, view:'edit'
            return
        }

        proyecto.save flush:true, failOnError:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'proyecto.label', default: 'Proyecto'), proyecto.id])
                redirect proyecto
            }
            '*'{ respond proyecto, [status: OK] }
        }
    }

    @Transactional
    def delete(Proyecto proyecto) {

        if (proyecto == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        proyecto.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'proyecto.label', default: 'Proyecto'), proyecto.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'proyecto.label', default: 'Proyecto'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
