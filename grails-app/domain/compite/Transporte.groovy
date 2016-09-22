package compite

class  Transporte {

    String tipo
    String patente
    String marca
    String modelo
    String combustible
    Integer kmPorLitro
    String descripcion
    Date fechaCreacion = new Date()
    String creadoPor

    static belongsTo = [usuario:Usuario]

    static constraints = {
        creadoPor nullable: true, blank: true
    }

}
