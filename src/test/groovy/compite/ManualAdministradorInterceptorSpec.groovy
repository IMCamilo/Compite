package compite


import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(ManualAdministradorInterceptor)
class ManualAdministradorInterceptorSpec extends Specification {

    def setup() {
    }

    def cleanup() {

    }

    void "Test manualAdministrador interceptor matching"() {
        when:"A request matches the interceptor"
            withRequest(controller:"manualAdministrador")

        then:"The interceptor does match"
            interceptor.doesMatch()
    }
}
