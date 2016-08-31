package compite

/**
 * Created by camilo on 16-08-16.
 */
class Rendicion {

    String tipo
    String nombre
    Date fecha
    String motivo
    String recorrido
    String desde
    String hasta
    String tiempo
    String total
    String boletas

    static belongsTo = [proyecto:Proyecto, usuario:Usuario, item:Item]

    static constraints = {

    }

}
