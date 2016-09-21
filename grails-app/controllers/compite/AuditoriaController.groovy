package compite

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class AuditoriaController {

    static final String FILES_PATH = '/home/cjorquera/Documentos/compite/archivos/'

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        def userList = Usuario.findAll()
        def projectList = Proyecto.findAll()
        params.max = Math.min(max ?: 10, 100)
        respond Auditoria.list(params), model:[auditoriaCount: Auditoria.count(), usuarios:userList, proyectos:projectList]
    }

    def show(Auditoria auditoria) {
        def archivos = Archivo.findByEntidadAndEntidadId("auditoria",auditoria.id)
        respond auditoria, model:[archivos:archivos]
    }

    def create() {
        respond new Auditoria(params)
    }

    @Transactional
    def save() {

        String[] rutObtenido = ((String) params.nombreUsuario).split(" ・ ");
        String[] proyectoObtenido = ((String) params.nombreProyecto).split(" ・ ");
        def u = Usuario.findByRut(rutObtenido[1])
        params.usuario = u.id
        def p = Proyecto.findByCodigo(proyectoObtenido[0])
        params.proyecto = p.id

        def auditoria = new Auditoria(params)

        if (auditoria == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (auditoria.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond auditoria.errors, view:'index'
            return
        }

        auditoria.save flush:true, failOnError: true

        //carga archivos
        def f = request.getFile('archivo')
        String filePath = FILES_PATH + f?.filename
        f.transferTo(new File(filePath))
        Archivo archivo = new Archivo(nombre: f?.filename, ruta: filePath, entidad: 'auditoria', entidadId: auditoria.id, creadoPor:session.usuarioLogueado.rut).save(flush: true)
        assert archivo.id
        //

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'auditoria.label', default: 'Auditoria'), auditoria.id])
                redirect auditoria
            }
            '*' { respond auditoria, [status: CREATED] }
        }
    }

    def edit(Auditoria auditoria) {
        def usuario = Usuario.findById(auditoria.usuarioId)
        def proyecto = Proyecto.findById(auditoria.proyectoId)
        def userList = Usuario.findAll()
        def projectList = Proyecto.findAll()
        respond auditoria, model:[usuarios:userList, proyectos:projectList, usuario:usuario, proyecto:proyecto]
    }

    @Transactional
    def update() {
        String[] rutObtenido = ((String) params.nombreUsuario).split(" ・ ");
        String[] proyectoObtenido = ((String) params.nombreProyecto).split(" ・ ");
        def u = Usuario.findByRut(rutObtenido[1])
        params.usuario = u.id
        def p = Proyecto.findByCodigo(proyectoObtenido[0])
        params.proyecto = p.id

        def auditoria = Auditoria.get(params.id)

        auditoria.properties = params
        if (auditoria == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (auditoria.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond auditoria.errors, view:'edit'
            return
        }

        auditoria.save flush:true, failOnError: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'auditoria.label', default: 'Auditoria'), auditoria.id])
                redirect auditoria
            }
            '*'{ respond auditoria, [status: OK] }
        }
    }

    @Transactional
    def delete(Auditoria auditoria) {

        if (auditoria == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        auditoria.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'auditoria.label', default: 'Auditoria'), auditoria.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'auditoria.label', default: 'Auditoria'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
