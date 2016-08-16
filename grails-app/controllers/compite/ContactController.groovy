package compite

/**
 * Created by camilo on 16-08-16.
 */
class ContactController {

    def index = {
        //redirige a la lista de contacts
        redirect action: "list"
    }

    def create = {
        //cumple el objetivo de mostrar la vista create
        //el formulario apunta a save
    }

    def save = {
        //save recibe todos los parametros
        def contact = new Contact(params)
        contact.save flush: true, failOnError: true
        redirect action: "show", id: contact.id
    }

    def edit = {
        //edit recibe el id, y busca el contacto con ese id y retorna sus datos en pantalla
        //el formulario apunta a update
        def contact = Contact.get(params.id)
        [contact: contact]
    }

    def update = {
        //update guarda, pisa, actualiza los datos basandose en el id que recibe
        def contact = Contact.get(params.id)
        contact.properties = params
        contact.save flush: true, failOnError: true
        redirect action: "show", id: params.id
    }

    def show = {
        //show muestra los datos del contacto seleccionado a través del id
        def contact = Contact.get(params.id)
        [contact: contact]
    }

    def list = {
        //lista los todos los contactos
        def contacts = Contact.list()
        [contacts: contacts]
    }
    def delete = {
        //elimina el contacto por el id pasado
        def contact = Contact.get(params.id)
        contact.delete flush: true, failOnError: true
        redirect action: "index"
    }

}
