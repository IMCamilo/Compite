package compite

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class RendicionController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Rendicion.list(params), model:[rendicionCount: Rendicion.count()]
    }

    def show(Rendicion rendicion) {
        respond rendicion
    }

    def create() {
        respond new Rendicion(params)
    }

    @Transactional
    def save(Rendicion rendicion) {
        if (rendicion == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (rendicion.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond rendicion.errors, view:'create'
            return
        }

        rendicion.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'rendicion.label', default: 'Rendicion'), rendicion.id])
                redirect rendicion
            }
            '*' { respond rendicion, [status: CREATED] }
        }
    }

    def edit(Rendicion rendicion) {
        respond rendicion
    }

    @Transactional
    def update(Rendicion rendicion) {
        if (rendicion == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (rendicion.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond rendicion.errors, view:'edit'
            return
        }

        rendicion.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'rendicion.label', default: 'Rendicion'), rendicion.id])
                redirect rendicion
            }
            '*'{ respond rendicion, [status: OK] }
        }
    }

    @Transactional
    def delete(Rendicion rendicion) {

        if (rendicion == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        rendicion.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'rendicion.label', default: 'Rendicion'), rendicion.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'rendicion.label', default: 'Rendicion'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
