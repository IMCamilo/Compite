package compite

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class AsignacionController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        def userList = Usuario.findAll()
        def projectList = Proyecto.findAll()
        params.max = Math.min(max ?: 10, 100)
        respond Asignacion.list(params), model:[asignacionCount: Asignacion.count(), usuarios:userList, proyectos:projectList]
    }

    def show(Asignacion asignacion) {
        respond asignacion
    }

    def create() {
        respond new Asignacion(params)
    }

    @Transactional
    def save() {
        //estoy haciendo esto a mano, hasta encontrar un plugin o mejorar el uso de typeahead en grails.
        //lo cual parece esta en bastante desarrollado, sin embargo no hay tiempo para investigarlo
        String[] rutObtenido = ((String) params.nombreUsuario).split(" , ");
        String[] proyectoObtenido = ((String) params.nombreProyecto).split(" , ");
        println "rutObtenido: $rutObtenido, proyecto: $proyectoObtenido"
        println "rut unico: -${rutObtenido[1]}-"
        println "rut unico: -${proyectoObtenido[0]}-"
        def u = Usuario.findByRut(rutObtenido[1])
        params.usuario = u.id
        def p = Proyecto.findByCodigo(proyectoObtenido[0])
        params.proyecto = p.id

        println "id de usuario : $params.usuario, id de proyecto : $params.proyecto"

        def asignacion = new Asignacion(params)
        if (asignacion == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (asignacion.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond asignacion.errors, view:'index'
            return
        }

        asignacion.save flush: true, failOnError: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'asignacion.label', default: 'Asignacion'), asignacion.id])
                redirect asignacion
            }
            '*' { respond asignacion, [status: CREATED] }
        }
    }

    def edit(Asignacion asignacion) {
        def usuario = Usuario.findById(asignacion.usuarioId)
        def proyecto = Proyecto.findById(asignacion.proyectoId)
        def userList = Usuario.findAll()
        def projectList = Proyecto.findAll()
        respond asignacion, model:[usuarios:userList, proyectos:projectList, usuario:usuario, proyecto:proyecto]
    }

    @Transactional
    def update() {
        String[] rutObtenido = ((String) params.nombreUsuario).split(" , ");
        String[] proyectoObtenido = ((String) params.nombreProyecto).split(" , ");
        println "rutObtenido: $rutObtenido, proyecto: $proyectoObtenido"
        println "rut unico: -${rutObtenido[1]}-"
        println "rut unico: -${proyectoObtenido[0]}-"
        def u = Usuario.findByRut(rutObtenido[1])
        params.usuario = u.id
        def p = Proyecto.findByCodigo(proyectoObtenido[0])
        params.proyecto = p.id

        println "id de usuario : $params.usuario, id de proyecto : $params.proyecto"

        def asignacion = Asignacion.get(params.id)
        asignacion.properties = params

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

        asignacion.save flush: true, failOnError: true

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
