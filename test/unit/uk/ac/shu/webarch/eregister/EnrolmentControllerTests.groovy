package uk.ac.shu.webarch.eregister



import org.junit.*
import grails.test.mixin.*

@TestFor(EnrolmentController)
@Mock(Enrolment)
class EnrolmentControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/enrolment/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.enrolmentInstanceList.size() == 0
        assert model.enrolmentInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.enrolmentInstance != null
    }

    void testSave() {
        controller.save()

        assert model.enrolmentInstance != null
        assert view == '/enrolment/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/enrolment/show/1'
        assert controller.flash.message != null
        assert Enrolment.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/enrolment/list'

        populateValidParams(params)
        def enrolment = new Enrolment(params)

        assert enrolment.save() != null

        params.id = enrolment.id

        def model = controller.show()

        assert model.enrolmentInstance == enrolment
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/enrolment/list'

        populateValidParams(params)
        def enrolment = new Enrolment(params)

        assert enrolment.save() != null

        params.id = enrolment.id

        def model = controller.edit()

        assert model.enrolmentInstance == enrolment
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/enrolment/list'

        response.reset()

        populateValidParams(params)
        def enrolment = new Enrolment(params)

        assert enrolment.save() != null

        // test invalid parameters in update
        params.id = enrolment.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/enrolment/edit"
        assert model.enrolmentInstance != null

        enrolment.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/enrolment/show/$enrolment.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        enrolment.clearErrors()

        populateValidParams(params)
        params.id = enrolment.id
        params.version = -1
        controller.update()

        assert view == "/enrolment/edit"
        assert model.enrolmentInstance != null
        assert model.enrolmentInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/enrolment/list'

        response.reset()

        populateValidParams(params)
        def enrolment = new Enrolment(params)

        assert enrolment.save() != null
        assert Enrolment.count() == 1

        params.id = enrolment.id

        controller.delete()

        assert Enrolment.count() == 0
        assert Enrolment.get(enrolment.id) == null
        assert response.redirectedUrl == '/enrolment/list'
    }
}
