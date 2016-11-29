package compite


import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(ManualIngenieroInterceptor)
class ManualIngenieroInterceptorSpec extends Specification {

    def setup() {
    }

    def cleanup() {

    }

    void "Test manualIngeniero interceptor matching"() {
        when:"A request matches the interceptor"
            withRequest(controller:"manualIngeniero")

        then:"The interceptor does match"
            interceptor.doesMatch()
    }
}
