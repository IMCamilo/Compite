package compite

/**
 * Created by camilo on 16-08-16.
 */
class Egreso {

    String aprobacion
    String concepto
    String tipoDocumento
    Date fechaCreacion = new Date()
    Integer monto
    String tipoMoneda
    String nDocumento
    String rutEmpresa
    String pagadoA
    String creadoPor

    static belongsTo = [proyecto:Proyecto, usuario:Usuario, item:Item, rendicion:Rendicion]
    static hasMany = [egresomov:EgresoMov]
    static constraints = {
        tipoDocumento nullable: true, blank: true
        creadoPor nullable: true, blank: true
    }

}
