package compite


class DetalleAudRenInterceptor {

    boolean before() {
        if (session.usuarioLogueado){
            true
        } else {
            flash.message = "Para ingresar a esta pagina debe iniciar sesión"
            redirect controller: "login", action: "login"
        }
    }

    boolean after() { true }

    void afterView() {
        // no-op
    }
}
