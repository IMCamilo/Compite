package compite

/**
 * Created by camilo on 12-09-16.
 */
class DetalleAudRen {

    String detalle
    Date fechaCreacion = new Date()
    String creadoPor

    static belongsTo = [rendicion:Rendicion, auditoria:Auditoria]

    static constraints = {
        creadoPor nullable: true, blank: true
        detalle nullable: true, blank: true
    }
}
