package compite

/**
 * Created by camilo on 16-08-16.
 */
class Empresa {

    String rut
    String nombre
    String giro
    String gerente
    String tipo
    Date fechaCreacion
    String telefono
    String direccion
    String correo

    static hasMany = [proyecto:Proyecto]

    static constraints = {

    }
}
