package compite

/**
 * Created by camilo on 16-08-16.
 */
class Empresa {

    String rut
    String nombre
    String razonSocial
    String giro
    String gerente
    String tipo
    Date fechaCreacion = new Date()
    String telefono
    String direccion
    String correo
    String creadoPor

    static hasMany = [proyecto:Proyecto]

    static constraints = {
        creadoPor nullable: true, blank: true
    }
}
