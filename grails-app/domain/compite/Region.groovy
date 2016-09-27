package compite

class Region {
    Integer codigo
    String nombre

    static hasMany = [programa:Programa]

    static constraints = {
        codigo nullable: false, unique: true
        nombre nullable: false, unique: true
    }
}
