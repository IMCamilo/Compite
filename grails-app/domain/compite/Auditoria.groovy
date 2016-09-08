package compite

/**
 * Created by camilo on 16-08-16.
 */
class Auditoria {

    String descripcion
    String estado
    Date fecha

    static belongsTo = [proyecto:Proyecto, usuario:Usuario]

    static constraints = {
        descripcion nullable: false, blanzk: false, size: 1..35
    }

}
