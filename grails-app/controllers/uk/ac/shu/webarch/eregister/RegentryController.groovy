package uk.ac.shu.webarch.eregister

import org.springframework.dao.DataIntegrityViolationException

class RegentryController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [regentryInstanceList: Regentry.list(params), regentryInstanceTotal: Regentry.count()]
    }

    def create() {
        [regentryInstance: new Regentry(params)]
    }

    def save() {
        def regentryInstance = new Regentry(params)
        if (!regentryInstance.save(flush: true)) {
            render(view: "create", model: [regentryInstance: regentryInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'regentry.label', default: 'Regentry'), regentryInstance.id])
        redirect(action: "show", id: regentryInstance.id)
    }

    def show(Long id) {
        def regentryInstance = Regentry.get(id)
        if (!regentryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'regentry.label', default: 'Regentry'), id])
            redirect(action: "list")
            return
        }

        [regentryInstance: regentryInstance]
    }

    def edit(Long id) {
        def regentryInstance = Regentry.get(id)
        if (!regentryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'regentry.label', default: 'Regentry'), id])
            redirect(action: "list")
            return
        }

        [regentryInstance: regentryInstance]
    }

    def update(Long id, Long version) {
        def regentryInstance = Regentry.get(id)
        if (!regentryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'regentry.label', default: 'Regentry'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (regentryInstance.version > version) {
                regentryInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'regentry.label', default: 'Regentry')] as Object[],
                          "Another user has updated this Regentry while you were editing")
                render(view: "edit", model: [regentryInstance: regentryInstance])
                return
            }
        }

        regentryInstance.properties = params

        if (!regentryInstance.save(flush: true)) {
            render(view: "edit", model: [regentryInstance: regentryInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'regentry.label', default: 'Regentry'), regentryInstance.id])
        redirect(action: "show", id: regentryInstance.id)
    }

    def delete(Long id) {
        def regentryInstance = Regentry.get(id)
        if (!regentryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'regentry.label', default: 'Regentry'), id])
            redirect(action: "list")
            return
        }

        try {
            regentryInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'regentry.label', default: 'Regentry'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'regentry.label', default: 'Regentry'), id])
            redirect(action: "show", id: id)
        }
    }
}
