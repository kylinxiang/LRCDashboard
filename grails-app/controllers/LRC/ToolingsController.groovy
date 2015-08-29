package LRC

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.*

class ToolingsController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
		
		withFormat {
			html {
				[toolingsInstanceList: Toolings.list(params), toolingsInstanceTotal: Toolings.count()]
			}
			xml {
				render Toolings.list(params) as XML
			}
		}
    }

    def create() {
        [toolingsInstance: new Toolings(params)]
    }

    def save() {
        def toolingsInstance = new Toolings(params)
        if (!toolingsInstance.save(flush: true)) {
            render(view: "create", model: [toolingsInstance: toolingsInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'toolings.label', default: 'Toolings'), toolingsInstance.id])
        redirect(action: "show", id: toolingsInstance.id)
    }

    def show() {
        def toolingsInstance = Toolings.get(params.id)
        if (!toolingsInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'toolings.label', default: 'Toolings'), params.id])
            redirect(action: "list")
            return
        }
		
		withFormat {
			html {
				[toolingsInstance: toolingsInstance]
			}
			xml {
				render toolingsInstance as XML
			}
		}
    }

    def edit() {
        def toolingsInstance = Toolings.get(params.id)
        if (!toolingsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'toolings.label', default: 'Toolings'), params.id])
            redirect(action: "list")
            return
        }
        [toolingsInstance: toolingsInstance]
    }

    def update() {
        def toolingsInstance = Toolings.get(params.id)
        if (!toolingsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'toolings.label', default: 'Toolings'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (toolingsInstance.version > version) {
                toolingsInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'toolings.label', default: 'Toolings')] as Object[],
                          "Another user has updated this Toolings while you were editing")
                render(view: "edit", model: [toolingsInstance: toolingsInstance])
                return
            }
        }

        toolingsInstance.properties = params

        if (!toolingsInstance.save(flush: true)) {
            render(view: "edit", model: [toolingsInstance: toolingsInstance])
            return
        }
		
		/** we will send out notification mail to let all know new PMC combination is ready **/
		/*Ney, I will pass*/

		flash.message = message(code: 'default.updated.message', args: [message(code: 'toolings.label', default: 'Toolings'), toolingsInstance.id])
        redirect(action: "show", id: toolingsInstance.id)
    }

    def delete() {
        def toolingsInstance = Toolings.get(params.id)
        if (!toolingsInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'toolings.label', default: 'Toolings'), params.id])
            redirect(action: "list")
            return
        }

        try {
            toolingsInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'toolings.label', default: 'Toolings'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'toolings.label', default: 'Toolings'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
