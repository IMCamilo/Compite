package compite


import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(ItemInterceptor)
class ItemInterceptorSpec extends Specification {

    def setup() {
    }

    def cleanup() {

    }

    void "Test item interceptor matching"() {
        when:"A request matches the interceptor"
            withRequest(controller:"item")

        then:"The interceptor does match"
            interceptor.doesMatch()
    }
}
