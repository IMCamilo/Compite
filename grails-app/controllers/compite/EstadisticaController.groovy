package compite

class EstadisticaController {

    def index() {

        def ret = [:]

        def proyectPub = Proyecto.countByTipo('PUBLICO')
        def proyectPriv = Proyecto.countByTipo('PRIVADO')
        def totalProyectos = proyectPub + proyectPriv
        ret.percentPub = (proyectPub/totalProyectos)*100
        ret.percentPri = (proyectPriv/totalProyectos)*100

        def proyectCompite1000 = Proyecto.executeQuery("select count(*) from Proyecto where programa = 1")
        def proyectCompiteInnova = Proyecto.executeQuery("select count(*) from Proyecto where programa = 2")
        def proyectConsultoria = Proyecto.executeQuery("select count(*) from Proyecto where programa = 3")
        ret.percentCompite1000 = (((proyectCompite1000[0]/totalProyectos)*100) as double).round(2)
        ret.percentCompiteInnova = (((proyectCompiteInnova[0]/totalProyectos)*100) as double).round(2)
        ret.percentConsultoria = (((proyectConsultoria[0]/totalProyectos)*100) as double).round(2)

        def audAprobada = Auditoria.countByEstado('APROBADA')
        def audRechazada = Auditoria.countByEstado('RECHAZADA')
        def qtyAuditorias = audRechazada + audAprobada
        ret.auditoriasAprobadas = (audAprobada/qtyAuditorias)*100
        ret.auditoriasRechazadas = (audRechazada/qtyAuditorias)*100

        def qtyEgreso = Egreso.count()
        def egresoBoleta = Egreso.countByTipoDocumento('BOLETA')
        def egresoFactura = Egreso.countByTipoDocumento('FACTURA')
        ret.boletasEgreso = (egresoBoleta/qtyEgreso)*100
        ret.facturasEgreso = (egresoFactura/qtyEgreso)*100

        def audiCompite = Auditoria.executeQuery("select count(*) from Auditoria where programa = 1")
        def audiInnova = Auditoria.executeQuery("select count(*) from Auditoria where programa = 2")
        def audiConsultoria = Auditoria.executeQuery("select count(*) from Auditoria where programa = 3")
        ret.audiCompite = (audiCompite[0]/qtyAuditorias)*100
        ret.audiInnova = (audiInnova[0]/qtyAuditorias)*100
        ret.audiConsultoria = (audiConsultoria[0]/qtyAuditorias)*100

        ret

    }

}
