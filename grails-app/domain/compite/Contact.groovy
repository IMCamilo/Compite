package compite

/**
 * Created by camilo on 16-08-16.
 */
class Contact {
    String name
    Integer phoneNumber
    static hasMany = [car:Car]
    static constraints = {
        name nullable: false
        phoneNumber nullable: false
    }
}
