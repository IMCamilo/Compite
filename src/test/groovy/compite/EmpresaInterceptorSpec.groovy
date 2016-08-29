package compite


import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(EmpresaInterceptor)
class EmpresaInterceptorSpec extends Specification {

    def setup() {
    }

    def cleanup() {

    }

    void "Test empresa interceptor matching"() {
        when:"A request matches the interceptor"
            withRequest(controller:"empresa")

        then:"The interceptor does match"
            interceptor.doesMatch()
    }
}
