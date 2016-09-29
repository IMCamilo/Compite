package compite

class Programa {
    int codigo
    String nombre, tipo, estado, creadoPor
    Integer presupuesto, duracion, version, centroCosto
    Date fechaInicio= new Date()
    Date fechaFin= new Date()

    static belongsTo = [region:Region]
    static hasMany = [ proyecto:Proyecto, asignacion:Asignacion, auditoria:Auditoria, egreso:Egreso, rendicion:Rendicion]
    static constraints = {
    }
}
