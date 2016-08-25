package compite

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TransporteController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Transporte.list(params), model:[transporteCount: Transporte.count()]
    }

    def show(Transporte transporte) {
        respond transporte
    }

    def create() {
        respond new Transporte(params)
    }

    @Transactional
    def save(Transporte transporte) {
        if (transporte == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (transporte.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond transporte.errors, view:'create'
            return
        }

        transporte.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'transporte.label', default: 'Transporte'), transporte.id])
                redirect transporte
            }
            '*' { respond transporte, [status: CREATED] }
        }
    }

    def edit(Transporte transporte) {
        respond transporte
    }

    @Transactional
    def update(Transporte transporte) {
        if (transporte == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (transporte.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond transporte.errors, view:'edit'
            return
        }

        transporte.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'transporte.label', default: 'Transporte'), transporte.id])
                redirect transporte
            }
            '*'{ respond transporte, [status: OK] }
        }
    }

    @Transactional
    def delete(Transporte transporte) {

        if (transporte == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        transporte.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'transporte.label', default: 'Transporte'), transporte.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'transporte.label', default: 'Transporte'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
