package compite

/**
 * Created by camilo on 18-08-16.
 */
class Asignacion {

    String detalle
    Date fechaCreacion = new Date()

    static belongsTo = [proyecto:Proyecto, usuario:Usuario]
}
