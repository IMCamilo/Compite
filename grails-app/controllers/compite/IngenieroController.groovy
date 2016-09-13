package compite

import grails.transaction.Transactional
import grails.web.servlet.mvc.GrailsParameterMap

import static org.springframework.http.HttpStatus.CREATED
import static org.springframework.http.HttpStatus.NOT_FOUND
import static org.springframework.http.HttpStatus.OK

@Transactional(readOnly = true)
class IngenieroController {

    private BigInteger usuarioId = session.usuarioLogueado.id

    def index = {
        redirect(action: "proyectos")
    }

    def proyectos = {
        println "estos son los proyectos del usuario "+usuarioId
        //def gg = Asignacion.findAll("from Asignacion as asig where asig.detalle=?", ['asignacion 1, cargada automaticamente'])
        def asignaciones = Asignacion.findAll("from Asignacion as asig where asig.usuario="+usuarioId)

        //viene nada, uno o mas en una lista de asignaciones
        println "asignaciones:"+asignaciones.proyectoId

        //http://docs.grails.org/3.1.1/ref/Domain%20Classes/executeQuery.html
        //en la busqueda en proyectos, pasar una lista, ya que de asignaciones pueden venir muchos id.

        def listaProyectos = Proyecto.findAll("from Proyecto as p where p.id in (:asignaciones)", [asignaciones: asignaciones.proyectoId])
        //recorrer la lista de proyectos, en gsp tal como esta abajo, en para separar publicos de privados, hacer esto 2 veces
        //no demora nada, así que cumple con el objetivo.
        //si nos pusieramos pulcros usariamos un join.

        def proyectosPrivados = []
        def proyectosPublicos = []

        listaProyectos.each { item ->
            if (item.tipo == "PRIVADO") {
                println "proyecto "+item.id+" es Privado"
                def result = [:]
                result.id = item.id
                result.codigo = item.codigo
                result.estado = item.estado
                result.nombre = item.nombre
                proyectosPrivados.add(result)
            } else if (item.tipo == "PUBLICO") {
                println "proyecto "+item.id+" es Publico"
                def result = [:]
                result.id = item.id
                result.codigo = item.codigo
                result.estado = item.estado
                result.nombre = item.nombre
                proyectosPublicos.add(result)
            }
        }
        println "proyectosPublicos: "+proyectosPublicos
        println "proyectosPrivados: "+proyectosPrivados

        [proyectosPrivados:proyectosPrivados, proyectosPublicos:proyectosPublicos]
    }

    def nuevarendicion (Integer id){

        println "id: "+id
        //al seleccionar un proyecto llegar a esta vista, la pantalla  entrega datos personalizados
        def itemsMovilizacion = Item.findAll("from Item as item where item.tipo='Movilizacion'")

        def transportesUsuario = Transporte.findAll("from Transporte as trans where trans.usuario="+usuarioId)

        def listItemMov = []
        def listTransportes = []
        itemsMovilizacion.each { mov ->
            def mapMov = [:]
            mapMov.id = mov.id
            mapMov.nombre = mov.nombre
            mapMov.valor = mov.valor
            listItemMov.add(mapMov)
        }

        transportesUsuario.each { trans ->
            def mapTrans = [:]
            mapTrans.id = trans.id
            mapTrans.descripcion = trans.descripcion
            listTransportes.add(mapTrans)
        }

        def rendicion = new Rendicion(params)
        rendicion.properties = params
        [itemMovilizacion:listItemMov, transportes:listTransportes, id: id, rendicion: rendicion]
    }





    def actualizarperfil = {

    }

    def detalle = {
        //detalle rendicion o proyecto
    }

    def rendiciones = {
        //lista rendiciones
    }

    @Transactional
    def guardar (Rendicion rendicion) {
        if (rendicion == null) {
            println "Rendicion es null, no se puede guardar"
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (rendicion.hasErrors()) {
            println "Rendicion tiene errores, no se puede guardar"

            transactionStatus.setRollbackOnly()
            respond rendicion.errors, view:'nuevarendicion'
            return
        }

        rendicion.save flush:true
        redirect(controller: "ingeniero", action: "rendiciones")

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'rendicion.label', default: 'Rendicion'), rendicion.id])
                redirect rendicion
            }
            '*' { respond ingeniero, [status: CREATED] }
        }
    }

    //perfil del ingniero


    def cargaperfil = {
        redirect(action: "perfil", params: [id: usuarioId])
    }

    def perfil(Usuario usuario, Integer max) {
        respond usuario
        params.max = Math.min(max ?: 10, 100)
        respond Transporte.list(params), model:[transporteCount: Transporte.count()]

    }

    def update ={
        redirect(action: "perfil", params: [id: usuarioId])
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
}
