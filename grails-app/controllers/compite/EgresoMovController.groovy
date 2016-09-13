package compite

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class EgresoMovController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond EgresoMov.list(params), model:[egresoMovCount: EgresoMov.count()]
    }

    def show(EgresoMov egresoMov) {
        respond egresoMov
    }

    def create() {
        respond new EgresoMov(params)
    }

    @Transactional
    def save(EgresoMov egresoMov) {
        if (egresoMov == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (egresoMov.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond egresoMov.errors, view:'create'
            return
        }

        egresoMov.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'egresoMov.label', default: 'EgresoMov'), egresoMov.id])
                redirect egresoMov
            }
            '*' { respond egresoMov, [status: CREATED] }
        }
    }

    def edit(EgresoMov egresoMov) {
        respond egresoMov
    }

    @Transactional
    def update(EgresoMov egresoMov) {
        if (egresoMov == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (egresoMov.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond egresoMov.errors, view:'edit'
            return
        }

        egresoMov.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'egresoMov.label', default: 'EgresoMov'), egresoMov.id])
                redirect egresoMov
            }
            '*'{ respond egresoMov, [status: OK] }
        }
    }

    @Transactional
    def delete(EgresoMov egresoMov) {

        if (egresoMov == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        egresoMov.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'egresoMov.label', default: 'EgresoMov'), egresoMov.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'egresoMov.label', default: 'EgresoMov'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
