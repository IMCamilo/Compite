package compite

/**
 * Created by camilo on 16-08-16.
 */
class Proyecto {

    String codigo
    String nombre
    Integer presupuesto
    Date fechaCreacion
    Date fechaFin
    String estado
    String tipo
    String creadoPor

    static belongsTo = [empresa:Empresa, programa:Programa]

    static constraints = {

    }

}
