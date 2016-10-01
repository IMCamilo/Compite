package compite

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class AsignacionController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        def userList = Usuario.findAll()
        def programList = Programa.findAll()
        params.max = Math.min(max ?: 10, 100)
        respond Asignacion.list(params), model:[asignacionCount: Asignacion.count(), usuarios:userList, programas:programList]
    }

    def show(Asignacion asignacion) {
        def lista = Usuario.executeQuery("select nombres, paterno, materno from Usuario u where u.id = ?", [asignacion.usuarioId])
        def persona = lista[0]
        def nombres = persona [0]
        def paterno = persona [1]
        def materno = persona [2]

        def datosPrograma = Programa.executeQuery("select codigo, nombre from Programa p where p.id = ?", [asignacion.programaId])
        def programa = datosPrograma[0]
        def codigo = programa [0]
        def nombrePrograma = programa [1]
        respond asignacion, model: [nombreUsuario: nombres+" "+paterno+" "+materno, datosPrograma: codigo+" - "+nombrePrograma]
    }

    def create() {
        respond new Asignacion(params)
    }

    @Transactional
    def save() {
        def u = null
        def p = null
        try {
            String[] rutObtenido = ((String) params.nombreUsuario).split(" - ");
            String[] programaObtenido = ((String) params.nombrePrograma).split(" - ");
            u = Usuario.findByRut(rutObtenido[1])
            p = Programa.findById(programaObtenido[1])
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
        def programa = Programa.findById(asignacion.programaId)
        def userList = Usuario.findAll()
        def programList = Programa.findAll()
        respond asignacion, model:[usuarios:userList, programas:programList, usuario:usuario, programa:programa]
    }

    @Transactional
    def update() {
        String[] rutObtenido = ((String) params.nombreUsuario).split(" ・ ");
        String[] programaObtenido = ((String) params.nombrePrograma).split(" ・ ");
        def u = Usuario.findByRut(rutObtenido[1])
        params.usuario = u.id
        def p = Programa.findByCodigo(programaObtenido[0])
        params.programa = p.id

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
