package compite

/**
 * Created by camilo on 16-08-16.
 */
class Auditoria {

    String descripcion
    String estado
    Date fechaCreacion = new Date()
    String creadoPor

    static belongsTo = [proyecto:Proyecto, usuario:Usuario]

    static hasMany = [detalleAudRen:DetalleAudRen]

    static constraints = {
        proyecto nullable: true, blank: true
        usuario nullable: true, blank: true
        creadoPor nullable: true, blank: true
        descripcion nullable: true, blanzk: true, size: 1..35
        estado nullable: true, blank: true
    }

}
