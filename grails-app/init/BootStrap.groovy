import compite.Usuario

class BootStrap {

    def init = { servletContext ->
        //cuenta los usuarios y
        //si que no existen crea este de semilla
        if (!Usuario.count()) {
            new Usuario(
                    rut: "643531234-k",
                    nombres: "usuarioTest",
                    paterno: "-",
                    materno: "-",
                    direccion: "-",
                    correo: "usuarioadmin@grails.org",
                    telefono: "-",
                    clave: "qwerty",
                    tipo: 1)
                    .save(failOnError: true)
        }
    }
    def destroy = {
    }
}
