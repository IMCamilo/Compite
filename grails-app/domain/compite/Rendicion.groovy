package compite

class Rendicion {

    Date fecha = new Date()
    String sedeEnvio
    String tipoRendicion
    String aprobacion
    Integer total
    Integer totalRendido
    Integer totalAnticipado


    String creadoPor

    static belongsTo = [programa:Programa, usuario:Usuario]

    static hasMany = [detalleAudRen:DetalleAudRen, egreso:Egreso]

    static constraints = {

    }

}
