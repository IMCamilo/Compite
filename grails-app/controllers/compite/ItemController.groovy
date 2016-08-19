package compite

/**
 * Created by camilo on 16-08-16.
 */
class ItemController {

    def index = {
    }

    def create = {
        def rendiciones = Rendicion.list()
        [rendiciones: rendiciones]
    }

    def save = {
        def item = new Item(params)
        item.save flush: true, failOnError: true
        redirect action:"show", id:item.id
    }

    def edit = {
        def item = Item.get(params.id)
        [item:item]
    }

    def update = {
        def item = Item.get(params.id)
        item.properties = params
        item.save flush: true, failOnError: true
        redirect action: "show", id:params.id
    }

    def show = {
        def item = Item.get(params.id)
        [item:item]
    }

    def list = {
        def items = Item.list()
        [items:items]
    }

    def delete = {
        def item = Item.get(params.id)
        item.delete flush: true, failOnError: true
        redirect action: "index"
    }

}
