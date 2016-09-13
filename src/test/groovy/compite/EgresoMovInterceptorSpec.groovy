package compite


import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(EgresoMovInterceptor)
class EgresoMovInterceptorSpec extends Specification {

    def setup() {
    }

    def cleanup() {

    }

    void "Test egresoMov interceptor matching"() {
        when:"A request matches the interceptor"
            withRequest(controller:"egresoMov")

        then:"The interceptor does match"
            interceptor.doesMatch()
    }
}
