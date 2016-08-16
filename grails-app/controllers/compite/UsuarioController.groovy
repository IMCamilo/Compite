package compite

/**
 * Created by camilo on 16-08-16.
 */
class UsuarioController {

    def index = {
        //redirige a la lista de usuarios
        redirect action: "list"
    }

    def create = {
        //cumple el objetivo de mostrar la vista create
        //el formulario apunta a save
    }

    def save = {
        //save recibe todos los parametros
        def usuario = new Usuario(params)
        usuario.save flush: true, failOnError: true
        redirect action: "show", id: usuario.id
    }

    def edit = {
        //edit recibe el id, y busca el contacto con ese id y retorna sus datos en pantalla
        //el formulario apunta a update
        def usuario = Usuario.get(params.id)
        [usuario: usuario]
    }

    def update = {
        //update guarda, pisa, actualiza los datos basandose en el id que recibe
        def usuario = Usuario.get(params.id)
        usuario.properties = params
        usuario.save flush: true, failOnError: true
        redirect action: "show", id: params.id
    }

    def show = {
        //show muestra los datos del contacto seleccionado a través del id
        def usuario = Usuario.get(params.id)
        [usuario: usuario]
    }

    def list = {
        //lista los todos los contactos
        def contacts = Usuario.list()
        [contacts: contacts]
    }
    def delete = {
        //elimina el usuario del id que le pasó
        def usuario = Usuario.get(params.id)
        usuario.delete flush: true, failOnError: true
        redirect action: "index"
    }

}
