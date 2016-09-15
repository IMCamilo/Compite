package compite

/**
 * Created by camilo on 16-08-16.
 */
class Item {

    Integer centroCosto
    String nombre
    String itemPresupuestario
    String descripcion
    Integer valor
    Date fechaCreacion = new Date()
    String creadoPor

    static hasMany = [egreso:Egreso]

    static constraints = {
        itemPresupuestario nullable: true, blank: true
        nombre nullable: true, blank: true
        creadoPor nullable: true, blank: true
    }

}
