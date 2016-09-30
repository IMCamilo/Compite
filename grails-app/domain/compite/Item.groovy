package compite

/**
 * Created by camilo on 16-08-16.
 */
class Item {

    String nombre
    Integer codigo
    Date fechaCreacion = new Date()
    String creadoPor

    static hasMany = [egreso:Egreso]

    static constraints = {
        nombre nullable: true, blank: true
        creadoPor nullable: true, blank: true
    }

}
