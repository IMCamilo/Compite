package compite

class Region {
    Integer codigo
    String nombre

    static hasMany = [programa:Programa]

    static constraints = {
    }
}
