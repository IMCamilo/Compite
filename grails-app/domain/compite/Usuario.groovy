package compite
/**
 * Created by camilo on 16-08-16.
 */
class Usuario {

    String rut
    String nombres
    String paterno
    String materno
    String direccion
    String correo
    String telefono
    String clave
    Integer tipo
    String creadoPor
    Date fechaCreacion = new Date()

    static hasMany = [rendicion:Rendicion, transporte:Transporte, auditoria:Auditoria, egreso:Egreso, asignacion:Asignacion]

    static constraints = {
        rut nullable: false, unique: true, blank: false, size: 1..13
        nombres nullable: false, blank: false, size: 1..15
        paterno nullable: false, blank: false, size: 1..15
        materno nullable: false, blank: false, size: 1..15
        direccion nullable: false, blank: false, size: 1..100
        correo email: true, blank: false, size: 1..30
        telefono nullable: true, blank: false, size: 1..15
        clave nullable: false, blank: false, size: 1..15
        tipo nullable: false, blank: false
        creadoPor nullable: true, blank: true
    }
}
