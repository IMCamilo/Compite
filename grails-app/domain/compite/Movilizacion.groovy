package compite

class Movilizacion {
    Date fechaCreacion = new Date()
    String motivoEmpresa
    String direccion
    Integer distancia
    String concepto
    String tipo

    static belongsTo = [usuario:Usuario, proyecto:Proyecto]
    static hasMany = [egresomov:EgresoMov]
    static constraints = {
    }
}
