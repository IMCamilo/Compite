package compite

import grails.transaction.Transactional

import static org.springframework.http.HttpStatus.OK

@Transactional(readOnly = true)
class AdministradorController {
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    private BigInteger usuarioId = session.usuarioLogueado.id
    def index = {
        redirect(action: "programa")
    }
    def proyectos = {
        println "Listando todos los Proyectos"
        redirect(controller: "proyecto", action: "index")
    }
    def programa = {
        redirect(controller: "programa", action: "index")
    }

    def administrar = {
        //si no tiene nada, simplemente carga la vista index.gsp
    }

    def reportes = {
        def projectList = Proyecto.findAll()
        def programaList = Programa.findAll()
        def usuarioList = Usuario.findAll()
        def egresoList = Egreso.findAll()
        def itemList = Item.findAll()
        def rendicionList = Rendicion.findAll()

        respond Egreso.list(params), model:[proyectos:projectList, programas:programaList,
                                            usuarios:usuarioList,egreso:egresoList,
                                            item:itemList, rendicion:rendicionList]


        String[] nombrePrograma
    }
    def cargarperfil(){
        redirect (controller: "administrador", action: "perfil", id: usuarioId)
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
            respond usuario.errors, view:'cargarperfil'
            return
        }
        usuario.save flush:true

        redirect(controller: "administrador", action: "perfil", params: [id: usuarioId])
        flash.message = "Perfil Actualizado Correctamente"

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'usuario.label', default: 'Usuario'), usuario.id])
                redirect usuario
            }
            '*'{ respond usuario, [status: OK] }
        }

    }
}
