package compite

/**
 * Created by camilo on 16-08-16.
 */
class Item {

    String nombre
    String tipo
    String descripcion
    Integer valor
    Date fechaCreacion = new Date()

    static hasMany = [rendicion:Rendicion]
    static constraints = {

    }

}
