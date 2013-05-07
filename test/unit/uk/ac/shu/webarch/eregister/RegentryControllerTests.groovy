package uk.ac.shu.webarch.eregister



import org.junit.*
import grails.test.mixin.*

@TestFor(RegentryController)
@Mock(Regentry)
class RegentryControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/regentry/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.regentryInstanceList.size() == 0
        assert model.regentryInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.regentryInstance != null
    }

    void testSave() {
        controller.save()

        assert model.regentryInstance != null
        assert view == '/regentry/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/regentry/show/1'
        assert controller.flash.message != null
        assert Regentry.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/regentry/list'

        populateValidParams(params)
        def regentry = new Regentry(params)

        assert regentry.save() != null

        params.id = regentry.id

        def model = controller.show()

        assert model.regentryInstance == regentry
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/regentry/list'

        populateValidParams(params)
        def regentry = new Regentry(params)

        assert regentry.save() != null

        params.id = regentry.id

        def model = controller.edit()

        assert model.regentryInstance == regentry
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/regentry/list'

        response.reset()

        populateValidParams(params)
        def regentry = new Regentry(params)

        assert regentry.save() != null

        // test invalid parameters in update
        params.id = regentry.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/regentry/edit"
        assert model.regentryInstance != null

        regentry.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/regentry/show/$regentry.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        regentry.clearErrors()

        populateValidParams(params)
        params.id = regentry.id
        params.version = -1
        controller.update()

        assert view == "/regentry/edit"
        assert model.regentryInstance != null
        assert model.regentryInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/regentry/list'

        response.reset()

        populateValidParams(params)
        def regentry = new Regentry(params)

        assert regentry.save() != null
        assert Regentry.count() == 1

        params.id = regentry.id

        controller.delete()

        assert Regentry.count() == 0
        assert Regentry.get(regentry.id) == null
        assert response.redirectedUrl == '/regentry/list'
    }
}
