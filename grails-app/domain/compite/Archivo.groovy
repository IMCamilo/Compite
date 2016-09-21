package compite

class Archivo {
    String nombre
    String ruta
    String entidad
    Integer entidadId
    String creadoPor
    Date date = new Date()

    static constraints = {
        nombre blank: false
        ruta blank: false
    }
}
