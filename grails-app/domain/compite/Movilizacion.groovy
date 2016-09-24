package compite

class Movilizacion {

    Date fechaCreacion = new Date()
    String motivoEmpresa
    String direccion
    Integer distancia
    String concepto
    String tipo
    Integer precio
    String creadoPor

    static belongsTo = [usuario:Usuario, programa:Programa]

    static hasMany = [egresomov:EgresoMov]

    static constraints = {

    }
}
