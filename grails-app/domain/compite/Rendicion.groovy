package compite

class Rendicion {

    Date fecha = new Date()
    String sedeEnvio, tipoRendicion, estado, creadoPor, observacion
    Integer total, totalRendido, totalAnticipado

    static belongsTo = [programa:Programa, usuario:Usuario]
    static hasMany = [detalleAudRen:DetalleAudRen, egreso:Egreso]

    static constraints = {
        totalAnticipado nullable: true, blank: true
        totalRendido nullable: true, blank: true
        total nullable: true, blank: true
        creadoPor nullable: true, blank: true
        observacion nullable: true, blank: true
    }

}
