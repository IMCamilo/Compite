package compite

class Asignacion {

    String detalle
    Date fechaCreacion = new Date()
    String creadoPor

    static belongsTo = [programa:Programa, usuario:Usuario]

    static constraints = {
        creadoPor nullable: true, blank: true
    }
}
