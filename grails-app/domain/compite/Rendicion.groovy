package compite

/**
 * Created by camilo on 16-08-16.
 */
class Rendicion {

    String tipo
    Date fecha
    String motivo
    String recorrido
    String tiempo
    String total

    static hasMany = [item:Item]
    static belongsTo = [proyecto:Proyecto, usuario:Usuario]

    static constraints = {

    }

}
