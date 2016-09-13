import compite.Asignacion
import compite.Auditoria
import compite.Egreso
import compite.Empresa
import compite.Item
import compite.Proyecto
import compite.Rendicion
import compite.Transporte
import compite.Usuario
import compite.DetalleAudRen

class BootStrap {

    def init = { servletContext ->

        if (!Usuario.count()) {
            //ingresen sus usuarios.
            new Usuario(rut: "14353123-k", nombres: "Cristian", paterno: "Pardo", materno: "-", direccion: "-", correo: "usuarioadminuno@grails.org", telefono: "-", clave: "qwerty", tipo: 1, creadoPor:"admin").save(failOnError: true)
            new Usuario(rut: "16524533-k", nombres: "Jonathan", paterno: "Cardenas", materno: "-", direccion: "-", correo: "usuarioadmindos@grails.org", telefono: "-", clave: "qwerty", tipo: 1, creadoPor:"admin").save(failOnError: true)
            new Usuario(rut: "14524533-k", nombres: "Rodrigo", paterno: "Cardenas", materno: "-", direccion: "-", correo: "usuarioadmindos@grails.org", telefono: "-", clave: "qwerty", tipo: 1, creadoPor:"admin").save(failOnError: true)
            new Usuario(rut: "18653290-2", nombres: "Camilo", paterno: "Jorquera", materno: "Ampuero", direccion: "Seminario 372", correo: "camilo.jorquera.a@gmail.com", telefono: "-", clave: "qwerty", tipo: 1, creadoPor:"admin").save(failOnError: true)
            new Usuario(rut: "13553677-1", nombres: "Pablo", paterno: "Zumelzu", materno: "-", direccion: "Avda. Siempre Viva", correo: "ingeniero1@gmail.com", telefono: "78787878", clave: "pantalla1", tipo: 2, creadoPor:"admin").save(failOnError: true)
            new Usuario(rut: "16511533-k", nombres: "Adolfo", paterno: "Gonzalez", materno: "-", direccion: "-", correo: "usuarioadmindos@grails.org", telefono: "-", clave: "qwerty", tipo: 1, creadoPor:"admin").save(failOnError: true)
            new Usuario(rut: "15524533-k", nombres: "Pablo", paterno: "Santana", materno: "-", direccion: "-", correo: "usuarioadmindos@grails.org", telefono: "-", clave: "qwerty", tipo: 1, creadoPor:"admin").save(failOnError: true)
        }

        if (!Empresa.list()) {
            new Empresa(rut: "78.130.370-4", nombre: "C.R.T. Ltda.", razonSocial: "Corporación de Recursos en Telecomunicaciones Ltda.", giro: "Salud", gerente: "Grails", tipo: "Sofware", fechaCreacion: "2016-08-19 11:49:00.0", telefono: "232323", direccion: "Direccion 1", correo: "empresatestuno@test.com", creadoPor:"admin").save(failOnError: true)
            new Empresa(rut: "85.244.300-6", nombre: "Caballero y Cía. Ltda.", razonSocial: "Caballero y Cía. Ltda.", giro: "Salud", gerente: "Grails", tipo: "Sofware", fechaCreacion: "2016-08-19 11:49:00.0", telefono: "232323", direccion: "Direccion 1", correo: "empresatestuno@test.com", creadoPor:"admin").save(failOnError: true)
            new Empresa(rut: "50.117.670-2", nombre: "Cabello e Hijo Ltda.", razonSocial: "Cabello e Hijo Ltda.", giro: "Salud", gerente: "Grails", tipo: "Sofware", fechaCreacion: "2016-08-19 11:49:00.0", telefono: "232323", direccion: "Direccion 1", correo: "empresatestuno@test.com", creadoPor:"admin").save(failOnError: true)
            new Empresa(rut: "79.625.580-3", nombre: "Cabrini Hermanos Ltda.", razonSocial: "Cabrini Hermanos Ltda.", giro: "Salud", gerente: "Grails", tipo: "Sofware", fechaCreacion: "2016-08-19 11:49:00.0", telefono: "232323", direccion: "Direccion 1", correo: "empresatestuno@test.com", creadoPor:"admin").save(failOnError: true)
            new Empresa(rut: "5.028.540-5", nombre: "Cáceres Barahona, Héctor Enrique", razonSocial: "Cáceres Barahona, Héctor Enrique", giro: "Salud", gerente: "Grails", tipo: "Sofware", fechaCreacion: "2016-08-19 11:49:00.0", telefono: "232323", direccion: "Direccion 1", correo: "empresatestuno@test.com", creadoPor:"admin").save(failOnError: true)
            new Empresa(rut: "96.654.210-1", nombre: "Cachemiras S.S.", razonSocial: "Tejidos Grissu S.A.", giro: "Salud", gerente: "Grails", tipo: "Sofware", fechaCreacion: "2016-08-19 11:49:00.0", telefono: "232323", direccion: "Direccion 1", correo: "empresatestuno@test.com", creadoPor:"admin").save(failOnError: true)
            new Empresa(rut: "96.716.020-2", nombre: "Cade Grayson Chile S.A.", razonSocial: "Cade Grayson Chile S.A.", giro: "Salud", gerente: "Grails", tipo: "Sofware", fechaCreacion: "2016-08-19 11:49:00.0", telefono: "232323", direccion: "Direccion 1", correo: "empresatestuno@test.com", creadoPor:"admin").save(failOnError: true)
            new Empresa(rut: "96.583.240-8", nombre: "Cadem S.A.", razonSocial: "Consultores Asociados de Marketing Cadem S.A.", giro: "Salud", gerente: "Grails", tipo: "Sofware", fechaCreacion: "2016-08-19 11:49:00.0", telefono: "232323", direccion: "Direccion 1", correo: "empresatestuno@test.com", creadoPor:"admin").save(failOnError: true)
            new Empresa(rut: "76.484.420-3", nombre: "Cadenas Toqui", razonSocial: "Comercial Toqui Ltda.", giro: "Salud", gerente: "Grails", tipo: "Sofware", fechaCreacion: "2016-08-19 11:49:00.0", telefono: "232323", direccion: "Direccion 1", correo: "empresatestuno@test.com", creadoPor:"admin").save(failOnError: true)
            new Empresa(rut: "96.973.190-8", nombre: "Cadetech S.A.", razonSocial: "Cadetech S.A.", giro: "Salud", gerente: "Grails", tipo: "Sofware", fechaCreacion: "2016-08-19 11:49:00.0", telefono: "232323", direccion: "Direccion 1", correo: "empresatestuno@test.com", creadoPor:"admin").save(failOnError: true)
            new Empresa(rut: "79.649.310-0", nombre: "C.M. (Chile) Ltda.", razonSocial: "Sistemas de Cielos Metálicos Ltda.", giro: "Salud", gerente: "Grails", tipo: "Sofware", fechaCreacion: "2016-08-19 11:49:00.0", telefono: "232323", direccion: "Direccion 1", correo: "empresatestuno@test.com", creadoPor:"admin").save(failOnError: true)
        }

        if (!Proyecto.list()) {
            new Proyecto(codigo: "PR-01", presupuesto: 1200000, nombre: "Samsung tecnologias etc", fechaCreacion: "2016-08-19 11:49:00.0", fechaFin: "2016-08-19 11:49:00.0", estado: "ACTIVO", tipo: "PUBLICO", empresa: 1, creadoPor:"admin").save(failOnError: true)
            new Proyecto(codigo: "PR-02", presupuesto: 800000, nombre: "Proyecto 1 Para el Ingeniero 1", fechaCreacion: "2016-08-01 00:00:00.0", fechaFin: "2016-12-31 00:00:00.0", estado: "ACTIVO", tipo: "PUBLICO", empresa: 2, creadoPor:"admin").save(failOnError: true)
            new Proyecto(codigo: "PR-03", presupuesto: 2500000, nombre: "Proyecto 2 Para el Ingeniero 1", fechaCreacion: "2016-08-01 00:00:00.0", fechaFin: "2016-12-31 00:00:00.0", estado: "ACTIVO", tipo: "PRIVADO", empresa: 2, creadoPor:"admin").save(failOnError: true)
        }

        if (!Item.list()) {
            new Item(nombre: "Estacionamiento", tipo: "Movilizacion", descripcion: "Estacionamiento", valor: 5000, creadoPor:"admin").save(failOnError: true)
            new Item(nombre: "Peaje", tipo: "Movilizacion", descripcion: "Peaje", valor: 5000, creadoPor:"admin").save(failOnError: true)
            new Item(nombre: "Tag", tipo: "Movilizacion", descripcion: "Tag", valor: 5000, creadoPor:"admin").save(failOnError: true)
            new Item(nombre: "Pasaje", tipo: "Movilizacion", descripcion: "Pasaje", valor: 5000, creadoPor:"admin").save(failOnError: true)
            new Item(nombre: "Metro", tipo: "Movilizacion", descripcion: "Metro", valor: 5000, creadoPor:"admin").save(failOnError: true)
            new Item(nombre: "Bencina 93", tipo: "Movilizacion", descripcion: "Bencina 93", valor: 900, creadoPor:"admin").save(failOnError: true)
            new Item(nombre: "Bencina 95", tipo: "Movilizacion", descripcion: "Bencina 95", valor: 950, creadoPor:"admin").save(failOnError: true)
            new Item(nombre: "Bencina 97", tipo: "Movilizacion", descripcion: "Bencina 97", valor: 1000, creadoPor:"admin").save(failOnError: true)
            new Item(nombre: "Diesel", tipo: "Movilizacion", descripcion: "Diesel", valor: 600, creadoPor:"admin").save(failOnError: true)
        }

        if (!Rendicion.list()) {
            new Rendicion(tipo: "Movilizacion", nombre: "Rendicion 1 estandar", fecha: "2016-08-19 11:49:00.0", motivo: "Viaje Proyecto 1, Ejemplo", desde: "Puerto Montt", hasta: "Osorno", kmInicial: 0, kmFinal: 0, distancia: 0, tiempo: 0, total: 2000, nBoleta: "10", descripcion: "Pasaje de micro", usuario: 3, proyecto: 2, item: 4, creadoPor:"admin").save(failOnError: true)
            new Rendicion(tipo: "Movilizacion", nombre: "Rendicion 2", fecha: "2016-08-19 11:49:00.0", motivo: "Viaje Proyecto 1, Ejemplo Combustible", desde: "Puerto Montt", hasta: "Alerce sur", kmInicial: 90000, kmFinal: 90500, distancia: 500, tiempo: 0, total: 5000, nBoleta: "300", descripcion: "Compra bencia 93", usuario: 3, proyecto: 2, item: 6, creadoPor:"admin").save(failOnError: true)
        }

        if (!Auditoria.list()) {
            new Auditoria(fecha: "2016-08-19 11:49:00.0", nombre:"Auditoria numeor 1", motivo:"estandar", descripcion: "Auditoria cargada automaticamente", estado: "En espera de aporvación por el administrador", usuario: 1, proyecto: 1, creadoPor:"admin").save(failOnError: true)
            new Auditoria(fecha: "2016-08-19 11:49:00.0", nombre:"Auditoria numeor 2", motivo:"pro", descripcion: "Auditoria cargada automaticamente", estado: "En espera de aporvación por el administrador", usuario: 2, proyecto: 1, creadoPor:"admin").save(failOnError: true)
        }

        if (!DetalleAudRen.list()) {
            new DetalleAudRen(fecha: "2016-08-19 11:49:00.0", detalle: "Informacion sobre auditoria 1 y rendicion 1.", auditoria: 1, rendicion: 1, creadoPor:"admin").save(failOnError: true)
        }

        if (!Egreso.list()) {
            new Egreso(aprobacion: "NO", sedeEnvio: "Puerto Montt", fechaCreacion: "2016-08-19 11:49:00.0", tipoRendicion: "tipo estandar", concepto: "Pago de haberes", monto: 140000, usuario: 1, proyecto: 1, creadoPor:"admin").save(failOnError: true)
        }

        if (!Transporte.list()) {
            new Transporte(tipo: "Sedán", marca: "BMW", modelo: "z3", combustible: "bencina", kmPorLitro: 20, descripcion: "Automovil estándar", usuario: 3, creadoPor:"admin").save(failOnError: true)
        }

        if (!Asignacion.list()) {
            new Asignacion(detalle: "Asignacion 1, cargada automaticamente", fecha: "2016-08-19 11:49:00.0", usuario: 1, proyecto: 1, creadoPor:"admin").save(failOnError: true)
            new Asignacion(detalle: "Asignación para Ingeniero 1, proyecto 2", fecha: "2016-08-10 00:0:00.0", usuario: 4, proyecto: 2, creadoPor:"admin").save(failOnError: true)
            new Asignacion(detalle: "Asignación para Ingeniero 1, proyecto 3", fecha: "2016-08-10 00:0:00.0", usuario: 4, proyecto: 3, creadoPor:"admin").save(failOnError: true)
        }

    }

    def destroy = {

    }

}
