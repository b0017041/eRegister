package uk.ac.shu.webarch.eregister

import org.springframework.dao.DataIntegrityViolationException

class EnrolmentController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [enrolmentInstanceList: Enrolment.list(params), enrolmentInstanceTotal: Enrolment.count()]
    }

    def create() {
        [enrolmentInstance: new Enrolment(params)]
    }

    def save() {
        def enrolmentInstance = new Enrolment(params)
        if (!enrolmentInstance.save(flush: true)) {
            render(view: "create", model: [enrolmentInstance: enrolmentInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'enrolment.label', default: 'Enrolment'), enrolmentInstance.id])
        redirect(action: "show", id: enrolmentInstance.id)
    }

    def show(Long id) {
        def enrolmentInstance = Enrolment.get(id)
        if (!enrolmentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'enrolment.label', default: 'Enrolment'), id])
            redirect(action: "list")
            return
        }

        [enrolmentInstance: enrolmentInstance]
    }

    def edit(Long id) {
        def enrolmentInstance = Enrolment.get(id)
        if (!enrolmentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'enrolment.label', default: 'Enrolment'), id])
            redirect(action: "list")
            return
        }

        [enrolmentInstance: enrolmentInstance]
    }

    def update(Long id, Long version) {
        def enrolmentInstance = Enrolment.get(id)
        if (!enrolmentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'enrolment.label', default: 'Enrolment'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (enrolmentInstance.version > version) {
                enrolmentInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'enrolment.label', default: 'Enrolment')] as Object[],
                          "Another user has updated this Enrolment while you were editing")
                render(view: "edit", model: [enrolmentInstance: enrolmentInstance])
                return
            }
        }

        enrolmentInstance.properties = params

        if (!enrolmentInstance.save(flush: true)) {
            render(view: "edit", model: [enrolmentInstance: enrolmentInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'enrolment.label', default: 'Enrolment'), enrolmentInstance.id])
        redirect(action: "show", id: enrolmentInstance.id)
    }

    def delete(Long id) {
        def enrolmentInstance = Enrolment.get(id)
        if (!enrolmentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'enrolment.label', default: 'Enrolment'), id])
            redirect(action: "list")
            return
        }

        try {
            enrolmentInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'enrolment.label', default: 'Enrolment'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'enrolment.label', default: 'Enrolment'), id])
            redirect(action: "show", id: id)
        }
    }
}
