package compite

class Rendicion {

    Date fecha = new Date()
    String tipo
    String creadoPor

    static belongsTo = [proyecto:Proyecto, usuario:Usuario]

    static hasMany = [detalleAudRen:DetalleAudRen, egreso:Egreso]

    static constraints = {

    }

}
