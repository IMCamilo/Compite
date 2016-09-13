package compite

/**
 * Created by camilo on 16-08-16.
 */
class Egreso {

    String aprobacion
    String concepto
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
        creadoPor nullable: true, blank: true
    }

}

