package compite

class Proyecto {

    String codigo, nombre, estado, creadoPor
    Date fechaCreacion = new Date()

    static belongsTo = [empresa:Empresa, programa:Programa]
    static constraints = {
        creadoPor nullable: true, blank: true
    }
}
