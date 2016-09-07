package compite

class  Transporte {

    String tipo
    String marca
    String modelo
    String combustible
    Integer kmPorLitro
    String descripcion

    static belongsTo = [usuario:Usuario]

}
