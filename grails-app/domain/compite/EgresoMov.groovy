package compite

class EgresoMov {
    Date fecha = new Date();
    static belongsTo = [egreso:Egreso, movilizacion:Movilizacion]
    static constraints = {

    }
}
