package uk.ac.shu.webarch.eregister



import org.junit.*
import grails.test.mixin.*

@TestFor(RegsheetController)
@Mock(Regsheet)
class RegsheetControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/regsheet/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.regsheetInstanceList.size() == 0
        assert model.regsheetInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.regsheetInstance != null
    }

    void testSave() {
        controller.save()

        assert model.regsheetInstance != null
        assert view == '/regsheet/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/regsheet/show/1'
        assert controller.flash.message != null
        assert Regsheet.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/regsheet/list'

        populateValidParams(params)
        def regsheet = new Regsheet(params)

        assert regsheet.save() != null

        params.id = regsheet.id

        def model = controller.show()

        assert model.regsheetInstance == regsheet
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/regsheet/list'

        populateValidParams(params)
        def regsheet = new Regsheet(params)

        assert regsheet.save() != null

        params.id = regsheet.id

        def model = controller.edit()

        assert model.regsheetInstance == regsheet
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/regsheet/list'

        response.reset()

        populateValidParams(params)
        def regsheet = new Regsheet(params)

        assert regsheet.save() != null

        // test invalid parameters in update
        params.id = regsheet.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/regsheet/edit"
        assert model.regsheetInstance != null

        regsheet.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/regsheet/show/$regsheet.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        regsheet.clearErrors()

        populateValidParams(params)
        params.id = regsheet.id
        params.version = -1
        controller.update()

        assert view == "/regsheet/edit"
        assert model.regsheetInstance != null
        assert model.regsheetInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/regsheet/list'

        response.reset()

        populateValidParams(params)
        def regsheet = new Regsheet(params)

        assert regsheet.save() != null
        assert Regsheet.count() == 1

        params.id = regsheet.id

        controller.delete()

        assert Regsheet.count() == 0
        assert Regsheet.get(regsheet.id) == null
        assert response.redirectedUrl == '/regsheet/list'
    }
}
