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

        def r = Rendicion.findAll()
        def p = Programa.findAll()
        respond Programa.list(params), model: [programas: p, rendiciones: r]

        try {
            String[] codigoPrograma = ((String) params.nombrePrograma).split(" ・ ");
            String[] rendicionNombre = ((String) params.codrendicion).split(" ・ ");

                def egresoList  = Egreso.executeQuery("from Egreso e, Programa p, Rendicion r " +
                        "where e.rendicion = r.id and r.id = :idrendicion and e.programa in (SELECT id from Programa where nombre = :nombreprog)"
                        ,[idrendicion:rendicionNombre[1].toLong(), nombreprog:codigoPrograma[0].toString()])
            def egreso = []

            egresoList.each {}

        }
        catch (Exception ex)
        {
            println ex
        }

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
