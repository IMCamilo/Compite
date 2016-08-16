package compite

/**
 * Created by camilo on 16-08-16.
 */
class Transporte {

    String nombre
    String marca
    String modelo
    Integer kmPorLitro
    String descripcion

    static belongsTo = [usuario:Usuario]

}
