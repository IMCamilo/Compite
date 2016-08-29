package compite

/**
 * Created by JCARDENAS on 16-08-2016.
 */
class LoginController {

    def login(){
        if (session.usuarioLogueado){
            //en caso de llegar al login a pesar de haber iniciado sesion, redirige en base a su tipo
            switch (session.usuarioLogueado.tipo) {
                case 1 : redirect controller: "administrador", action: "index"; break
                case 2 : redirect controller: "ingeniero", action: "index"; break
            }
        }
    }

    def sigin = {
        if (request.method == 'POST') {
            def u = Usuario.findByCorreoAndClave(params.username, params.password)
            if (u) {
                //si datos son correctos
                flash.message = "Bienvenido $params.username"
                session.usuarioLogueado = u
                switch (u.tipo) {
                    case 1 : redirect controller: "administrador", action: "index"; break
                    case 2 : redirect controller: "ingeniero", action: "index"; break
                }
            } else {
                flash.message = "Usuario o contraseña incorrecta"
                redirect controller: "login", action: "login"
            }
        }
    }

    def logout = {
        session.invalidate()
        flash.message = "Sesión cerrada correctamente"
        redirect controller: "login", action: "login"
    }

}
