package compite

class Rendicion {

    String tipo
    String nombre
    String motivo
    String desde
    String hasta
    String nBoleta
    String descripcion
    String estado
    String creadoPor
    Integer kmInicial
    Integer kmFinal
    Integer distancia
    Integer tiempo
    Integer total
    Date fecha = new Date()

    static belongsTo = [proyecto:Proyecto, usuario:Usuario, item:Item]

    static hasMany = [detalleAudRen:DetalleAudRen]

    static constraints = {
        desde nullable: true
        hasta nullable: true
        descripcion nullable: true
        kmInicial nullable: true
        kmFinal nullable: true
        distancia nullable: true
        tiempo nullable: true
        estado nullable: true
        creadoPor nullable: true, blank: true

    }

}
