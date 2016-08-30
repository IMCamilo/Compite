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

       /* println "id : "+ asignaciones.id[0]
        println "version : "+ asignaciones.version[0]
        println "detalle : "+ asignaciones.detalle[0]
        println "fecha : "+ asignaciones.fecha[0]
        println "proyecto : "+ asignaciones.proyectoId[0]
        println "usuario : "+ asignaciones.usuarioId[0]

        println "id : "+ asignaciones.id[1]
        println "version : "+ asignaciones.version[1]
        println "detalle : "+ asignaciones.detalle[1]
        println "fecha : "+ asignaciones.fecha[1]
        println "proyecto : "+ asignaciones.proyectoId[1]
        println "usuario : "+ asignaciones.usuarioId[1]*/

        //viene nada, uno o mas en una lista de asignaciones
        println "asignaciones:"+asignaciones.proyectoId

        //http://docs.grails.org/3.1.1/ref/Domain%20Classes/executeQuery.html
        //en la busqueda en proyectos, pasar una lista, ya que de asignaciones pueden venir muchos id.

        def listaProyectos = Proyecto.findAll("from Proyecto as p where p.id in (:asignaciones)", [asignaciones: asignaciones.proyectoId])
        //recorrer la lista de proyectos, en gsp tal como esta abajo, en para separar publicos de privados, hacer esto 2 veces
        //no demora nada, así que cumple con el objetivo.
        //si nos pusieramos pulcros usariamos un join.
        /*
        println "proyectos : "+proyectos
        println "#"+proyectos.id
        println "#"+proyectos.version
        println "#"+proyectos.codigo
        println "#"+proyectos.empresaId
        println "#"+proyectos.estado
        println "#"+proyectos.fechaCreacion
        println "#"+proyectos.fechaFin
        println "#"+proyectos.nombre
        */
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