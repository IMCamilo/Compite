package compite

/**
 * Created by camilo on 18-08-16.
 */
class Asignacion {

    String detalle
    Date fecha

    static belongsTo = [proyecto:Proyecto, usuario:Usuario]
}
