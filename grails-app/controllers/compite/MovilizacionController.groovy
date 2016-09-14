package compite

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class MovilizacionController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        def userList = Usuario.findAll()
        def projectList = Proyecto.findAll()
        params.max = Math.min(max ?: 10, 100)
        respond Movilizacion.list(params), model:[movilizacionCount: Movilizacion.count(), usuarios:userList, proyectos:projectList]
    }

    def show(Movilizacion movilizacion) {
        respond movilizacion
    }

    def create() {
        respond new Movilizacion(params)
    }

    @Transactional
    def save() {
        String[] rutObtenido = ((String) params.nombreUsuario).split(" ・ ");
        String[] proyectoObtenido = ((String) params.nombreProyecto).split(" ・ ");
        def u = Usuario.findByRut(rutObtenido[1])
        params.usuario = u.id
        def p = Proyecto.findByCodigo(proyectoObtenido[1])
        params.proyecto = p.id

        def movilizacion = new Movilizacion(params)

        if (movilizacion == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (movilizacion.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond movilizacion.errors, view:'create'
            return
        }

        movilizacion.save flush:true, failOnError:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'movilizacion.label', default: 'Movilizacion'), movilizacion.id])
                redirect movilizacion
            }
            '*' { respond movilizacion, [status: CREATED] }
        }
    }

    def edit(Movilizacion movilizacion) {
        def usuario = Usuario.findById(movilizacion.usuarioId)
        def proyecto = Proyecto.findById(movilizacion.proyectoId)
        def userList = Usuario.findAll()
        def projectList = Proyecto.findAll()
        respond movilizacion, model:[usuarios:userList, proyectos:projectList, usuario:usuario, proyecto:proyecto]
    }

    @Transactional
    def update() {
        String[] rutObtenido = ((String) params.nombreUsuario).split(" ・ ");
        String[] proyectoObtenido = ((String) params.nombreProyecto).split(" ・ ");
        def u = Usuario.findByRut(rutObtenido[1])
        params.usuario = u.id
        def p = Proyecto.findByCodigo(proyectoObtenido[1])
        params.proyecto = p.id

        def movilizacion = Movilizacion.get(params.id)
        movilizacion.properties = params

        if (movilizacion == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (movilizacion.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond movilizacion.errors, view:'edit'
            return
        }

        movilizacion.save flush:true, failOnError:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'movilizacion.label', default: 'Movilizacion'), movilizacion.id])
                redirect movilizacion
            }
            '*'{ respond movilizacion, [status: OK] }
        }
    }

    @Transactional
    def delete(Movilizacion movilizacion) {

        if (movilizacion == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        movilizacion.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'movilizacion.label', default: 'Movilizacion'), movilizacion.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'movilizacion.label', default: 'Movilizacion'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
