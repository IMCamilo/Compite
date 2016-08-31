package compite

/**
 * Created by camilo on 16-08-16.
 */
class Egreso {

    String aprobacion
    String concepto
    Date fechaCreacion
    Integer monto
    String sedeEnvio
    String tipoRendicion


    static belongsTo = [proyecto:Proyecto, usuario:Usuario]

    static constraints = {

    }

}
