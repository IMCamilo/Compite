package compite


class AdministradorInterceptor {

    boolean before() {
        switch(session.usuarioLogueado.tipo) {
            case 1:
                true
            break
            case 2:
                flash.message = "Para ingresar a esta pagina debes ser Administrador"
                redirect controller: "ingeniero", action: "proyectos"
            break
            default:
                flash.message = "Para ingresar a esta pagina debe iniciar sesión"
                redirect controller: "login", action: "login"
            break
        }
    }

    boolean after() { true }

    void afterView() {
        // no-op
    }
}
