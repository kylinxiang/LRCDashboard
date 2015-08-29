package LRC

import grails.converters.XML
import org.springframework.dao.DataIntegrityViolationException

class CaseInstanceController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "all", params: params)
    }
	
	def all() {
		params.sort = params.sort? params.sort : 'id'
		params.order = params.order? params.order : 'desc'
		withFormat {
			html {
				[caseInstanceInstanceList: CaseInstance.list(params), caseInstanceInstanceTotal: CaseInstance.count()]
			}
			xml { render CaseInstance.list(params) as XML }
		}
		
	}

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [caseInstanceInstanceList: CaseInstance.list(params), caseInstanceInstanceTotal: CaseInstance.count()]
    }

    def create() {
        [caseInstanceInstance: new CaseInstance(params)]
    }

    def save() {
        def caseInstanceInstance = new CaseInstance(params)
        if (!caseInstanceInstance.save(flush: true)) {
            render(view: "create", model: [caseInstanceInstance: caseInstanceInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'caseInstance.label', default: 'CaseInstance'), caseInstanceInstance.id])
        redirect(action: "show", id: caseInstanceInstance.id)
    }

    def show() {
        def caseInstanceInstance = CaseInstance.get(params.id)
        if (!caseInstanceInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'caseInstance.label', default: 'CaseInstance'), params.id])
            redirect(action: "list")
            return
        }

        [caseInstanceInstance: caseInstanceInstance]
    }

    def edit() {
        def caseInstanceInstance = CaseInstance.get(params.id)
        if (!caseInstanceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'caseInstance.label', default: 'CaseInstance'), params.id])
            redirect(action: "list")
            return
        }

        [caseInstanceInstance: caseInstanceInstance]
    }

    def update() {
        def caseInstanceInstance = CaseInstance.get(params.id)
        if (!caseInstanceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'caseInstance.label', default: 'CaseInstance'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (caseInstanceInstance.version > version) {
                caseInstanceInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'caseInstance.label', default: 'CaseInstance')] as Object[],
                          "Another user has updated this CaseInstance while you were editing")
                render(view: "edit", model: [caseInstanceInstance: caseInstanceInstance])
                return
            }
        }

        caseInstanceInstance.properties = params

        if (!caseInstanceInstance.save(flush: true)) {
            render(view: "edit", model: [caseInstanceInstance: caseInstanceInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'caseInstance.label', default: 'CaseInstance'), caseInstanceInstance.id])
        redirect(action: "show", id: caseInstanceInstance.id)
    }

    def delete() {
        def caseInstanceInstance = CaseInstance.get(params.id)
        if (!caseInstanceInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'caseInstance.label', default: 'CaseInstance'), params.id])
            redirect(action: "list")
            return
        }

        try {
            caseInstanceInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'caseInstance.label', default: 'CaseInstance'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'caseInstance.label', default: 'CaseInstance'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
