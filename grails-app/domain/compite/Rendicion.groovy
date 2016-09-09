package compite

/**
 * Created by camilo on 16-08-16.
 */
class Rendicion {

    String tipo
    String nombre
    Date fechaCreacion = new Date()
    String motivo
    String desde
    String hasta
    Integer kmInicial
    Integer kmFinal
    Integer distancia
    Integer tiempo
    Integer total
    String nBoleta
    String descripcion

    static belongsTo = [proyecto:Proyecto, usuario:Usuario, item:Item]

    static constraints = {

    }

}
