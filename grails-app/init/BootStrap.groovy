import compite.Asignacion
import compite.Auditoria
import compite.Egreso
import compite.Empresa
import compite.Item
import compite.Proyecto
import compite.Rendicion
import compite.Transporte
import compite.Usuario

class BootStrap {

    def init = { servletContext ->
        if (!Usuario.count()) {
            new Usuario(
                rut: "643531234-k",
                nombres: "usertestuno",
                paterno: "uno",
                materno: "-",
                direccion: "-",
                correo: "usuarioadminuno@grails.org",
                telefono: "-",
                clave: "qwerty",
                tipo: 1).save(failOnError: true)
            new Usuario(
                rut: "87524533-k",
                nombres: "usertestdos",
                paterno: "dos",
                materno: "-",
                direccion: "-",
                correo: "usuarioadmindos@grails.org",
                telefono: "-",
                clave: "qwerty",
                tipo: 1).save(failOnError: true)
            new Usuario(
                rut: "11111111-1",
                nombres: "Homero",
                paterno: "Simpsons",
                materno: "Fox",
                direccion: "Avda. Siempre Viva",
                correo: "ingeniero1@gmail.com",
                telefono: "78787878",
                clave: "pantalla1",
                tipo: 2).save(failOnError: true)
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
            new Empresa(
                    rut: "96523180-3",
                    nombre: "Opciones S.A.",
                    giro: "Informática",
                    gerente: "Homero Simpsons",
                    tipo: "Sofware",
                    fechaCreacion: "2016-08-01 00:00:00.0",
                    telefono: "652484600",
                    direccion: "Ejercito # 200",
                    correo: "contacto@opciones.cl").save(failOnError: true)
        }
        if (!Proyecto.list()){
            new Proyecto(
                    codigo: "SAMSUNG",
                    nombre: "Samsung tecnologias etc",
                    fechaCreacion: "2016-08-19 11:49:00.0",
                    fechaFin: "2016-08-19 11:49:00.0",
                    estado: "ACTIVADO",
                    empresa: 1).save(failOnError: true)
            new Proyecto(
                    codigo: "PR-01",
                    nombre: "Proyecto 1 Para el Ingeniero 1",
                    fechaCreacion: "2016-08-01 00:00:00.0",
                    fechaFin: "2016-12-31 00:00:00.0",
                    estado: "ACTIVADO",
                    empresa: 2).save(failOnError: true)
        }
        if (!Auditoria.list()){
            new Auditoria(
                fecha: "2016-08-19 11:49:00.0",
                descripcion: "Auditoria cargada automaticamente",
                estado:"En espera de aporvación por el administrador",
                usuario: 1,
                proyecto: 1).save(failOnError: true)
        }
        if (!Egreso.list()){
            new Egreso(
                aprobacion: "NO",
                sedeEnvio: "Puerto Montt",
                fechaCreacion: "2016-08-19 11:49:00.0",
                tipoRendicion: "tipo estandar",
                concepto: "Pago de haberes",
                monto:140000,
                usuario: 1,
                proyecto: 1).save(failOnError: true)
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
<<<<<<< HEAD

        if (!Item.list()){
            new Item(
                    nombre: "Item Uno",
                    tipo: "insumo",
                    descripcion: "Item cargado automaticamente",
                    valor:13000).save(failOnError: true)
=======
        if (!Proyecto.list()){
            new Proyecto(
                codigo: "PR-01",
                nombre: "Samsung tecnologias etc",
                fechaCreacion: "2016-08-19 11:49:00.0",
                fechaFin: "2016-08-19 11:49:00.0",
                estado: "ACTIVADO",
                empresa: 1).save(failOnError: true)
            new Proyecto(
                codigo: "PR-02",
                nombre: "Proyecto 1 Para el Ingeniero 1",
                fechaCreacion: "2016-08-01 00:00:00.0",
                fechaFin: "2016-12-31 00:00:00.0",
                estado: "ACTIVADO",
                empresa: 2).save(failOnError: true)
            new Proyecto(
                    codigo: "PR-03",
                    nombre: "Proyecto 1 Para el Ingeniero 1",
                    fechaCreacion: "2016-08-01 00:00:00.0",
                    fechaFin: "2016-12-31 00:00:00.0",
                    estado: "ACTIVADO",
                    empresa: 2).save(failOnError: true)
>>>>>>> 6243010fad1502752d2899ac6443d95d36fc3a2a
        }

        if (!Rendicion.list()){
            new Rendicion(
                nombre: "rendicion 1 estandar",
                tipo: "rendicionestandar",
                fecha: "2016-08-19 11:49:00.0",
                motivo: "Movilizacion",
                recorrido: "0",
                desde:"Puerto Montt",
                hasta:"Alerce sur",
                tiempo: "0",
                total: "0",
                usuario: 1,
                item: 1,
                proyecto: 1).save(failOnError: true)
        }

        if (!Asignacion.list()){
            new Asignacion(
                detalle:"asignacion 1, cargada automaticamente",
                fecha: "2016-08-19 11:49:00.0",
                usuario: 1,
                proyecto: 1).save(failOnError: true)
            new Asignacion(
                detalle:"Asignación para Ingeniero 1, proyecto 2",
                fecha: "2016-08-10 00:0:00.0",
                usuario: 3,
                proyecto: 2).save(failOnError: true)
            new Asignacion(
                detalle:"Asignación para Ingeniero 1, proyecto 3",
                fecha: "2016-08-10 00:0:00.0",
                usuario: 3,
                proyecto: 3).save(failOnError: true)
        }
    }
    def destroy = {
    }

}
