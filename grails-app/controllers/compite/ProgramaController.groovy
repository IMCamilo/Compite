package compite

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ProgramaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        //def programa= Programa.findAll()
        //def usuario= Usuario.executeQuery("p.id, p.fecha_inicio, p.fecha_fin, p.nombre, p.presupuesto, (select rut from usuario where id=a.usuario_id) from programa p, asignacion a where a.programa_id=p.id")
        //println "DAtos usuario" +usuario
        params.max = Math.min(max ?: 10, 100)
        respond Programa.list(params), model:[programaCount: Programa.count()]
    }

    def show(Programa programa) {
        respond programa
    }

    def create() {
        respond new Programa(params)
    }

    @Transactional
    def save(Programa programa) {
        if (programa == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (programa.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond programa.errors, view:'create'
            return
        }

        programa.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'programa.label', default: 'Programa'), programa.id])
                redirect programa
            }
            '*' { respond programa, [status: CREATED] }
        }
    }

    def edit(Programa programa) {
        respond programa
    }

    @Transactional
    def update(Programa programa) {
        if (programa == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (programa.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond programa.errors, view:'edit'
            return
        }

        programa.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'programa.label', default: 'Programa'), programa.id])
                redirect programa
            }
            '*'{ respond programa, [status: OK] }
        }
    }

    @Transactional
    def delete(Programa programa) {

        if (programa == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        programa.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'programa.label', default: 'Programa'), programa.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'programa.label', default: 'Programa'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
