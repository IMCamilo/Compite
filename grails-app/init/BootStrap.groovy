import compite.Asignacion
import compite.Auditoria
import compite.Egreso
import compite.EgresoMov
import compite.Empresa
import compite.Item
import compite.Movilizacion
import compite.Proyecto
import compite.Rendicion
import compite.Transporte
import compite.Usuario
import compite.DetalleAudRen
import compite.Programa
import compite.Region

class BootStrap {

    def init = { servletContext ->

        if (!Usuario.count()) {
            //ingresen sus usuarios.
            new Usuario(rut: "14353123-k", nombres: "Cristian", paterno: "Pardo", materno: "-", direccion: "-", correo: "cristian.pardo@compite.cl", telefono: "78522266", clave: "qwerty", tipo: 2, creadoPor:"admin").save(failOnError: true)
            new Usuario(rut: "16524533-k", nombres: "Jonathan", paterno: "Cardenas", materno: "Vargas", direccion: "Las Cascadas # 901, Portal de Alerce", correo: "jonathan.cardenas@compite.cl", telefono: "90875522", clave: "qwerty", tipo: 2, creadoPor:"admin").save(failOnError: true)
            new Usuario(rut: "14524533-k", nombres: "Rodrigo", paterno: "Cardenas", materno: "-", direccion: "-", correo: "usuarioadmindos@grails.org", telefono: "-", clave: "qwerty", tipo: 1, creadoPor:"admin").save(failOnError: true)
            new Usuario(rut: "18653290-2", nombres: "Camilo", paterno: "Jorquera", materno: "Ampuero", direccion: "Seminario 372", correo: "camilo.jorquera.a@gmail.com", telefono: "-", clave: "qwerty", tipo: 1, creadoPor:"admin").save(failOnError: true)
            new Usuario(rut: "13553677-1", nombres: "Pablo", paterno: "Zumelzu", materno: "-", direccion: "Avda. Siempre Viva", correo: "ingeniero1@gmail.com", telefono: "78787878", clave: "pantalla1", tipo: 2, creadoPor:"admin").save(failOnError: true)
            new Usuario(rut: "16511533-k", nombres: "Adolfo", paterno: "Gonzalez", materno: "-", direccion: "-", correo: "usuarioadmindos@grails.org", telefono: "-", clave: "qwerty", tipo: 1, creadoPor:"admin").save(failOnError: true)
            new Usuario(rut: "15524533-k", nombres: "Pablo", paterno: "Santana", materno: "-", direccion: "-", correo: "usuarioadminuno@grails.org", telefono: "74253696", clave: "qwerty", tipo: 1, creadoPor:"admin").save(failOnError: true)
        }

        if (!Empresa.list()) {
            new Empresa(rut: "78130370-4", nombre: "C.R.T. Ltda.", razonSocial: "Corporación de Recursos en Telecomunicaciones Ltda.", giro: "Salud", gerente: "Grails", tipo: "Sofware", fechaCreacion: "2016-08-19 11:49:00.0", telefono: "232323", direccion: "Direccion 1", correo: "empresatestuno@test.com", creadoPor:"admin").save(failOnError: true)
            new Empresa(rut: "85244300-6", nombre: "Caballero y Cía. Ltda.", razonSocial: "Caballero y Cía. Ltda.", giro: "Salud", gerente: "Grails", tipo: "Sofware", fechaCreacion: "2016-08-19 11:49:00.0", telefono: "232323", direccion: "Direccion 1", correo: "empresatestuno@test.com", creadoPor:"admin").save(failOnError: true)
            new Empresa(rut: "50117670-2", nombre: "Cabello e Hijo Ltda.", razonSocial: "Cabello e Hijo Ltda.", giro: "Salud", gerente: "Grails", tipo: "Sofware", fechaCreacion: "2016-08-19 11:49:00.0", telefono: "232323", direccion: "Direccion 1", correo: "empresatestuno@test.com", creadoPor:"admin").save(failOnError: true)
            new Empresa(rut: "79625580-3", nombre: "Cabrini Hermanos Ltda.", razonSocial: "Cabrini Hermanos Ltda.", giro: "Salud", gerente: "Grails", tipo: "Sofware", fechaCreacion: "2016-08-19 11:49:00.0", telefono: "232323", direccion: "Direccion 1", correo: "empresatestuno@test.com", creadoPor:"admin").save(failOnError: true)
            new Empresa(rut: "5028540-5", nombre: "Cáceres Barahona, Héctor Enrique", razonSocial: "Cáceres Barahona, Héctor Enrique", giro: "Salud", gerente: "Grails", tipo: "Sofware", fechaCreacion: "2016-08-19 11:49:00.0", telefono: "232323", direccion: "Direccion 1", correo: "empresatestuno@test.com", creadoPor:"admin").save(failOnError: true)
            new Empresa(rut: "96654210-1", nombre: "Cachemiras S.S.", razonSocial: "Tejidos Grissu S.A.", giro: "Salud", gerente: "Grails", tipo: "Sofware", fechaCreacion: "2016-08-19 11:49:00.0", telefono: "232323", direccion: "Direccion 1", correo: "empresatestuno@test.com", creadoPor:"admin").save(failOnError: true)
            new Empresa(rut: "96716020-2", nombre: "Cade Grayson Chile S.A.", razonSocial: "Cade Grayson Chile S.A.", giro: "Salud", gerente: "Grails", tipo: "Sofware", fechaCreacion: "2016-08-19 11:49:00.0", telefono: "232323", direccion: "Direccion 1", correo: "empresatestuno@test.com", creadoPor:"admin").save(failOnError: true)
            new Empresa(rut: "96583240-8", nombre: "Cadem S.A.", razonSocial: "Consultores Asociados de Marketing Cadem S.A.", giro: "Salud", gerente: "Grails", tipo: "Sofware", fechaCreacion: "2016-08-19 11:49:00.0", telefono: "232323", direccion: "Direccion 1", correo: "empresatestuno@test.com", creadoPor:"admin").save(failOnError: true)
            new Empresa(rut: "76484420-3", nombre: "Cadenas Toqui", razonSocial: "Comercial Toqui Ltda.", giro: "Salud", gerente: "Grails", tipo: "Sofware", fechaCreacion: "2016-08-19 11:49:00.0", telefono: "232323", direccion: "Direccion 1", correo: "empresatestuno@test.com", creadoPor:"admin").save(failOnError: true)
            new Empresa(rut: "96973190-8", nombre: "Cadetech S.A.", razonSocial: "Cadetech S.A.", giro: "Salud", gerente: "Grails", tipo: "Sofware", fechaCreacion: "2016-08-19 11:49:00.0", telefono: "232323", direccion: "Direccion 1", correo: "empresatestuno@test.com", creadoPor:"admin").save(failOnError: true)
            new Empresa(rut: "79649310-0", nombre: "C.M. (Chile) Ltda.", razonSocial: "Sistemas de Cielos Metálicos Ltda.", giro: "Salud", gerente: "Grails", tipo: "Sofware", fechaCreacion: "2016-08-19 11:49:00.0", telefono: "232323", direccion: "Direccion 1", correo: "empresatestuno@test.com", creadoPor:"admin").save(failOnError: true)
        }

        if (!Region.list()) {
            new Region(nombre:"Puerto Montt", codigo: 1).save(failOnError: true)
        }
        if (!Programa.list()) {
            new Programa(codigo: "2",nombre: "Compite +1000", region:1, presupuesto: 1200000, fechaInicio: "2016-08-19 11:49:00.0", fechaFin: "2016-08-19 11:49:00.0", estado: "ACTIVO", tipo: "PRIVADO",duracion:10, version:1, centroCosto: 321, usuario: 1, creadoPor: "admin").save(failOnError: true)
            new Programa(codigo: "4",nombre: "Compite Innova", region:1, presupuesto: 1200000, fechaInicio: "2016-08-19 11:49:00.0", fechaFin: "2016-08-19 11:49:00.0", estado: "ACTIVO", tipo: "PUBLICO",duracion:10, version:1, centroCosto: 341, usuario: 1, creadoPor: "admin").save(failOnError: true)
            new Programa(codigo: "5",nombre: "Consultoría", region:1, presupuesto: 1200000, fechaInicio: "2016-08-19 11:49:00.0", fechaFin: "2016-08-19 11:49:00.0", estado: "ACTIVO", tipo: "NO APLICA",duracion:10, version:1, centroCosto: 351, usuario: 1, creadoPor: "admin").save(failOnError: true)
        }

        if (!Proyecto.list()) {
            new Proyecto(codigo: "PR-01", presupuesto: 1200000, nombre: "Mozilla - Phoenix", fechaCreacion: "2016-01-19 11:49:00.0", fechaFin: "2018-01-19 11:49:00.0", estado: "ACTIVO", tipo: "PUBLICO",empresa: 1, programa: 1, creadoPor:"admin").save(failOnError: true)
            new Proyecto(codigo: "PR-02", presupuesto: 800000, nombre: "Mozilla - Deer Park", fechaCreacion: "2016-01-01 00:00:00.0", fechaFin: "2018-01-19 11:49:00.0", estado: "ACTIVO", tipo: "PUBLICO", empresa: 2, programa: 1, creadoPor:"admin").save(failOnError: true)
            new Proyecto(codigo: "PR-03", presupuesto: 2500000, nombre: "Mozilla - Bon Echo", fechaCreacion: "2016-01-01 00:00:00.0", fechaFin: "2018-01-19 11:49:00.0", estado: "ACTIVO", tipo: "PRIVADO", empresa: 3, programa:2,creadoPor:"admin").save(failOnError: true)
            new Proyecto(codigo: "PR-04", presupuesto: 2500000, nombre: "Mozilla - Gran Paradiso", fechaCreacion: "2016-02-01 00:00:00.0", fechaFin: "2018-01-19 11:49:00.0", estado: "ACTIVO", tipo: "PUBLICO", empresa: 4, programa:3,creadoPor:"admin").save(failOnError: true)
            new Proyecto(codigo: "PR-05", presupuesto: 2500000, nombre: "Mozilla - Shiretoko", fechaCreacion: "2016-02-01 00:00:00.0", fechaFin: "2018-01-19 11:49:00.0", estado: "ACTIVO", tipo: "PRIVADO", empresa: 5, programa:1,creadoPor:"admin").save(failOnError: true)
            new Proyecto(codigo: "PR-06", presupuesto: 2500000, nombre: "Mozilla - Namoroka", fechaCreacion: "2016-02-01 00:00:00.0", fechaFin: "2018-01-19 11:49:00.0", estado: "ACTIVO", tipo: "PUBLICO", empresa: 6, programa:1,creadoPor:"admin").save(failOnError: true)
            new Proyecto(codigo: "PR-07", presupuesto: 2500000, nombre: "Microsoft - Janus.1", fechaCreacion: "2016-03-01 00:00:00.0", fechaFin: "2018-01-19 11:49:00.0", estado: "ACTIVO", tipo: "PRIVADO", empresa: 7, programa:2,creadoPor:"admin").save(failOnError: true)
            new Proyecto(codigo: "PR-08", presupuesto: 2500000, nombre: "Microsoft - Chicago", fechaCreacion: "2016-03-01 00:00:00.0", fechaFin: "2018-01-19 11:49:00.0", estado: "ACTIVO", tipo: "PUBLICO", empresa: 8, programa:3,creadoPor:"admin").save(failOnError: true)
            new Proyecto(codigo: "PR-09", presupuesto: 2500000, nombre: "Microsoft - O’Hare", fechaCreacion: "2016-03-01 00:00:00.0", fechaFin: "2018-01-19 11:49:00.0", estado: "ACTIVO", tipo: "PUBLICO", empresa: 1, programa:3,creadoPor:"admin").save(failOnError: true)
            new Proyecto(codigo: "PR-10", presupuesto: 2500000, nombre: "Microsoft - Memphis", fechaCreacion: "2016-04-01 00:00:00.0", fechaFin: "2018-01-19 11:49:00.0", estado: "ACTIVO", tipo: "PRIVADO", empresa: 2, programa:3,creadoPor:"admin").save(failOnError: true)
            new Proyecto(codigo: "PR-11", presupuesto: 2500000, nombre: "Microsoft - Cairo", fechaCreacion: "2016-04-01 00:00:00.0", fechaFin: "2018-01-19 11:49:00.0", estado: "ACTIVO", tipo: "PUBLICO", empresa: 1, programa:3,creadoPor:"admin").save(failOnError: true)
            new Proyecto(codigo: "PR-12", presupuesto: 2500000, nombre: "Microsoft - Whistler", fechaCreacion: "2016-04-01 00:00:00.0", fechaFin: "2018-01-19 11:49:00.0", estado: "ACTIVO", tipo: "PUBLICO", empresa: 2, programa:3,creadoPor:"admin").save(failOnError: true)
            new Proyecto(codigo: "PR-13", presupuesto: 2500000, nombre: "Microsoft - Longhorn", fechaCreacion: "2016-04-01 00:00:00.0", fechaFin: "2018-01-19 11:49:00.0", estado: "ACTIVO", tipo: "PUBLICO", empresa: 1, programa:3,creadoPor:"admin").save(failOnError: true)
            new Proyecto(codigo: "PR-14", presupuesto: 2500000, nombre: "Microsoft - Vienna", fechaCreacion: "2016-05-01 00:00:00.0", fechaFin: "2018-01-19 11:49:00.0", estado: "ACTIVO", tipo: "PUBLICO", empresa: 2, programa:1,creadoPor:"admin").save(failOnError: true)
            new Proyecto(codigo: "PR-15", presupuesto: 2500000, nombre: "Canonical - Warty Warthog", fechaCreacion: "2016-05-01 00:00:00.0", fechaFin: "2018-01-19 11:49:00.0", estado: "ACTIVO", tipo: "PUBLICO", empresa: 2, programa:1,creadoPor:"admin").save(failOnError: true)
            new Proyecto(codigo: "PR-16", presupuesto: 2500000, nombre: "Canonical - Hoary Hedgehog", fechaCreacion: "2016-05-01 00:00:00.0", fechaFin: "2018-01-19 11:49:00.0", estado: "ACTIVO", tipo: "PRIVADO", empresa: 4, programa:1,creadoPor:"admin").save(failOnError: true)
            new Proyecto(codigo: "PR-17", presupuesto: 2500000, nombre: "Canonical - Breezy Badger", fechaCreacion: "2016-06-01 00:00:00.0", fechaFin: "2018-01-19 11:49:00.0", estado: "ACTIVO", tipo: "PRIVADO", empresa: 3, programa:2,creadoPor:"admin").save(failOnError: true)
            new Proyecto(codigo: "PR-18", presupuesto: 2500000, nombre: "Canonical - Dapper Drake", fechaCreacion: "2016-06-01 00:00:00.0", fechaFin: "2018-01-19 11:49:00.0", estado: "ACTIVO", tipo: "PUBLICO", empresa: 3, programa:2,creadoPor:"admin").save(failOnError: true)
            new Proyecto(codigo: "PR-19", presupuesto: 2500000, nombre: "Canonical - Jaunty Jackalope", fechaCreacion: "2016-06-01 00:00:00.0", fechaFin: "2018-01-19 11:49:00.0", estado: "ACTIVO", tipo: "PRIVADO", empresa: 2, programa:3,creadoPor:"admin").save(failOnError: true)
            new Proyecto(codigo: "PR-20", presupuesto: 2500000, nombre: "Canonical - Karmic Koala", fechaCreacion: "2016-07-01 00:00:00.0", fechaFin: "2018-01-19 11:49:00.0", estado: "ACTIVO", tipo: "PRIVADO", empresa: 2, programa:1,creadoPor:"admin").save(failOnError: true)
            new Proyecto(codigo: "PR-21", presupuesto: 2500000, nombre: "Canonical - Lucid Lynx", fechaCreacion: "2016-07-01 00:00:00.0", fechaFin: "2018-01-19 11:49:00.0", estado: "ACTIVO", tipo: "PUBLICO", empresa: 5, programa:3,creadoPor:"admin").save(failOnError: true)
            new Proyecto(codigo: "PR-22", presupuesto: 2500000, nombre: "Canonical - Maverick Meerkat", fechaCreacion: "2016-07-01 00:00:00.0", fechaFin: "2018-01-19 11:49:00.0", estado: "ACTIVO", tipo: "PUBLICO", empresa: 5, programa:3,creadoPor:"admin").save(failOnError: true)
            new Proyecto(codigo: "PR-23", presupuesto: 2500000, nombre: "Apple - Pigs in Space", fechaCreacion: "2016-08-01 00:00:00.0", fechaFin: "2018-01-19 11:49:00.0", estado: "ACTIVO", tipo: "PUBLICO", empresa: 3, programa:1,creadoPor:"admin").save(failOnError: true)
            new Proyecto(codigo: "PR-24", presupuesto: 2500000, nombre: "Apple - Mozart/Capone", fechaCreacion: "2016-08-01 00:00:00.0", fechaFin: "2018-01-19 11:49:00.0", estado: "ACTIVO", tipo: "PRIVADO", empresa: 3, programa:3,creadoPor:"admin").save(failOnError: true)
            new Proyecto(codigo: "PR-25", presupuesto: 2500000, nombre: "Apple - Harmony", fechaCreacion: "2016-08-01 00:00:00.0", fechaFin: "2018-01-19 11:49:00.0", estado: "ACTIVO", tipo: "PUBLICO", empresa: 4, programa:1,creadoPor:"admin").save(failOnError: true)
            new Proyecto(codigo: "PR-26", presupuesto: 2500000, nombre: "Apple - Bride of Buster", fechaCreacion: "2016-09-01 00:00:00.0", fechaFin: "2018-01-19 11:49:00.0", estado: "ACTIVO", tipo: "PRIVADO", empresa: 4, programa:3,creadoPor:"admin").save(failOnError: true)
            new Proyecto(codigo: "PR-27", presupuesto: 2500000, nombre: "Apple - Allegro", fechaCreacion: "2016-09-01 00:00:00.0", fechaFin: "2018-01-19 11:49:00.0", estado: "ACTIVO", tipo: "PUBLICO", empresa: 4, programa:1,creadoPor:"admin").save(failOnError: true)
            new Proyecto(codigo: "PR-28", presupuesto: 2500000, nombre: "Apple - Sonata", fechaCreacion: "2016-09-01 00:00:00.0", fechaFin: "2018-01-19 11:49:00.0", estado: "ACTIVO", tipo: "PRIVADO", empresa: 7, programa:1,creadoPor:"admin").save(failOnError: true)
            new Proyecto(codigo: "PR-29", presupuesto: 2500000, nombre: "Apple - Tiger", fechaCreacion: "2016-10-01 00:00:00.0", fechaFin: "2018-01-19 11:49:00.0", estado: "ACTIVO", tipo: "PUBLICO", empresa: 7, programa:1,creadoPor:"admin").save(failOnError: true)
            new Proyecto(codigo: "PR-30", presupuesto: 2500000, nombre: "Apple - Leopard", fechaCreacion: "2016-10-01 00:00:00.0", fechaFin: "2018-01-19 11:49:00.0", estado: "ACTIVO", tipo: "PUBLICO", empresa: 5, programa:1,creadoPor:"admin").save(failOnError: true)
            new Proyecto(codigo: "PR-31", presupuesto: 2500000, nombre: "Apple - Snow Leopard", fechaCreacion: "2016-10-01 00:00:00.0", fechaFin: "2018-01-19 11:49:00.0", estado: "ACTIVO", tipo: "PRIVADO", empresa: 4, programa:1,creadoPor:"admin").save(failOnError: true)
            new Proyecto(codigo: "PR-32", presupuesto: 2500000, nombre: "Google - Cupcake", fechaCreacion: "2016-11-01 00:00:00.0", fechaFin: "2018-01-19 11:49:00.0", estado: "ACTIVO", tipo: "PUBLICO", empresa: 2, programa:1,creadoPor:"admin").save(failOnError: true)
            new Proyecto(codigo: "PR-33", presupuesto: 2500000, nombre: "Google - Donut", fechaCreacion: "2016-11-01 00:00:00.0", fechaFin: "2018-01-19 11:49:00.0", estado: "ACTIVO", tipo: "PRIVADO", empresa: 2, programa:1,creadoPor:"admin").save(failOnError: true)
            new Proyecto(codigo: "PR-34", presupuesto: 2500000, nombre: "Google - Eclair", fechaCreacion: "2016-11-01 00:00:00.0", fechaFin: "2018-01-19 11:49:00.0", estado: "ACTIVO", tipo: "PUBLICO", empresa: 5, programa:1,creadoPor:"admin").save(failOnError: true)
            new Proyecto(codigo: "PR-35", presupuesto: 2500000, nombre: "Google - FroYo", fechaCreacion: "2016-12-01 00:00:00.0", fechaFin: "2018-01-19 11:49:00.0", estado: "ACTIVO", tipo: "PRIVADO", empresa: 3, programa:1,creadoPor:"admin").save(failOnError: true)
            new Proyecto(codigo: "PR-36", presupuesto: 2500000, nombre: "Google - Gingerbread", fechaCreacion: "2016-01-01 00:00:00.0", fechaFin: "2018-01-19 11:49:00.0", estado: "ACTIVO", tipo: "PRIVADO", empresa: 2, programa:1,creadoPor:"admin").save(failOnError: true)
            new Proyecto(codigo: "PR-37", presupuesto: 2500000, nombre: "Adobe - Fast Eddy", fechaCreacion: "2016-02-01 00:00:00.0", fechaFin: "2018-01-19 11:49:00.0", estado: "ACTIVO", tipo: "PUBLICO", empresa: 2, programa:1,creadoPor:"admin").save(failOnError: true)
            new Proyecto(codigo: "PR-38", presupuesto: 2500000, nombre: "Adobe - Tiger Mountain", fechaCreacion: "2016-03-01 00:00:00.0", fechaFin: "2018-01-19 11:49:00.0", estado: "ACTIVO", tipo: "PRIVADO", empresa: 2, programa:1,creadoPor:"admin").save(failOnError: true)
            new Proyecto(codigo: "PR-39", presupuesto: 2500000, nombre: "Adobe - Liquid Sky", fechaCreacion: "2016-04-01 00:00:00.0", fechaFin: "2018-01-19 11:49:00.0", estado: "ACTIVO", tipo: "PRIVADO", empresa: 2, programa:1,creadoPor:"admin").save(failOnError: true)
            new Proyecto(codigo: "PR-40", presupuesto: 2500000, nombre: "Adobe - Dark Matter", fechaCreacion: "2016-05-01 00:00:00.0", fechaFin: "2018-01-19 11:49:00.0", estado: "ACTIVO", tipo: "PUBLICO", empresa: 2, programa:1,creadoPor:"admin").save(failOnError: true)
            new Proyecto(codigo: "PR-41", presupuesto: 2500000, nombre: "Adobe - Space Monkey", fechaCreacion: "2016-06-01 00:00:00.0", fechaFin: "2018-01-19 11:49:00.0", estado: "ACTIVO", tipo: "PRIVADO", empresa: 2, programa:1,creadoPor:"admin").save(failOnError: true)
            new Proyecto(codigo: "PR-42", presupuesto: 2500000, nombre: "Adobe - Red Pill", fechaCreacion: "2016-07-01 00:00:00.0", fechaFin: "2018-01-19 11:49:00.0", estado: "ACTIVO", tipo: "PUBLICO", empresa: 2, programa:3,creadoPor:"admin").save(failOnError: true)
            new Proyecto(codigo: "PR-43", presupuesto: 2500000, nombre: "Adobe - Stonehenge", fechaCreacion: "2016-08-01 00:00:00.0", fechaFin: "2018-01-19 11:49:00.0", estado: "ACTIVO", tipo: "PRIVADO", empresa: 2, programa:3,creadoPor:"admin").save(failOnError: true)
            new Proyecto(codigo: "PR-44", presupuesto: 2500000, nombre: "Adobe - White Rabbit", fechaCreacion: "2016-09-01 00:00:00.0", fechaFin: "2018-01-19 11:49:00.0", estado: "ACTIVO", tipo: "PRIVADO", empresa: 2, programa:3,creadoPor:"admin").save(failOnError: true)
            new Proyecto(codigo: "PR-45", presupuesto: 2500000, nombre: "Fedora - Yarrow", fechaCreacion: "2016-10-01 00:00:00.0", fechaFin: "2018-01-19 11:49:00.0", estado: "ACTIVO", tipo: "PRIVADO", empresa: 2, programa:2,creadoPor:"admin").save(failOnError: true)
            new Proyecto(codigo: "PR-46", presupuesto: 2500000, nombre: "Fedora - Bordeaux", fechaCreacion: "2016-11-01 00:00:00.0", fechaFin: "2018-01-19 11:49:00.0", estado: "ACTIVO", tipo: "PRIVADO", empresa: 1, programa:2,creadoPor:"admin").save(failOnError: true)
            new Proyecto(codigo: "PR-47", presupuesto: 2500000, nombre: "Fedora - Zod", fechaCreacion: "2016-12-01 00:00:00.0", fechaFin: "2018-01-19 11:49:00.0", estado: "ACTIVO", tipo: "PRIVADO", empresa: 2, programa:2,creadoPor:"admin").save(failOnError: true)
            new Proyecto(codigo: "PR-48", presupuesto: 2500000, nombre: "Fedora - Moonshine ", fechaCreacion: "2016-01-01 00:00:00.0", fechaFin: "2018-01-19 11:49:00.0", estado: "ACTIVO", tipo: "PRIVADO", empresa: 1, programa:2,creadoPor:"admin").save(failOnError: true)
            new Proyecto(codigo: "PR-49", presupuesto: 2500000, nombre: "Fedora - Werewolf ", fechaCreacion: "2016-02-01 00:00:00.0", fechaFin: "2018-01-19 11:49:00.0", estado: "ACTIVO", tipo: "PRIVADO", empresa: 1, programa:2,creadoPor:"admin").save(failOnError: true)
            new Proyecto(codigo: "PR-50", presupuesto: 2500000, nombre: "Fedora - Sulphur ", fechaCreacion: "2016-03-01 00:00:00.0", fechaFin: "2018-01-19 11:49:00.0", estado: "ACTIVO", tipo: "PUBLICO", empresa: 2, programa:2,creadoPor:"admin").save(failOnError: true)
            new Proyecto(codigo: "PR-51", presupuesto: 2500000, nombre: "Debian - Slink", fechaCreacion: "2016-04-01 00:00:00.0", fechaFin: "2018-01-19 11:49:00.0", estado: "ACTIVO", tipo: "PRIVADO", empresa: 6, programa:2,creadoPor:"admin").save(failOnError: true)
            new Proyecto(codigo: "PR-52", presupuesto: 2500000, nombre: "Debian - Potato", fechaCreacion: "2016-05-01 00:00:00.0", fechaFin: "2018-01-19 11:49:00.0", estado: "ACTIVO", tipo: "PUBLICO", empresa: 1, programa:1,creadoPor:"admin").save(failOnError: true)
            new Proyecto(codigo: "PR-53", presupuesto: 2500000, nombre: "Debian - Woody", fechaCreacion: "2016-06-01 00:00:00.0", fechaFin: "2018-01-19 11:49:00.0", estado: "ACTIVO", tipo: "PRIVADO", empresa: 7, programa:1,creadoPor:"admin").save(failOnError: true)
            new Proyecto(codigo: "PR-54", presupuesto: 2500000, nombre: "Debian - Sarge", fechaCreacion: "2016-07-01 00:00:00.0", fechaFin: "2018-01-19 11:49:00.0", estado: "ACTIVO", tipo: "PUBLICO", empresa: 6, programa:1,creadoPor:"admin").save(failOnError: true)
            new Proyecto(codigo: "PR-55", presupuesto: 2500000, nombre: "Debian - Etch", fechaCreacion: "2016-08-01 00:00:00.0", fechaFin: "2018-01-19 11:49:00.0", estado: "ACTIVO", tipo: "PUBLICO", empresa: 5, programa:1,creadoPor:"admin").save(failOnError: true)
            new Proyecto(codigo: "PR-56", presupuesto: 2500000, nombre: "Debian - Lenny", fechaCreacion: "2016-09-01 00:00:00.0", fechaFin: "2018-01-19 11:49:00.0", estado: "ACTIVO", tipo: "PUBLICO", empresa: 2, programa:1,creadoPor:"admin").save(failOnError: true)
            new Proyecto(codigo: "PR-57", presupuesto: 2500000, nombre: "Debian - Squeeze", fechaCreacion: "2016-10-01 00:00:00.0", fechaFin: "2018-01-19 11:49:00.0", estado: "ACTIVO", tipo: "PUBLICO", empresa: 5, programa:1,creadoPor:"admin").save(failOnError: true)
            new Proyecto(codigo: "PR-58", presupuesto: 2500000, nombre: "Debian - Sid", fechaCreacion: "2016-11-01 00:00:00.0", fechaFin: "2018-01-19 11:49:00.0", estado: "ACTIVO", tipo: "PRIVADO", empresa: 2, programa:1,creadoPor:"admin").save(failOnError: true)
        }

        if (!Rendicion.list()) {
            new Rendicion(fecha: "2016-08-19 11:49:00.0", tipoRendicion: "Reembolso de gastos", sedeEnvio: "Puerto Montt",aprobacion: "Si", total:240000, totalAnticipado: 10000, totalRendido: 340000, usuario: 3, programa: 1, creadoPor:"admin").save(failOnError: true)
        }

        if (!Item.list()) {
            new Item(nombre:"mouse como item uno", centroCosto: 341, itemPresupuestario: "ALIMENTACION PROGRAMAS", descripcion: "Servicios básicos", valor: 25000, fechaCreacion: "2016-08-19 11:49:00.0", creadoPor:"admin").save(failOnError: true)

        }
        if (!Egreso.list()) {
            new Egreso(aprobacion: "SI", concepto: "Servicios Básicos", fechaCreacion: "2016-08-19 11:49:00.0", monto: 12000,  nDocumento: "234567", rutEmpresa: "98544511-7", pagadoA: "Pablo Santana", tipoDocumento:"BOLETA", tipoMoneda: "CLP", usuario: 1, programa: 1,item: 1, rendicion: 1, proyecto: 1, creadoPor:"admin").save(failOnError: true)
            new Egreso(aprobacion: "SI", concepto: "Servicio de Automotora", fechaCreacion: "2016-08-19 11:49:00.0", monto: 13000,  nDocumento: "667", rutEmpresa: "65987234-1", pagadoA: "Rodrigo Cardenas", tipoDocumento:"FACTURA", tipoMoneda: "CLP", usuario: 1, programa: 1,item: 1, rendicion: 1, proyecto: 1, creadoPor:"admin").save(failOnError: true)
            new Egreso(aprobacion: "NO", concepto: "Servicios tecnicos", fechaCreacion: "2016-08-19 11:49:00.0", monto: 13000,  nDocumento: "4555", rutEmpresa: "65187214-4", pagadoA: "Pablo Zumelzu", tipoDocumento:"BOLETA", tipoMoneda: "CLP", usuario: 1, programa: 1,item: 1, rendicion: 1, proyecto: 1, creadoPor:"admin").save(failOnError: true)
        }

        if (!Movilizacion.list()) {
            new Movilizacion(fechaCreacion: "2016-08-19 11:49:00.0", motivoEmpresa: "Viaje", direccion: "avenida", distancia: 8, concepto: "Movilizacion regional", tipo: "peaje", precio:10000, creadoPor:"admin", programa: 1, usuario: 1).save(failOnError: true)
            new Movilizacion(fechaCreacion: "2016-08-19 11:49:00.0", motivoEmpresa: "Peaje", direccion: "Pto Varas", distancia: 8, concepto: "Movilizacion regional", tipo: "peaje", precio:10000, creadoPor:"admin", programa: 1, usuario: 2).save(failOnError: true)
            new Movilizacion(fechaCreacion: "2016-08-19 11:49:00.0", motivoEmpresa: "Viaje", direccion: "avenida", distancia: 8, concepto: "Movilizacion regional", tipo: "peaje", precio:10000, creadoPor:"admin", programa: 1, usuario: 2).save(failOnError: true)
        }

        if (!EgresoMov.list()) {
            new EgresoMov(creadoPor:"admin", fecha:"2016-08-19 11:49:00.0", egreso: 1, movilizacion: 1).save(failOnError: true)
        }

        if (!Auditoria.list()) {
            new Auditoria(fecha: "2016-08-19 11:49:00.0", nombre:"Auditoria numeor 1", motivo:"estandar", descripcion: "Auditoria cargada automaticamente", estado: "APROBADA", usuario: 1, programa: 1, creadoPor:"admin").save(failOnError: true)
            new Auditoria(fecha: "2016-08-19 11:49:00.0", nombre:"Auditoria numeor 2", motivo:"pro", descripcion: "Auditoria cargada automaticamente", estado: "RECHAZADA", usuario: 2, programa: 1, creadoPor:"admin").save(failOnError: true)
        }

        if (!DetalleAudRen.list()) {
            new DetalleAudRen(fecha: "2016-08-19 11:49:00.0", detalle: "Informacion sobre auditoria 1 y rendicion 1.", auditoria: 1, rendicion: 1, creadoPor:"admin").save(failOnError: true)
        }

        if (!Transporte.list()) {
            new Transporte(patente: "ZVGGDD", tipo: "SEDAN", marca: "BMW", modelo: "z3", combustible: "BENCINA93", kmPorLitro: 20, descripcion: "Automovil estándar", usuario: 1, creadoPor:"admin").save(failOnError: true)
        }

        if (!Asignacion.list()) {
            new Asignacion(detalle: "Asignacion 1, cargada automaticamente", fecha: "2016-08-19 11:49:00.0", usuario: 1, programa: 1, creadoPor:"admin").save(failOnError: true)
            new Asignacion(detalle: "Asignación para Ingeniero 1, proyecto 2", fecha: "2016-08-10 00:0:00.0", usuario: 2, programa: 2, creadoPor:"admin").save(failOnError: true)
            new Asignacion(detalle: "Asignación para Ingeniero 1, proyecto 3", fecha: "2016-08-10 00:0:00.0", usuario: 5, programa: 3, creadoPor:"admin").save(failOnError: true)
        }
    }

    def destroy = {

    }

}
