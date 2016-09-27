package compite


import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(RegionInterceptor)
class RegionInterceptorSpec extends Specification {

    def setup() {
    }

    def cleanup() {

    }

    void "Test region interceptor matching"() {
        when:"A request matches the interceptor"
            withRequest(controller:"region")

        then:"The interceptor does match"
            interceptor.doesMatch()
    }
}
