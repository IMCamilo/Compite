package compite

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class EgresoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        def userList = Usuario.findAll()
        def projectList = Proyecto.findAll()
        params.max = Math.min(max ?: 10, 100)
        respond Egreso.list(params), model:[egresoCount: Egreso.count(), usuarios:userList, proyectos:projectList]
    }

    def show(Egreso egreso) {
        respond egreso
    }

    def create() {
        respond new Egreso(params)
    }

    @Transactional
    def save() {
        String[] rutObtenido = ((String) params.nombreUsuario).split(" , ");
        String[] proyectoObtenido = ((String) params.nombreProyecto).split(" , ");
        def u = Usuario.findByRut(rutObtenido[1])
        params.usuario = u.id
        def p = Proyecto.findByCodigo(proyectoObtenido[0])
        params.proyecto = p.id
        def egreso = new Egreso(params)

        if (egreso == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (egreso.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond egreso.errors, view:'index'
            return
        }

        egreso.save flush:true, failOnError: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'egreso.label', default: 'Egreso'), egreso.id])
                redirect egreso
            }
            '*' { respond egreso, [status: CREATED] }
        }
    }

    def edit(Egreso egreso) {
        def usuario = Usuario.findById(egreso.usuarioId)
        def proyecto = Proyecto.findById(egreso.proyectoId)
        def userList = Usuario.findAll()
        def projectList = Proyecto.findAll()
        respond egreso, model:[usuarios:userList, proyectos:projectList, usuario:usuario, proyecto:proyecto]
    }

    @Transactional
    def update() {
        String[] rutObtenido = ((String) params.nombreUsuario).split(" , ");
        String[] proyectoObtenido = ((String) params.nombreProyecto).split(" , ");
        def u = Usuario.findByRut(rutObtenido[1])
        params.usuario = u.id
        def p = Proyecto.findByCodigo(proyectoObtenido[0])
        params.proyecto = p.id

        def egreso = Egreso.get(params.id)
        egreso.properties = params

        if (egreso == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (egreso.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond egreso.errors, view:'edit'
            return
        }

        egreso.save flush:true, failOnError: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'egreso.label', default: 'Egreso'), egreso.id])
                redirect egreso
            }
            '*'{ respond egreso, [status: OK] }
        }
    }

    @Transactional
    def delete(Egreso egreso) {

        if (egreso == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        egreso.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'egreso.label', default: 'Egreso'), egreso.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'egreso.label', default: 'Egreso'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
