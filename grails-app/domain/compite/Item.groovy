package compite

/**
 * Created by camilo on 16-08-16.
 */
class Item {

    Integer centroCosto
    String itemPresupuetario
    String tipo
    String descripcion
    Integer valor
    Date fechaCreacion = new Date()
    String creadoPor

    static hasMany = [egreso:Egreso]

    static constraints = {
        creadoPor nullable: true, blank: true
    }

}
