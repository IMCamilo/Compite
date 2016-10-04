package compite


import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(EgresoIngInterceptor)
class EgresoIngInterceptorSpec extends Specification {

    def setup() {
    }

    def cleanup() {

    }

    void "Test egresoIng interceptor matching"() {
        when:"A request matches the interceptor"
            withRequest(controller:"egresoIng")

        then:"The interceptor does match"
            interceptor.doesMatch()
    }
}
