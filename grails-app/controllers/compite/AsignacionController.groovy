package compite

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class AsignacionController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Asignacion.list(params), model:[asignacionCount: Asignacion.count()]
    }

    def show(Asignacion asignacion) {
        respond asignacion
    }

    def create() {
        respond new Asignacion(params)
    }

    @Transactional
    def save(Asignacion asignacion) {
        if (asignacion == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (asignacion.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond asignacion.errors, view:'create'
            return
        }

        asignacion.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'asignacion.label', default: 'Asignacion'), asignacion.id])
                redirect asignacion
            }
            '*' { respond asignacion, [status: CREATED] }
        }
    }

    def edit(Asignacion asignacion) {
        respond asignacion
    }

    @Transactional
    def update(Asignacion asignacion) {
        if (asignacion == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (asignacion.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond asignacion.errors, view:'edit'
            return
        }

        asignacion.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'asignacion.label', default: 'Asignacion'), asignacion.id])
                redirect asignacion
            }
            '*'{ respond asignacion, [status: OK] }
        }
    }

    @Transactional
    def delete(Asignacion asignacion) {

        if (asignacion == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        asignacion.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'asignacion.label', default: 'Asignacion'), asignacion.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'asignacion.label', default: 'Asignacion'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
