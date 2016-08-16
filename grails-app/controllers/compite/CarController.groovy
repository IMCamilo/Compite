package compite

/**
 * Created by camilo on 16-08-16.
 */
class CarController {

    def index = {
        redirect action: "list"
    }

    def create = {
        //busco la lista de los usuarios, para que en crear auto se puedan seleccionar uno
        def contacts = Contact.list()
        [contacts:contacts]
    }

    def save = {
        def car = new Car(params)
        car.save flush: true, failOnError: true
        redirect action: "show", id: car.id
    }

    def edit = {
        def car = Car.get(params.id)
        [car: car]
    }

    def update = {
        def car = Car.get(params.id)
        car.properties = params
        car.save flush: true, failOnError: true
        redirect action: "show", id: params.id
    }

    def show = {
        def car = Car.get(params.id)
        [car: car]
    }

    def list = {
        def contacts = Contact.list()
        [contacts: contacts]
    }
    def delete = {
        def car = Car.get(params.id)
        car.delete flush: true, failOnError: true
        redirect action: "index"
    }


}
