package compite

class Auditoria {

    String aprobacion, concepto, tipoDocumento, tipoMoneda, nDocumento, pagadoA, creadoPor, rutEmpresa, observacion
    Date fechaCreacion = new Date()
    Integer monto

    static belongsTo = [programa:Programa, usuario:Usuario, item:Item, rendicion:Rendicion, proyecto: Proyecto, egreso: Egreso]
    static hasMany = [movilizacion:Movilizacion]

    static constraints = {
        creadoPor nullable: true, blank: true
        rendicion nullable: true, blank: true
        monto nullable: true, blank:true
        nDocumento nullable: true, blank: true
        observacion nullable: true, blank: true
    }

}
