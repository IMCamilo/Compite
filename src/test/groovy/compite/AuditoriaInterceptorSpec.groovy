package compite


import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(AuditoriaInterceptor)
class AuditoriaInterceptorSpec extends Specification {

    def setup() {
    }

    def cleanup() {

    }

    void "Test auditoria interceptor matching"() {
        when:"A request matches the interceptor"
            withRequest(controller:"auditoria")

        then:"The interceptor does match"
            interceptor.doesMatch()
    }
}
