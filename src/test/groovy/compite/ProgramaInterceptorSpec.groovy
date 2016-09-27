package compite


import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(ProgramaInterceptor)
class ProgramaInterceptorSpec extends Specification {

    def setup() {
    }

    def cleanup() {

    }

    void "Test programa interceptor matching"() {
        when:"A request matches the interceptor"
            withRequest(controller:"programa")

        then:"The interceptor does match"
            interceptor.doesMatch()
    }
}
