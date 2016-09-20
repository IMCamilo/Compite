package compite

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class MovilizacionController {
    private BigInteger usuarioId = session.usuarioLogueado.id
    static Integer idproyecto;
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        def userList = Usuario.findAll()
        def projectList = Proyecto.findAll()
        params.max = Math.min(max ?: 10, 100)
        respond Movilizacion.list(params), model:[movilizacionCount: Movilizacion.count(), usuarios:userList, proyectos:projectList]
    }

    def show(Movilizacion movilizacion) {
        respond movilizacion
    }

    def create() {
        respond new Movilizacion(params)
}

    @Transactional
    def save() {
        String[] rutObtenido = ((String) params.nombreUsuario).split(" ・ ");
        String[] proyectoObtenido = ((String) params.nombreProyecto).split(" ・ ");
        def u = Usuario.findByRut(rutObtenido[1])
        params.usuario = u.id
        def p = Proyecto.findByCodigo(proyectoObtenido[1])
        params.proyecto = p.id

        def movilizacion = new Movilizacion(params)

        if (movilizacion == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (movilizacion.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond movilizacion.errors, view:'create'
            return
        }

        movilizacion.save flush:true, failOnError:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'movilizacion.label', default: 'Movilizacion'), movilizacion.id])
                redirect movilizacion
            }
            '*' { respond movilizacion, [status: CREATED] }
        }
    }

    def edit(Movilizacion movilizacion) {
        def usuario = Usuario.findById(movilizacion.usuarioId)
        def proyecto = Proyecto.findById(movilizacion.proyectoId)
        def userList = Usuario.findAll()
        def projectList = Proyecto.findAll()
        respond movilizacion, model:[usuarios:userList, proyectos:projectList, usuario:usuario, proyecto:proyecto]
    }

    @Transactional
    def update() {
        String[] rutObtenido = ((String) params.nombreUsuario).split(" ・ ");
        String[] proyectoObtenido = ((String) params.nombreProyecto).split(" ・ ");
        def u = Usuario.findByRut(rutObtenido[1])
        params.usuario = u.id
        def p = Proyecto.findByCodigo(proyectoObtenido[1])
        params.proyecto = p.id

        def movilizacion = Movilizacion.get(params.id)
        movilizacion.properties = params

        if (movilizacion == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (movilizacion.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond movilizacion.errors, view:'edit'
            return
        }

        movilizacion.save flush:true, failOnError:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'movilizacion.label', default: 'Movilizacion'), movilizacion.id])
                redirect movilizacion
            }
            '*'{ respond movilizacion, [status: OK] }
        }
    }

    @Transactional
    def delete(Movilizacion movilizacion) {

        if (movilizacion == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        movilizacion.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'movilizacion.label', default: 'Movilizacion'), movilizacion.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'movilizacion.label', default: 'Movilizacion'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    //Crear rendicion de movilizacion personalizada
    def nuevamovilizacion(Integer id,Integer max){
        idproyecto=id
        def proyecto=Proyecto.findById(id)
        def movs = Movilizacion.executeQuery("from Movilizacion where usuario_id="+usuarioId+"and proyecto_id="+id)
        println ("IDmovilizacion:"+movs.id)
        params.max = Math.min(max ?: 10, 100)
        [movsList:movs, proyecto: proyecto]
    }
    //verificacion de boltas por el consumo de combustible

    def verificar(){
        if(params.tipo=="combustible"){
            def kmsxlitro= Transporte.find("from Transporte where usuario_id="+usuarioId)
            if (kmsxlitro==null){
                println ("no tiene vehiculo en el sistema")
                respond (controller:"movilizacion", action: "nuevamovilizacion", id:idproyecto, message("no tiene vehiculos inscritos, Actualize su perfil"))
            }else {
                Integer combustible=700
                Integer dis=Integer.parseInt(params.distancia)
                Integer precio=Integer.parseInt(params.precio)
                Integer kmlitro=kmsxlitro.kmPorLitro

                double conlitro=dis/kmlitro
                Integer preciocal=conlitro*combustible


                println ("precio de aproximado que debio ocupar= "+preciocal.toString()+" ,precio que pago por la boleta = "+precio.toString())

                if(preciocal*0.7<=precio&&precio<=preciocal*1.3){
                    return guardar()
                }else{
                    redirect (controller:"movilizacion", action: "nuevamovilizacion", id:idproyecto)
                }
            }


        }else{
            respond guardar;
        }
    }
    def guardar(){
        params.usuario=usuarioId
        params.proyecto=idproyecto

        def movilizacion = new Movilizacion(params)

        if (movilizacion == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (movilizacion.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond movilizacion.errors, view:'create'
            return
        }

        movilizacion.save flush:true, failOnError:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'movilizacion.label', default: 'Movilizacion'), movilizacion.id])
                redirect (controller:"movilizacion", action: "nuevamovilizacion", id:idproyecto)
            }
            '*' { respond movilizacion, [status: CREATED] }
        }


    }
    def editarmov(Movilizacion movilizacion){
        respond movilizacion
    }
    def editguardar(){
        params.usuario=usuarioId
        params.proyecto=idproyecto
        def movilizacion = Movilizacion.get(params.id)
        movilizacion.properties = params

        if (movilizacion == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (movilizacion.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond movilizacion.errors, view:'editarmov'
            return
        }

        movilizacion.save flush:true, failOnError:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'movilizacion.label', default: 'Movilizacion'), movilizacion.id])
                redirect (controller:"movilizacion", action: "nuevamovilizacion", id:idproyecto)
            }
            '*'{ respond movilizacion, [status: OK] }
        }
    }
}
