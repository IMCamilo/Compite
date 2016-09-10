package compite

class Rendicion {

    String tipo, nombre, motivo, desde, hasta, nBoleta, descripcion
    Integer kmInicial, kmFinal, distancia, tiempo, total
    Date fecha = new Date()

    static belongsTo = [proyecto:Proyecto, usuario:Usuario, item:Item]

    static constraints = {
        desde nullable: true
        hasta nullable: true
        descripcion nullable: true
        kmInicial nullable: true
        kmFinal nullable: true
        distancia nullable: true
        tiempo nullable: true
    }

}
