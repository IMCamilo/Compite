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
            new Proyecto(codigo: "PR-01", presupuesto: 1200000, nombre: "Samsung tecnologias etc", fechaCreacion: "2016-08-19 11:49:00.0", fechaFin: "2016-08-19 11:49:00.0", estado: "ACTIVO", tipo: "PUBLICO",empresa: 2, programa: 1, creadoPor:"admin").save(failOnError: true)
            new Proyecto(codigo: "PR-02", presupuesto: 800000, nombre: "Proyecto 1 Para el Ingeniero 1", fechaCreacion: "2016-08-01 00:00:00.0", fechaFin: "2016-12-31 00:00:00.0", estado: "ACTIVO", tipo: "PUBLICO", empresa: 2, programa: 1, creadoPor:"admin").save(failOnError: true)
            new Proyecto(codigo: "PR-03", presupuesto: 2500000, nombre: "Proyecto 2 Para el Ingeniero 1", fechaCreacion: "2016-08-01 00:00:00.0", fechaFin: "2016-12-31 00:00:00.0", estado: "ACTIVO", tipo: "PRIVADO", empresa: 2, programa:1,creadoPor:"admin").save(failOnError: true)
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
