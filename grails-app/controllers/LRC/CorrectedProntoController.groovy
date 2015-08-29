package LRC

import org.springframework.dao.DataIntegrityViolationException

class CorrectedProntoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [correctedProntoInstanceList: CorrectedPronto.list(params), correctedProntoInstanceTotal: CorrectedPronto.count()]
    }

    def create() {
        [correctedProntoInstance: new CorrectedPronto(params)]
    }

    def save() {
		
		def matched_pronto = null
		
		CorrectedPronto.list().each { cp->
			if (cp.getProntoID() == params.prontoID) {
				matched_pronto = cp
			}
		}
		
		if (matched_pronto == null) {
			// the corrected pronto you want to add is a new one.
			def correctedProntoInstance = new CorrectedPronto(params)
			if (!correctedProntoInstance.save(flush: true)) {
				render(view: "create", model: [correctedProntoInstance: correctedProntoInstance])
			}
	
			flash.message = message(code: 'default.created.message', args: [message(code: 'correctedPronto.label', default: 'CorrectedPronto'), correctedProntoInstance.id])
			redirect(action: "show", id: correctedProntoInstance.id)
		} else {
			// the corrected pronto exist.
			matched_pronto.addToFeaturebuilds(FeatureBuild.get(params.featurebuilds))
			redirect(action: "show", id:params.featurebuilds)
		}
    }

    def show() {
        def correctedProntoInstance = CorrectedPronto.get(params.id)
        if (!correctedProntoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'correctedPronto.label', default: 'CorrectedPronto'), params.id])
            redirect(action: "list")
            return
        }

        [correctedProntoInstance: correctedProntoInstance]
    }

    def edit() {
        def correctedProntoInstance = CorrectedPronto.get(params.id)
        if (!correctedProntoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'correctedPronto.label', default: 'CorrectedPronto'), params.id])
            redirect(action: "list")
            return
        }

        [correctedProntoInstance: correctedProntoInstance]
    }

    def update() {
        def correctedProntoInstance = CorrectedPronto.get(params.id)
        if (!correctedProntoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'correctedPronto.label', default: 'CorrectedPronto'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (correctedProntoInstance.version > version) {
                correctedProntoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'correctedPronto.label', default: 'CorrectedPronto')] as Object[],
                          "Another user has updated this CorrectedPronto while you were editing")
                render(view: "edit", model: [correctedProntoInstance: correctedProntoInstance])
                return
            }
        }

        correctedProntoInstance.properties = params

        if (!correctedProntoInstance.save(flush: true)) {
            render(view: "edit", model: [correctedProntoInstance: correctedProntoInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'correctedPronto.label', default: 'CorrectedPronto'), correctedProntoInstance.id])
        redirect(action: "show", id: correctedProntoInstance.id)
    }

    def delete() {
        def correctedProntoInstance = CorrectedPronto.get(params.id)
        if (!correctedProntoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'correctedPronto.label', default: 'CorrectedPronto'), params.id])
            redirect(action: "list")
            return
        }

        try {
            correctedProntoInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'correctedPronto.label', default: 'CorrectedPronto'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'correctedPronto.label', default: 'CorrectedPronto'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
