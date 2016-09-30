package compite

class Movilizacion {

    Date fechaCreacion
    String motivoEmpresa, direccion, concepto, tipo, creadoPor
    Integer distancia, precio

    static belongsTo = [usuario:Usuario, programa:Programa, egreso:Egreso]
    static constraints = {
        egreso nullable: true
    }
}
