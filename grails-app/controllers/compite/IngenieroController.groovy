package compite


class IngenieroController {

    private BigInteger usuarioId = session.usuarioLogueado.id

    def index = {
        redirect(action: "proyectos")
    }

    def proyectos = {
        println "estos son los proyectos del usuario "+usuarioId
        //def gg = Asignacion.findAll("from Asignacion as asig where asig.detalle=?", ['asignacion 1, cargada automaticamente'])
        def asignaciones = Asignacion.findAll("from Asignacion as asig where asig.usuario="+usuarioId)
        println "id : "+ asignaciones.id[0]
        println "version : "+ asignaciones.version[0]
        println "detalle : "+ asignaciones.detalle[0]
        println "fecha : "+ asignaciones.fecha[0]
        println "proyecto : "+ asignaciones.proyecto[0]
        println "usuario : "+ asignaciones.usuario[0]
        //http://docs.grails.org/3.1.1/ref/Domain%20Classes/executeQuery.html
        //en la busqueda en proyectos, pasar una lista, ya que de asignaciones pueden venir muchos id.

    }

    def nuevarendicion = {
        //al seleccionar un proyecto llegar a esta vista, la pantalla  entrega datos personalizados
    }

    def perfil = {
        //muestra los datos del usuario
    }

    def actualizarperfil = {

    }

    def detalle = {
        //detalle rendicion o proyecto
    }

    def rendiciones = {
        //lista rendiciones
    }

}