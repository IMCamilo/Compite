package compite


import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(EgresoInterceptor)
class EgresoInterceptorSpec extends Specification {

    def setup() {
    }

    def cleanup() {

    }

    void "Test egreso interceptor matching"() {
        when:"A request matches the interceptor"
            withRequest(controller:"egreso")

        then:"The interceptor does match"
            interceptor.doesMatch()
    }
}
