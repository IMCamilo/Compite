package compite

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class EgresoIngController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    private BigInteger usuarioId = session.usuarioLogueado.id

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)

        def listaEgresos = Egreso.findAll("from Egreso as e where e.usuario="+usuarioId)
        def egresos = []
        listaEgresos.each { egreso ->
            def result = [:]
            result.id = egreso.id
            result.programa = egreso.programa
            result.concepto = egreso.concepto
            result.aprobacion = egreso.aprobacion
            result.tipoMoneda = egreso.tipoMoneda
            result.monto = egreso.monto
            result.tipoDocumento = egreso.tipoDocumento
            result.pagadoA = egreso.pagadoA
            egresos.add(result)
        }

        println "egresos: "+egresos
        [egresos: egresos, egresoCount: Egreso.count()]
    }

    def crear(Integer max) {
        //def proyectoId = params.id

        def buscaPrograma = Asignacion.executeQuery("select a.programa from Asignacion as a where a.usuario="+usuarioId)
        def programa = buscaPrograma[0]

        def rendicionList = Rendicion.findAll()
        def itemsList = Item.findAll()
        params.max = Math.min(max ?: 10, 100)
        respond Egreso.list(params), model:[egresoCount: Egreso.count(), rendiciones:rendicionList, items:itemsList, programaId: programa.id]
    }

    def show(Egreso egreso) {
        respond egreso
    }

    def create() {
        respond new Egreso(params)
    }

    @Transactional
    def save() {
        println "Estoy en el save de Egreso Ing"
        def i = null

        println "params.nombreItem "+params.nombreItem
        try {
            println "Estoy en try"
            String[] itemObtenido = ((String) params.nombreItem).split("-");
            println "**************itemObtenido*********** "+itemObtenido[1]
            i = Item.findById(itemObtenido[1])
        } catch (Exception e) {
            println "Estoy en catch"
            println "validando asignación. "+e.getMessage()
        }

        if (!i){
            flash.message = "Debes seleccionar un item para esta asignación"
            redirect(controller: "egresoIng", action: "index", id: proyecto)
            return
        }

        params.item = i.id
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
