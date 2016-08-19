package compite

class AdministradorController {

    def index = {
        //si no tiene nada, simplemente carga la vista index.gsp
        def proyecto = Proyecto.get(params.id)
        [proyecto: proyecto]

    }
    def administrar = {
        //si no tiene nada, simplemente carga la vista index.gsp
    }
    def reportes = {
        //si no tiene nada, simplemente carga la vista index.gsp
    }
}
