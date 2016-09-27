package compite

class EstadisticaController {

    def index() {
        //cantidad proyectos publicos y privados
        def ttlPub = Proyecto.countByTipo('PUBLICO')
        def ttlPriv = Proyecto.countByTipo('PRIVADO')
        def qtyProyectos = ttlPub + ttlPriv
        def percentPub = (ttlPub/qtyProyectos)*100
        def percentPri = (ttlPriv/qtyProyectos)*100
        [percentPub:percentPub,percentPri:percentPri]
    }

}
