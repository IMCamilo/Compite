package compite


import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(ProyectoInterceptor)
class ProyectoInterceptorSpec extends Specification {

    def setup() {
    }

    def cleanup() {

    }

    void "Test proyecto interceptor matching"() {
        when:"A request matches the interceptor"
            withRequest(controller:"proyecto")

        then:"The interceptor does match"
            interceptor.doesMatch()
    }
}
