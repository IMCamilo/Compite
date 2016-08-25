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

    static hasMany = [rendicion:Rendicion, transporte:Transporte, auditoria:Auditoria, egreso:Egreso, asignacion:Asignacion]
    static constraints = {
        rut nullable: false, unique: true
        nombres nullable: false
        paterno nullable: false
        materno nullable: false
        direccion nullable: false
        correo email: true
        telefono nullable: true
        clave nullable: false
        tipo nullable: false


    }
}
