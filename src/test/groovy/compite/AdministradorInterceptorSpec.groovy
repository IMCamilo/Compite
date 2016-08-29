package compite


import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(AdministradorInterceptor)
class AdministradorInterceptorSpec extends Specification {

    def setup() {
    }

    def cleanup() {

    }

    void "Test administrador interceptor matching"() {
        when:"A request matches the interceptor"
            withRequest(controller:"administrador")

        then:"The interceptor does match"
            interceptor.doesMatch()
    }
}
