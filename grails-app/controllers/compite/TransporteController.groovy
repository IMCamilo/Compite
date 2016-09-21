package compite

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TransporteController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        def userList = Usuario.findAll()
        params.max = Math.min(max ?: 10, 100)
        respond Transporte.list(params), model:[transporteCount: Transporte.count(), usuarios:userList]
    }

    def show(Transporte transporte) {
        def lista = Usuario.executeQuery("select nombres, paterno, materno from Usuario u where u.id = ?", [transporte.usuarioId])
        def persona = lista[0]
        def nombres = persona [0]
        def paterno = persona [1]
        def materno = persona [2]
        respond transporte, model: [nombreUsuario: nombres+" "+paterno+" "+materno]
    }

    def create() {
        respond new Transporte(params)
    }

    @Transactional
    def save() {
        String[] rutObtenido = ((String) params.nombreUsuario).split(" ・ ");
        def u = Usuario.findByRut(rutObtenido[1])
        params.usuario = u.id
        def transporte = new Transporte(params)

        if (transporte == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (transporte.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond transporte.errors, view:'index'
            return
        }

        transporte.save flush:true, failOnError:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'transporte.label', default: 'Transporte'), transporte.id])
                redirect transporte
            }
            '*' { respond transporte, [status: CREATED] }
        }
    }

    def edit(Transporte transporte) {
        def usuario = Usuario.findById(transporte.usuarioId)
        def userList = Usuario.findAll()
        respond transporte, model:[usuarios:userList, usuario:usuario]
    }

    @Transactional
    def update() {
        String[] rutObtenido = ((String) params.nombreUsuario).split(" ・ ");
        println "rutObtenido: "+rutObtenido[1]
        def u = Usuario.findByRut(rutObtenido[1])
        params.usuario = u.id
        def transporte = Transporte.get(params.id)
        transporte.properties = params

        if (transporte == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (transporte.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond transporte.errors, view:'edit'
            return
        }

        transporte.save flush:true, failOnError:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'transporte.label', default: 'Transporte'), transporte.id])
                redirect transporte
            }
            '*'{ respond transporte, [status: OK] }
        }
    }

    @Transactional
    def delete(Transporte transporte) {

        if (transporte == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        transporte.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'transporte.label', default: 'Transporte'), transporte.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'transporte.label', default: 'Transporte'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
