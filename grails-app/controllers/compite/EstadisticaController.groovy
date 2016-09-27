package compite

class EstadisticaController {

    def index() {

        def ttlPub = Proyecto.countByTipo('PUBLICO')
        def ttlPriv = Proyecto.countByTipo('PRIVADO')
        def qtyProyectos = ttlPub + ttlPriv
        def percentPub = (ttlPub/qtyProyectos)*100
        def percentPri = (ttlPriv/qtyProyectos)*100

        def audAprobada = Auditoria.countByEstado('APROBADA')
        def audRechazada = Auditoria.countByEstado('RECHAZADA')
        def qtyAuditorias = audRechazada + audAprobada
        def auditoriasAprobadas = (audAprobada/qtyAuditorias)*100
        def auditoriasRechazadas = (audRechazada/qtyAuditorias)*100

        def qtyEgreso = Egreso.count()
        def egresoBoleta = Egreso.countByTipoDocumento('BOLETA')
        def egresoFactura = Egreso.countByTipoDocumento('FACTURA')

        def boletasEgreso = (egresoBoleta/qtyEgreso)*100
        def facturaEgreso = (egresoFactura/qtyEgreso)*100

        [
            percentPub: percentPub,
            percentPri: percentPri,
            auditoriasAprobadas: auditoriasAprobadas,
            auditoriasRechazadas: auditoriasRechazadas,
            boletasEgreso: boletasEgreso,
            facturasEgreso: facturaEgreso
        ]
    }

}
