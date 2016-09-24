package compite

/**
 * Created by camilo on 16-08-16.
 */
class Auditoria {

    String nombre
    String motivo
    String descripcion
    String estado
    Date fechaCreacion = new Date()
    String creadoPor

    static belongsTo = [programa:Programa, usuario:Usuario]

    static hasMany = [detalleAudRen:DetalleAudRen]

    static constraints = {

    }

}
