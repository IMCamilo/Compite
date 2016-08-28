package compite

/**
 * Created by JCARDENAS on 16-08-2016.
 */
class LoginController {

    def login(){

    }

    def sigin = {
        if (request.method == 'POST') {
            def u = Usuario.findByCorreoAndClave(params.username, params.password)
            if (u) {
                //si datos son correctos
                flash.message = "Bienvenido $params.username"
                session.datosUsuario = u
                switch (u.tipo) {
                    case 1 : redirect controller: "administrador", action: "index"
                        break
                    case 2 : redirect controller: "ingeniero", action: "index"
                        break
                }
            } else {
                flash.message = "Usuario o contraseña incorrecta"
                redirect controller: "login", action: "login"
            }
        } else if (session.user) {
            //no permite iniciar sesion si es que ya esta logeado
            redirect(controller:'main')
        }
    }

    def logout = {
        session.invalidate()

    }


}
