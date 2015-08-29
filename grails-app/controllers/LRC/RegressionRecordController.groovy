package LRC

import org.springframework.dao.DataIntegrityViolationException

class RegressionRecordController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [regressionRecordInstanceList: RegressionRecord.list(params), regressionRecordInstanceTotal: RegressionRecord.count()]
    }

    def create() {
        [regressionRecordInstance: new RegressionRecord(params)]
    }

    def save() {
        def regressionRecordInstance = new RegressionRecord(params)
        if (!regressionRecordInstance.save(flush: true)) {
            render(view: "create", model: [regressionRecordInstance: regressionRecordInstance])
            return
        }
    }

    def show(Long id) {
        def regressionRecordInstance = RegressionRecord.get(id)
        if (!regressionRecordInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'regressionRecord.label', default: 'RegressionRecord'), id])
            redirect(action: "list")
            return
        }

        [regressionRecordInstance: regressionRecordInstance]
    }

    def edit(Long id) {
        def regressionRecordInstance = RegressionRecord.get(id)
        if (!regressionRecordInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'regressionRecord.label', default: 'RegressionRecord'), id])
            redirect(action: "list")
            return
        }

        [regressionRecordInstance: regressionRecordInstance]
    }

    def update(Long id, Long version) {
        def regressionRecordInstance = RegressionRecord.get(id)
        if (!regressionRecordInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'regressionRecord.label', default: 'RegressionRecord'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (regressionRecordInstance.version > version) {
                regressionRecordInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'regressionRecord.label', default: 'RegressionRecord')] as Object[],
                          "Another user has updated this RegressionRecord while you were editing")
                render(view: "edit", model: [regressionRecordInstance: regressionRecordInstance])
                return
            }
        }

        regressionRecordInstance.properties = params

        if (!regressionRecordInstance.save(flush: true)) {
            render(view: "edit", model: [regressionRecordInstance: regressionRecordInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'regressionRecord.label', default: 'RegressionRecord'), regressionRecordInstance.id])
        redirect(action: "show", id: regressionRecordInstance.id)
    }

    def delete(Long id) {
        def regressionRecordInstance = RegressionRecord.get(id)
        if (!regressionRecordInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'regressionRecord.label', default: 'RegressionRecord'), id])
            redirect(action: "list")
            return
        }

        try {
            regressionRecordInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'regressionRecord.label', default: 'RegressionRecord'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'regressionRecord.label', default: 'RegressionRecord'), id])
            redirect(action: "show", id: id)
        }
    }
}
