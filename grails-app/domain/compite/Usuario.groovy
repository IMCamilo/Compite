package compite



class Usuario {

    String rut
    String nombres
    String parterno
    String materno
    String direccion
    String correo
    String telefono
    String clave
    Integer tipo

    static hasMany = [rendicion:Rendicion, transporte:Transporte, auditoria:Auditoria, egreso:Egreso, proyecto:Proyecto]

    static constraints = {

    }

}
