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
        redirect(action: "programas")
    }

    def programas = {
        //println "estos son los programas del usuario "+usuarioId
        def buscaAsignacion = Asignacion.executeQuery("select asig.programa from Asignacion as asig where asig.usuario="+usuarioId)
        def programa = buscaAsignacion[0]

        def buscaNombrePrograma = Programa.executeQuery("select pr.nombre from Programa as pr where pr.id="+programa.id)
        def nombrePrograma = buscaNombrePrograma[0]

        //viene nada, uno o mas en una lista de asignaciones
        println "programa:"+programa.id+" con nombre: "+nombrePrograma

        def listaProgramas = Proyecto.findAll("from Proyecto as p where p.programa="+programa.id)
        //recorrer la lista de programas, en gsp tal como esta abajo, en para separar publicos de privados, hacer esto 2 veces
        //no demora nada, así que cumple con el objetivo.
        //si nos pusieramos pulcros usariamos un join.

        def proyectos = []
        listaProgramas.each { proyecto ->
            def result = [:]
            result.id = proyecto.id
            result.codigo = proyecto.codigo
            result.estado = proyecto.estado
            result.nombre = proyecto.nombre
            result.empresa = proyecto.empresa
            proyectos.add(result)
        }

        println "proyectos: "+proyectos
        [proyectos:proyectos, nombrePrograma: nombrePrograma]
    }

    def cargarperfil(){
        redirect (controller: "ingeniero", action: "perfil", id: usuarioId)
    }

    //perfil del ingniero
    def perfil(Usuario usuario){
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

        redirect(controller: "ingeniero", action: "perfil", params: [id: usuarioId])
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
