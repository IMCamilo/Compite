package compite


import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(RendicionInterceptor)
class RendicionInterceptorSpec extends Specification {

    def setup() {
    }

    def cleanup() {

    }

    void "Test rendicion interceptor matching"() {
        when:"A request matches the interceptor"
            withRequest(controller:"rendicion")

        then:"The interceptor does match"
            interceptor.doesMatch()
    }
}
