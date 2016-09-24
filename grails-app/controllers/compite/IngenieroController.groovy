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
        println "estos son los programas del usuario "+usuarioId
        //def gg = Asignacion.findAll("from Asignacion as asig where asig.detalle=?", ['asignacion 1, cargada automaticamente'])
        def asignaciones = Asignacion.findAll("from Asignacion as asig where asig.usuario="+usuarioId)

        //viene nada, uno o mas en una lista de asignaciones
        println "asignaciones:"+asignaciones.programaId

        //http://docs.grails.org/3.1.1/ref/Domain%20Classes/executeQuery.html
        //en la busqueda en programas, pasar una lista, ya que de asignaciones pueden venir muchos id.

        def listaProgramas = Programa.findAll("from Programa as p where p.id in (:asignaciones)", [asignaciones: asignaciones.programaId])
        //recorrer la lista de programas, en gsp tal como esta abajo, en para separar publicos de privados, hacer esto 2 veces
        //no demora nada, así que cumple con el objetivo.
        //si nos pusieramos pulcros usariamos un join.

        def programasPrivados = []
        def programasPublicos = []

        listaProgramas.each { item ->
            if (item.tipo == "PRIVADO") {
                println "programa "+item.id+" es Privado"
                def result = [:]
                result.id = item.id
                result.codigo = item.codigo
                result.estado = item.estado
                result.nombre = item.nombre
                programasPrivados.add(result)
            } else if (item.tipo == "PUBLICO") {
                println "programa "+item.id+" es Publico"
                def result = [:]
                result.id = item.id
                result.codigo = item.codigo
                result.estado = item.estado
                result.nombre = item.nombre
                programasPublicos.add(result)
            }
        }
        println "programasPublicos: "+programasPublicos
        println "programasPrivados: "+programasPrivados

        [programasPrivados:programasPrivados, programasPublicos:programasPublicos, programas:listaProgramas]
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
