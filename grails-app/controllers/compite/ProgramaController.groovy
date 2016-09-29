package compite

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ProgramaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        def tipo = params.tipoBusqueda
        def estado = params.estadoBusqueda
        def listaRegiones = Region.findAll()
        if (tipo || estado) {
            println "Realizando busqueda"
            println "tipo: "+tipo+" estado: "+estado
            if (tipo && estado) {
                println "Viene tipo y estado"
                def listado = Programa.findAll("from Programa p where p.tipo = ? and p.estado = ?", [tipo, estado])
                params.max = Math.min(max ?: 10, 100)
                [programaCount: Programa.count(), regiones:listaRegiones, programaList: listado, tipoContext: tipo, estadoContext: estado]
            } else if (tipo) {
                println "Solo viene tipo"
                def listaProgramas = Programa.findAllByTipo(tipo)
                params.max = Math.min(max ?: 10, 100)
                [programaCount: Programa.count(), regiones:listaRegiones, programaList: listaProgramas, tipoContext: tipo, estadoContext: null]
            } else if (estado) {
                println "Solo viene estado"
                def listaProgramas = Programa.findAllByEstado(estado)
                params.max = Math.min(max ?: 10, 100)
                [programaCount: Programa.count(), regiones:listaRegiones, programaList: listaProgramas, tipoContext: null, estadoContext: estado]
            }
        } else {
            println "No vienen parametros"
            params.max = Math.min(max ?: 10, 100)
            respond Programa.list(params), model:[programaCount: Programa.count(), regiones:listaRegiones, ]
        }
    }

    def show(Programa programa) {
        redirect action:"index"
    }

    def create() {
        def region = Region.findAll()
        respond new Programa(params), model:[region:region]
    }

    @Transactional
    def save() {
        def centroCosto = params.region + params.codigo + params.version
        println "este es el centro de costo: "+centroCosto
        params.centroCosto = centroCosto
        def programa = new Programa(params)

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

        programa.save flush:true, failOnError: true
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'programa.label', default: 'Programa'), programa.id])
                redirect programa
            }
            '*' { respond programa, [status: CREATED] }
        }
        //flash.message = "Programa creado correctamente"
        //redirect (controller: "programa", action: "index")
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
                redirect action: "index"
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
