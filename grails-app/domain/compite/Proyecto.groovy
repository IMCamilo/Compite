package compite

/**
 * Created by camilo on 16-08-16.
 */
class Proyecto {

    String codigo
    String nombre
    Date fechaCreacion
    Date fechaFin
    String estado
    String tipo

    static hasMany = [asignacion:Asignacion, auditoria:Auditoria, egreso:Egreso, rendicion:Rendicion]
    static belongsTo = [empresa:Empresa]

    static constraints = {

    }

}
