package compite

import grails.transaction.Transactional
import static org.springframework.http.HttpStatus.NOT_FOUND
import static org.springframework.http.HttpStatus.OK

@Transactional(readOnly = true)
class IngenieroController {

    def index = {
        redirect(action: "proyectosPrograma")
    }

    def proyectosPrograma = {
        println "Usuario logueado RUT: "+session.usuarioLogueado.rut+" con ID: "+session.usuarioLogueado.id
        BigInteger usuarioId = session.usuarioLogueado.id
        def proyectoBusqueda = params.nombreProyecto
        def p = null
        def buscaAsignacion = Asignacion.executeQuery("select a.programa from Asignacion as a where a.usuario="+usuarioId)
        if (buscaAsignacion) {
            def programa = buscaAsignacion[0]
            def buscaNombrePrograma = Programa.executeQuery("select pr.nombre from Programa as pr where pr.id="+programa.id)
            def nombrePrograma = buscaNombrePrograma[0]

            //viene nada, uno o mas en una lista de asignaciones
            println "Programa: "+programa.id+" con nombre: "+nombrePrograma

            if (proyectoBusqueda) {
                println "Estoy buscando un Proyecto especifico"
                try {
                    String[] proyectoObtenido = proyectoBusqueda.split(" - ");
                    p = Proyecto.findById(proyectoObtenido[3])
                } catch (Exception e) {
                    println "Proyecto busqueda: "+e.getMessage()
                }

                if (!p) {
                    flash.error = "Indique un proyecto correcto"
                    redirect (controller: "ingeniero", action: "proyectosPrograma")
                } else {
                    def listaProyectos = Proyecto.findById(p.id)
                    def proyectos = []
                    listaProyectos.each { proyecto ->
                        def result = [:]
                        result.id = proyecto.id
                        result.codigo = proyecto.codigo
                        result.estado = proyecto.estado
                        result.nombre = proyecto.nombre
                        result.empresa = proyecto.empresa
                        proyectos.add(result)
                    }
                    [proyectos:proyectos, nombrePrograma: nombrePrograma, proyectoBusqueda: proyectoBusqueda]
                }
            } else {
                def listaProyectos = Proyecto.findAll("from Proyecto as p where p.programa="+programa.id)
                //recorrer la lista de programas, en gsp tal como esta abajo, en para separar publicos de privados, hacer esto 2 veces
                //no demora nada, así que cumple con el objetivo.

                def proyectos = []
                listaProyectos.each { proyecto ->
                    def result = [:]
                    result.id = proyecto.id
                    result.codigo = proyecto.codigo
                    result.estado = proyecto.estado
                    result.nombre = proyecto.nombre
                    result.empresa = proyecto.empresa
                    proyectos.add(result)
                }
                [proyectos:proyectos, nombrePrograma: nombrePrograma, proyectoBusqueda: proyectoBusqueda]
            }
        }
    }

    def cargarperfil(){
        redirect (controller: "ingeniero", action: "perfil", id: session.usuarioLogueado.id)
    }

    //perfil del ingniero
    def perfil (Usuario usuario) {
        respond usuario
    }

    @Transactional
    def update(Usuario usuario) {
        if (usuario == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (usuario.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond usuario.errors, view:'edit'
            return
        }
        usuario.save flush:true

        redirect(controller: "ingeniero", action: "perfil", params: [id: session.usuarioLogueado.id])
        flash.message = "Perfil Actualizado Correctamente"

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'usuario.label', default: 'Usuario'), usuario.id])
                redirect usuario
                }
            '*'{ respond usuario, [status: OK] }
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
}
