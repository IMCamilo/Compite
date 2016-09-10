package compite


import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(AsignacionInterceptor)
class AsignacionInterceptorSpec extends Specification {

    def setup() {
    }

    def cleanup() {

    }

    void "Test asignacion interceptor matching"() {
        when:"A request matches the interceptor"
            withRequest(controller:"asignacion")

        then:"The interceptor does match"
            interceptor.doesMatch()
    }
}
