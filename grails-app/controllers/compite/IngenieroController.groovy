package compite

class IngenieroController {

    def index = {
        redirect(action: "proyectos")
    }

    def proyectos = {
        //crear una vista para seleccionar el proyecto en base el usuario logeado
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