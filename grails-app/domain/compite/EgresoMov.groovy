package compite

class EgresoMov {

    Date fecha = new Date();
    String creadoPor

    static belongsTo = [egreso:Egreso, movilizacion:Movilizacion]

    static constraints = {
        creadoPor nullable: true, blank: true
    }
}
