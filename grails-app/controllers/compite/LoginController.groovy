package compite

/**
 * Created by JCARDENAS on 16-08-2016.
 */
class LoginController {

    def login(){

    }

    def sigin = {
        if (request.method == 'POST') {
            def u = Usuario.findByRutAndClave(params.username, params.password)
            println "--> $u"
            if (u) {
                //si datos son correctos
                flash.message = "Bienvenido $params.username"
                session.datosUsuario = u
                redirect controller: "usuario", action: "index"
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
        redirect controller: "login", action: "login"
    }


}
