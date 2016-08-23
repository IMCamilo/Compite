import compite.Asignacion
import compite.Auditoria
import compite.Egreso
import compite.Empresa
import compite.Item
import compite.Proyecto
import compite.Rendicion
import compite.Transporte
import compite.Usuario
import org.springframework.beans.PropertyBatchUpdateException

class BootStrap {

    def init = { servletContext ->
        if (!Usuario.count()) {
            new Usuario(
                rut: "643531234-k",
                nombres: "usertestuno",
                paterno: "uno",
                materno: "-",
                direccion: "-",
                correo: "usuarioadmin@grails.org",
                telefono: "-",
                clave: "qwerty",
                tipo: 1).save(failOnError: true)
            new Usuario(
                rut: "87524533-k",
                nombres: "usertestdos",
                paterno: "dos",
                materno: "-",
                direccion: "-",
                correo: "usuarioadmin@grails.org",
                telefono: "-",
                clave: "qwerty",
                tipo: 1).save(failOnError: true)
        }
        if (!Auditoria.list()){
            new Auditoria(
                fecha: "2016-08-19 11:49:00.0",
                descripcion: "Auditoria cargada automaticamente",
                usuario: 1).save(failOnError: true)
        }
        if (!Egreso.list()){
            new Egreso(
                aprobacion: "NO",
                sedeEnvio: "Puerto Montt",
                fechaCreacion: "2016-08-19 11:49:00.0",
                tipoRendicion: "tipo estandar",
                usuario: 1).save(failOnError: true)
        }
        if (!Empresa.list()){
            new Empresa(
                rut: "98765432-1",
                nombre: "EmpresaTestUno",
                giro: "Salud",
                gerente: "Grails",
                tipo: "Sofware",
                fechaCreacion: "2016-08-19 11:49:00.0",
                telefono: "232323",
                direccion: "Direccion 1",
                correo: "empresatestuno@test.com").save(failOnError: true)
        }
        if (!Transporte.list()){
            new Transporte(
                nombre: "Vehículo menor",
                marca: "BMW",
                modelo: "z3",
                kmPorLitro: 23,
                descripcion: "Automovil estandar",
                usuario: 1).save(failOnError: true)
        }
        if (!Proyecto.list()){
            new Proyecto(
                codigo: "SAMSUNG",
                nombre: "Samsung tecnologias etc",
                fechaCreacion: "2016-08-19 11:49:00.0",
                fechaFin: "2016-08-19 11:49:00.0",
                estado: 1,

                empresa: 1).save(failOnError: true)
        }
        if (!Rendicion.list()){
            new Rendicion(
                nombre: "rendicion 1 estandar",
                tipo: "rendicionestandar",
                fecha: "2016-08-19 11:49:00.0",
                motivo: "colacion",
                recorrido: "0",
                tiempo: "0",
                total: "0",
                usuario: 1,
                proyecto: 1).save(failOnError: true)
        }
        if (!Item.list()){
            new Item(
                nombre: "Item Uno",
                tipo: "insumo",
                descripcion: "Item cargado automaticamente",
                valor:13000,
                rendicion: 1).save(failOnError: true)
        }
        if (!Asignacion.list()){
            new Asignacion(
                detalle:"asignacion 1, cargada automaticamente",
                fecha: "2016-08-19 11:49:00.0",
                usuario: 1,
                proyecto: 1).save(failOnError: true)
        }
    }
    def destroy = {
    }

}
