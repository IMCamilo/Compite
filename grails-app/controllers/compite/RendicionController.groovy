package compite

import java.math.RoundingMode

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
        println "Estoy en el save de Rendicion"
        println "estos son los parametros "+params
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

    def crearRendicion () {
        println "Estoy en crearRendicion en Rendicion"
        def egresos =  params.egresos

        /*Sumamos los montos de los egresos*/
        def total = BigDecimal.ZERO
        String [] arrayEgresos = egresos.split(",")
        for (int i = 0; i < arrayEgresos.length; i++) {
            println "Egreso "+i+" :"+arrayEgresos[i]
            def queryMonto = Egreso.executeQuery("select e.monto from Egreso as e where e.id="+arrayEgresos[i])
            def monto = queryMonto[0]
            total = total + monto
        }

        //Traemos el usuario de los Egresos
        def queryUsuario = Egreso.executeQuery("select e.usuario from Egreso as e where e.id="+arrayEgresos[0])
        def usuario = queryUsuario[0]

        params.sedeEnvio = "Puerto Montt"
        params.tipoRendicion = "Reembolso de gastos"
        params.estado = "NO_APROBADA"
        params.creadoPor = "admin"
        params.totalRendido = total
        params.total = total
        params.usuario = usuario.id
        params.programa = 1
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
        actualizaRendicionEnEgreso(rendicion.id, egresos)

        //redirect (controller: "rendicion", action: "save", params: [egresos: egresos])
    }

    @Transactional
    def actualizaRendicionEnEgreso (rendicionId, egresos) {
        println "Estoy en actualizaRendicionEnEgreso"
        println "este es el id de la rendicion: "+rendicionId

        String [] arrayEgresos = egresos.split(",")
        for (int i = 0; i < arrayEgresos.length; i++) {
            println "Egreso "+i+" :"+arrayEgresos[i]

            params.rendicion = rendicionId
            params.aprobacion = "SI"
            def egreso = Egreso.get(arrayEgresos[i])
            println "Esto es el egreso: "+egreso
            egreso.properties = params

            egreso.save flush:true, failOnError: true
            println "actualizado ok"
        }

        println "todo actualizado OK"
        flash.message = "Rendicion creada correctamente"
        redirect (controller: "rendicion", action: "show", id: rendicionId)
    }

    @Transactional
    def aprobar () {
        println "Estoy aprobando la rendicion"
        params.estado = "APROBADA"
        def rendicion = Rendicion.get(params.id)
        rendicion.properties = params

        if (rendicion == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (rendicion.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond egreso.errors, view:'show', id: rendicion.id
            return
        }

        rendicion.save flush:true, failOnError: true
        flash.message = "Rendicion aprobada Correctamente"
        redirect (controller: "rendicion", action: "show", id: rendicion.id)
    }

    @Transactional
    def enviadaPorValija () {
        params.estado = "ENVIADA_POR_VALIJA"
        def rendicion = Rendicion.get(params.id)
        rendicion.properties = params

        if (rendicion == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (rendicion.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond egreso.errors, view:'show', id: rendicion.id
            return
        }

        rendicion.save flush:true, failOnError: true
        flash.message = "Rendicion enviada por valija Correctamente"
        redirect (controller: "rendicion", action: "show", id: rendicion.id)
    }

    @Transactional
    def recepcionadaSantiago () {
        params.estado = "RECEPCIONADA_SANTIAGO"
        def rendicion = Rendicion.get(params.id)
        rendicion.properties = params

        if (rendicion == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (rendicion.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond egreso.errors, view:'show', id: rendicion.id
            return
        }

        rendicion.save flush:true, failOnError: true
        flash.message = "Rendicion recepcionada Correctamente"
        redirect (controller: "rendicion", action: "show", id: rendicion.id)
    }

    @Transactional
    def aprobadaFirmada () {
        params.estado = "APROBADA_FIRMADA_SANTIAGO"
        def rendicion = Rendicion.get(params.id)
        rendicion.properties = params

        if (rendicion == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (rendicion.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond egreso.errors, view:'show', id: rendicion.id
            return
        }

        rendicion.save flush:true, failOnError: true
        flash.message = "Rendicion aprobada y firmada Correctamente"
        redirect (controller: "rendicion", action: "show", id: rendicion.id)
    }

    @Transactional
    def transferencia () {
        params.estado = "TRANSFERENCIA_OK"
        def rendicion = Rendicion.get(params.id)
        rendicion.properties = params

        if (rendicion == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (rendicion.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond egreso.errors, view:'show', id: rendicion.id
            return
        }

        rendicion.save flush:true, failOnError: true
        flash.message = "Transferencia ok"
        redirect (controller: "rendicion", action: "show", id: rendicion.id)
    }

    @Transactional
    def finalizada () {
        params.estado = "FINALIZADA"
        def rendicion = Rendicion.get(params.id)
        rendicion.properties = params

        if (rendicion == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (rendicion.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond egreso.errors, view:'show', id: rendicion.id
            return
        }

        rendicion.save flush:true, failOnError: true
        flash.message = "Rendicion finalizada correctamente"
        redirect (controller: "rendicion", action: "show", id: rendicion.id)
    }
}
