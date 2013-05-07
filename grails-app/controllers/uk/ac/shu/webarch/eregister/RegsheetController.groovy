package uk.ac.shu.webarch.eregister

import org.springframework.dao.DataIntegrityViolationException

class RegsheetController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [regsheetInstanceList: Regsheet.list(params), regsheetInstanceTotal: Regsheet.count()]
    }

    def create() {
        [regsheetInstance: new Regsheet(params)]
    }

    def save() {
        def regsheetInstance = new Regsheet(params)
        if (!regsheetInstance.save(flush: true)) {
            render(view: "create", model: [regsheetInstance: regsheetInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'regsheet.label', default: 'Regsheet'), regsheetInstance.id])
        redirect(action: "show", id: regsheetInstance.id)
    }

    def show(Long id) {
        def regsheetInstance = Regsheet.get(id)
        if (!regsheetInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'regsheet.label', default: 'Regsheet'), id])
            redirect(action: "list")
            return
        }

        [regsheetInstance: regsheetInstance]
    }

    def edit(Long id) {
        def regsheetInstance = Regsheet.get(id)
        if (!regsheetInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'regsheet.label', default: 'Regsheet'), id])
            redirect(action: "list")
            return
        }

        [regsheetInstance: regsheetInstance]
    }

    def update(Long id, Long version) {
        def regsheetInstance = Regsheet.get(id)
        if (!regsheetInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'regsheet.label', default: 'Regsheet'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (regsheetInstance.version > version) {
                regsheetInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'regsheet.label', default: 'Regsheet')] as Object[],
                          "Another user has updated this Regsheet while you were editing")
                render(view: "edit", model: [regsheetInstance: regsheetInstance])
                return
            }
        }

        regsheetInstance.properties = params

        if (!regsheetInstance.save(flush: true)) {
            render(view: "edit", model: [regsheetInstance: regsheetInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'regsheet.label', default: 'Regsheet'), regsheetInstance.id])
        redirect(action: "show", id: regsheetInstance.id)
    }

    def delete(Long id) {
        def regsheetInstance = Regsheet.get(id)
        if (!regsheetInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'regsheet.label', default: 'Regsheet'), id])
            redirect(action: "list")
            return
        }

        try {
            regsheetInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'regsheet.label', default: 'Regsheet'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'regsheet.label', default: 'Regsheet'), id])
            redirect(action: "show", id: id)
        }
    }
}
