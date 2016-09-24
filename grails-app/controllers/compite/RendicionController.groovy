package compite

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class RendicionController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        def userList = Usuario.findAll()
        def projectList = Programa.findAll()
        params.max = Math.min(max ?: 10, 100)
        respond Rendicion.list(params), model:[rendicionCount: Rendicion.count(), usuarios:userList, programas:projectList]
    }

    def show(Rendicion rendicion) {
        respond rendicion
    }

    def create() {
        respond new Rendicion(params)
    }

    @Transactional
    def save() {
        def u = null
        def p = null
        try {
            String[] rutObtenido = ((String) params.nombreUsuario).split(" ・ ");
            String[] programaObtenido = ((String) params.nombrePrograma).split(" ・ ");
            u = Usuario.findByRut(rutObtenido[1])
            p = Programa.findByCodigo(programaObtenido[0])
        } catch (Exception e) {
            println "validando asignación. "+e.getMessage()
        }
        if (!u && !p) {
            flash.message = "Debes seleccionar un usuario y un programa para esta asignación"
            redirect(controller: "asignacion", action: "index")
            return
        } else if (!u){
            flash.message = "Debes seleccionar un usuario para esta asignación"
            redirect(controller: "asignacion", action: "index")
            return
        } else {
            flash.message = "Debes seleccionar un programa para esta asignación"
            redirect(controller: "asignacion", action: "index")
            return
        }
        params.usuario = u.id
        params.programa = p.id

        def rendicion = new Rendicion(params)

        if (rendicion == null) {
            println "Rendicion es null, no se puede guardar"
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (rendicion.hasErrors()) {
            println "Rendicion tiene errores, no se puede guardar"
            println "Esto es rendicion: "+rendicion
            transactionStatus.setRollbackOnly()
            respond rendicion.errors, view:'index'
            return
        }

        rendicion.save flush:true, failOnError:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'rendicion.label', default: 'Rendicion'), rendicion.id])
                redirect rendicion
            }
            '*' { respond rendicion, [status: CREATED] }
        }
    }

    def edit(Rendicion rendicion) {
        def usuario = Usuario.findById(rendicion.usuarioId)
        def programa = Programa.findById(rendicion.programaId)
        def userList = Usuario.findAll()
        def projectList = Programa.findAll()
        respond rendicion, model:[usuarios:userList, programas:projectList, usuario:usuario, programa:programa]
    }

    @Transactional
    def update() {
        String[] rutObtenido = ((String) params.nombreUsuario).split(" ・ ");
        String[] programaObtenido = ((String) params.nombrePrograma).split(" ・ ");
        def u = Usuario.findByRut(rutObtenido[1])
        params.usuario = u.id
        def p = Programa.findByCodigo(programaObtenido[0])
        params.programa = p.id

        def rendicion = Rendicion.get(params.id)
        rendicion.properties = params

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

        rendicion.save flush:true, failOnError:true

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
