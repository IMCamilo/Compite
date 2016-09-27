package compite

class Programa {
    int codigo
    String nombre
    Integer presupuesto
    String tipo
    Date fechaInicio= new Date()
    Date fechaFin= new Date()
    Integer duracion
    Integer version
    Integer centroCosto
    String estado

    static belongsTo = [region:Region]
    static hasMany = [ proyecto:Proyecto, asignacion:Asignacion, auditoria:Auditoria, egreso:Egreso, rendicion:Rendicion]
    static constraints = {
    }
}
