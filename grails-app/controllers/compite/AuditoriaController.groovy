package compite

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.core.GrailsApplication

@Transactional(readOnly = true)
class AuditoriaController {

    GrailsApplication grailsApplication

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        def userList = Usuario.findAll()
        def projectList = Programa.findAll()
        params.max = Math.min(max ?: 10, 100)
        respond Auditoria.list(params), model:[auditoriaCount: Auditoria.count(), usuarios:userList, programas:projectList]
    }

    def show(Auditoria auditoria) {
        def listaArchivos = Archivo.findAllByEntidadAndEntidadId("auditoria",auditoria.id)
        respond auditoria, model:[archivos:listaArchivos]
    }

    def create() {
        respond new Auditoria(params)
    }


    @Transactional
    def save() {
        def p = null
        try {
            String[] programaObtenido = ((String) params.nombrePrograma).split(" - ");
            p = Programa.findByCodigo(programaObtenido[0])
        } catch (Exception e) {
            println "validando asignación. "+e.getMessage()
        }
        if (!p) {
            flash.message = "Debes seleccionar un programa para esta auditoria"
            redirect(controller: "auditoria", action: "index")
            return
        }

        def buscaUsuarioPrograma = Asignacion.executeQuery("select a.usuario from Asignacion as a where a.programa="+p.id)
        def usuario = buscaUsuarioPrograma[0]
        params.usuario = usuario.id
        params.programa = p.id

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
        /*def f = request.getFile('archivo')
        if (!f.empty) {
            String filePath = grailsApplication.config.getProperty('rutaArchivos.carpeta.absoluta') + f?.filename
            f.transferTo(new File(filePath))
            Archivo archivo = new Archivo(nombre: f?.filename, ruta: filePath, entidad: 'auditoria', entidadId: auditoria.id, creadoPor:session.usuarioLogueado.rut).save(flush: true)
            assert archivo.id
        }*/
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
        def programa = Programa.findById(auditoria.programaId)
        def userList = Usuario.findAll()
        def projectList = Programa.findAll()
        respond auditoria, model:[usuarios:userList, programas:projectList, usuario:usuario, programa:programa]
    }

    @Transactional
    def update() {
        String[] programaObtenido = ((String) params.nombrePrograma).split(" - ");
        def p = Programa.findByCodigo(programaObtenido[0])
        params.programa = p.id

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
    //carga archivos en accion separada.
    @Transactional
    def upload() {
        println "auditoria id > "+params.idAuditoria
        def f = request.getFile('archivo')
        if (f.empty) {
            flash.message = "Debes seleccionar un archivo para cargarlo a una auditoria."
            redirect(controller: "auditoria", action: "edit", id: params.idAuditoria)
            return
        }
        String filePath = grailsApplication.config.getProperty('rutaArchivos.carpeta.absoluta') + f?.filename
        f.transferTo(new File(filePath))
        Archivo archivo = new Archivo(nombre: f?.filename, ruta: filePath, entidad: 'auditoria', entidadId: params.idAuditoria, creadoPor:session.usuarioLogueado.rut).save(flush:true, failOnError: true)
        assert archivo.id
        flash.message = "Archivo Cargado Correctamente en Auditoria $params.idAuditoria"
        redirect(controller: "auditoria", action: "show", id: params.idAuditoria)
    }

    @Transactional
    def download() {
        InputStream contentStream
        try {
            def file = new File(params.rutaAbsoluta)
            response.setHeader "Content-disposition", "attachment; filename=${params.nombreArchivo}"
            response.setHeader("Content-Length", "file-size")
            response.setContentType("file-mime-type")
            contentStream = file.newInputStream()
            response.outputStream << contentStream
            webRequest.renderView = false
        } catch (Exception e) {
            println "error en : ${e.getMessage()}"
        } finally {
            IOUtils.closeQuietly(contentStream)
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
