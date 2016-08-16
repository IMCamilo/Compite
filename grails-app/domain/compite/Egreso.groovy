package compite

/**
 * Created by camilo on 16-08-16.
 */
class Egreso {

    String aprobacion
    String sedeEnvio
    Date fechaCreacion
    String tipoRendicion

    static belongsTo = [usuario:Usuario]

    static constraints = {

    }

}
