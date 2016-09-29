package compite

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import java.util.ArrayList

@Transactional(readOnly = true)
class EgresoMovController {
    Integer idprograma
    private BigInteger usuarioId = session.usuarioLogueado.id
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max, Integer id) {
        def ide = Asignacion.executeQuery("from Asignacion as p where p.usuario=" + usuarioId)
        def programa = ide[0]
        idprograma= programa.id
        if (idprograma == null) {
            println "id programa nulo :" + programa.id
            redirect controller: "ingeniero", action: "index"
            flash.message = "No tienes un programa, comuniquese con el administrador"
        } else {
            println "id programa :" + idprograma
            def movs = Movilizacion.executeQuery("from Movilizacion where usuario_id=" + usuarioId + "and programa_id=" + idprograma)
            def egre= EgresoMov.findByMovilizacion(movs);
            println "egreso con movilizacion" +egre
            def egresoList = Egreso.findAll()
            params.max = Math.min(max ?: 10, 100)
            respond Egreso.list(params), model: [movsList: movs]

        }
    }
    def show(EgresoMov egresoMov) {
        respond egresoMov
    }

    def create() {
        respond new EgresoMov(params)
    }

    @Transactional
    def save() {
        def m = null
        def eg = null

        try {
            String[] movilizacionObt = ((String) params.nombreMovilizacion).split(" ・ ");
            String[] egresoObt = ((String) params.nombreEgreso).split(" ・ ");
            m = Movilizacion.findById(movilizacionObt[1])
            eg = Egreso.findById(egresoObt[1])
        } catch (Exception e) {
            println "validando asignación. "+e.getMessage()
        }
        if (!m && !eg) {
            flash.message = "Debes seleccionar una movilizacion y un egreso"
            redirect(controller: "egresoMov", action: "index")
            return
        } else if (!m){
            flash.message = "Debes seleccionar una movilización"
            redirect(controller: "egresoMov", action: "index")
            return
        } else {
            flash.message = "Debes seleccionar un egreso"
            redirect(controller: "egresoMov", action: "index")
            return
        }

        params.movilizacion = m.id
        params.egreso = eg.id

        def egresoMov = new EgresoMov(params)

        if (egresoMov == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (egresoMov.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond egresoMov.errors, view:'create'
            return
        }

        egresoMov.save flush:true, failOnError:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'egresoMov.label', default: 'EgresoMov'), egresoMov.id])
                redirect egresoMov
            }
            '*' { respond egresoMov, [status: CREATED] }
        }
    }

    def edit(EgresoMov egresoMov) {
        def egreso = Egreso.findById(egresoMov.egresoId)
        def movilizacion = Movilizacion.findById(egresoMov.movilizacionId)
        def egresosList = Egreso.findAll()
        def movtList = Movilizacion.findAll()
        respond egresoMov, model:[egreso: egreso, movilizacion: movilizacion, egresos: egresosList, movilizaciones: movtList]
    }

    @Transactional
    def update() {
        String[] movilizacionObt = ((String) params.nombreMovilizacion).split(" ・ ");
        String[] egresoObt = ((String) params.nombreEgreso).split(" ・ ");
        def m = Movilizacion.findById(movilizacionObt[1])
        def e = Egreso.findById(egresoObt[1])
        params.movilizacion = m.id
        params.egreso = e.id

        def egresoMov = EgresoMov.get(params.id)
        egresoMov.properties = params


        if (egresoMov == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (egresoMov.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond egresoMov.errors, view:'edit'
            return
        }

        egresoMov.save flush:true, failOnError:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'egresoMov.label', default: 'EgresoMov'), egresoMov.id])
                redirect egresoMov
            }
            '*'{ respond egresoMov, [status: OK] }
        }
    }

    @Transactional
    def delete(EgresoMov egresoMov) {

        if (egresoMov == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        egresoMov.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'egresoMov.label', default: 'EgresoMov'), egresoMov.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'egresoMov.label', default: 'EgresoMov'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
    def admovs(){
        guardaregreso(){
            def i = null

            println "params.nombreItem "+params.nombreItem
            try {
                String[] itemObtenido = ((String) params.nombreItem).split("-");
                i = Item.findById(itemObtenido[1])
            } catch (Exception e) {
                println "validando asignación. "+e.getMessage()
            }

            if (!i){
                flash.message = "Debes seleccionar un item para esta asignación"
                redirect(controller: "EgresoMov", action: "index")
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
                    redirect action: "index"
                }
                '*' { respond egreso, [status: CREATED] }
            }
        }
        def egreso= Egreso.executeQuery("select e.id from egreso as e where e.id=max")
        println "grabando egresoMov...."
        Integer i=0

        while(i<params.in.size()) {
            def movilizacion=params.in[i]
            println("Seleccion de parametros : " + params.in[i])
            Integer e=Integer.parseInt(eg)
            Integer m=Integer.parseInt(movilizacion)
            println "movilizacion numero del integer :"+movilizacion
            println "eee" +e
            println "mmm" +m
            params.egreso = e
            params.movilizacion = m

            def egresoMov = new EgresoMov(params)

            if (egresoMov == null) {
                transactionStatus.setRollbackOnly()
                notFound()
                return
            }

            if (egresoMov.hasErrors()) {
                transactionStatus.setRollbackOnly()
                respond egresoMov.errors, view:'create'
                return
            }

            egresoMov.save flush:true, failOnError:true

            i++
        }
        redirect(controller:"egresoMov", action: "index")

    }
}
