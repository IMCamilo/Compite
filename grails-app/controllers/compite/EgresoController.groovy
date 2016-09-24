package compite

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class EgresoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        def userList = Usuario.findAll()
        def rendicionList = Rendicion.findAll()
        def itemsList = Item.findAll()
        def programaList = Programa.findAll()
        params.max = Math.min(max ?: 10, 100)
        respond Egreso.list(params), model:[egresoCount: Egreso.count(), usuarios:userList, programas:programaList, rendiciones:rendicionList, items:itemsList]
    }

    def show(Egreso egreso) {
        respond egreso
    }

    def create() {
        respond new Egreso(params)
    }

    @Transactional
    def save() {
        def u = null
        def p = null
        def i = null
        def r = null

        try {
            String[] rutObtenido = ((String) params.nombreUsuario).split(" ・ ");
            String[] programaObtenido = ((String) params.nombrePrograma).split(" ・ ");
            String[] itemObtenido = ((String) params.nombreItem).split(" ・ ");
            String[] rendicionObtenido = ((String) params.nombreRendicion).split(" ・ ");

            u = Usuario.findByRut(rutObtenido[1])
            p = Programa.findByCodigo(programaObtenido[0])
            i = Item.findById(itemObtenido[1])
            r = Rendicion.findById(rendicionObtenido[1])

        } catch (Exception e) {
            println "validando asignación. "+e.getMessage()
        }
        if (!u && !p && !i && !r) {
            flash.message = "Debes seleccionar un usuario, un programa, un item y una rendicion para esta rendición"
            redirect(controller: "egreso", action: "index")
            return
        } else if (!u){
            flash.message = "Debes seleccionar un usuario para esta asignación"
            redirect(controller: "egreso", action: "index")
            return
        } else if (!p){
            flash.message = "Debes seleccionar un proyecto para esta asignación"
            redirect(controller: "egreso", action: "index")
            return
        } else if (!i){
            flash.message = "Debes seleccionar un item para esta asignación"
            redirect(controller: "egreso", action: "index")
            return
        } else {
            flash.message = "Debes seleccionar una rendicion para esta asignación"
            redirect(controller: "egreso", action: "index")
            return
        }
        params.usuario = u.id
        params.programa = p.id
        params.item = i.id
        params.rendicion = i.id


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
        def item = Item.findById(egreso.programaId)
        def rendicion = Rendicion.findById(egreso.programaId)
        def programa = Programa.findById(egreso.programaId)
        def userList = Usuario.findAll()
        def rendicionList = Rendicion.findAll()
        def itemsList = Item.findAll()
        def programaList = Programa.findAll()
        respond egreso, model:[usuarios:userList, programas:programaList, rendiciones:rendicionList, items:itemsList, usuario:usuario, item:item, rendicion:rendicion, programa:programa]
    }

    @Transactional
    def update() {
        String[] rutObtenido = ((String) params.nombreUsuario).split(" ・ ");
        String[] programaObtenido = ((String) params.nombrePrograma).split(" ・ ");
        String[] itemObtenido = ((String) params.nombreItem).split(" ・ ");
        String[] rendicionObtenido = ((String) params.nombreRendicion).split(" ・ ");
        def u = Usuario.findByRut(rutObtenido[1])
        params.usuario = u.id
        def p = Programa.findByCodigo(programaObtenido[1])
        params.programa = p.id
        def i = Item.findById(itemObtenido[1])
        params.item = i.id
        def r = Rendicion.findById(rendicionObtenido[1])
        params.rendicion = i.id

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
