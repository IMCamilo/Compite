package compite

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class DetalleAudRenController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond DetalleAudRen.list(params), model:[detalleAudRenCount: DetalleAudRen.count()]
    }

    def show(DetalleAudRen detalleAudRen) {
        respond detalleAudRen
    }

    def create() {
        respond new DetalleAudRen(params)
    }

    @Transactional
    def save(DetalleAudRen detalleAudRen) {
        if (detalleAudRen == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (detalleAudRen.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond detalleAudRen.errors, view:'index'
            return
        }

        detalleAudRen.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'detalleAudRen.label', default: 'DetalleAudRen'), detalleAudRen.id])
                redirect detalleAudRen
            }
            '*' { respond detalleAudRen, [status: CREATED] }
        }
    }

    def edit(DetalleAudRen detalleAudRen) {
        respond detalleAudRen
    }

    @Transactional
    def update(DetalleAudRen detalleAudRen) {
        if (detalleAudRen == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (detalleAudRen.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond detalleAudRen.errors, view:'edit'
            return
        }

        detalleAudRen.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'detalleAudRen.label', default: 'DetalleAudRen'), detalleAudRen.id])
                redirect detalleAudRen
            }
            '*'{ respond detalleAudRen, [status: OK] }
        }
    }

    @Transactional
    def delete(DetalleAudRen detalleAudRen) {

        if (detalleAudRen == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        detalleAudRen.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'detalleAudRen.label', default: 'DetalleAudRen'), detalleAudRen.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'detalleAudRen.label', default: 'DetalleAudRen'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
