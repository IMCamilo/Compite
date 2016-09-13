package compite

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ProyectoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def empresas = Empresa.findAll()
        def listEmp = []
        empresas.each { emp ->
            def mapEmp = [:]
            mapEmp.id = emp.id
            mapEmp.nombre = emp.nombre
            listEmp.add(mapEmp)
        }

        println "Lista de Empresas: "+listEmp
        respond Proyecto.list(params), model:[proyectoCount: Proyecto.count(), empresas:listEmp]
    }

    def show(Proyecto proyecto) {
        //println "empresa: "+proyecto.empresa.id
        def nombreEmpresa = Empresa.executeQuery("select nombre from Empresa where id="+proyecto.empresa.id)
        def nombre = nombreEmpresa[0]
        //println "El nombre de la empresa es ${nombre}"
        respond proyecto, model: [nombreEmpresa: nombre]
    }

    def create() {
        respond new Proyecto(params)
    }

    @Transactional
    def save(Proyecto proyecto) {
        println "Estoy en el save de Proyecto"
        if (proyecto == null) {
            "Proyecto viene null"
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (proyecto.hasErrors()) {
            "Proyecto tiene errores"
            transactionStatus.setRollbackOnly()
            respond proyecto.errors, view:'index'
            return
        }

        proyecto.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'proyecto.label', default: 'Proyecto'), proyecto.id])
                redirect proyecto
            }
            '*' { respond proyecto, [status: CREATED] }
        }
    }

    def edit(Proyecto proyecto) {
        respond proyecto
    }

    @Transactional
    def update(Proyecto proyecto) {
        if (proyecto == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (proyecto.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond proyecto.errors, view:'edit'
            return
        }

        proyecto.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'proyecto.label', default: 'Proyecto'), proyecto.id])
                redirect proyecto
            }
            '*'{ respond proyecto, [status: OK] }
        }
    }

    @Transactional
    def delete(Proyecto proyecto) {

        if (proyecto == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        proyecto.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'proyecto.label', default: 'Proyecto'), proyecto.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'proyecto.label', default: 'Proyecto'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
