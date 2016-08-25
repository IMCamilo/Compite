package compite

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class AuditoriaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Auditoria.list(params), model:[auditoriaCount: Auditoria.count()]
    }

    def show(Auditoria auditoria) {
        respond auditoria
    }

    def create() {
        respond new Auditoria(params)
    }

    @Transactional
    def save(Auditoria auditoria) {
        if (auditoria == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (auditoria.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond auditoria.errors, view:'create'
            return
        }

        auditoria.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'auditoria.label', default: 'Auditoria'), auditoria.id])
                redirect auditoria
            }
            '*' { respond auditoria, [status: CREATED] }
        }
    }

    def edit(Auditoria auditoria) {
        respond auditoria
    }

    @Transactional
    def update(Auditoria auditoria) {
        if (auditoria == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (auditoria.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond auditoria.errors, view:'edit'
            return
        }

        auditoria.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'auditoria.label', default: 'Auditoria'), auditoria.id])
                redirect auditoria
            }
            '*'{ respond auditoria, [status: OK] }
        }
    }

    @Transactional
    def delete(Auditoria auditoria) {

        if (auditoria == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        auditoria.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'auditoria.label', default: 'Auditoria'), auditoria.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'auditoria.label', default: 'Auditoria'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
