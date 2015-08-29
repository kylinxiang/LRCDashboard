package LRC

import grails.converters.XML
import java.text.SimpleDateFormat
import org.springframework.dao.DataIntegrityViolationException

class ContinueRegressionController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
		params.sort = params.sort? params.sort : 'id'
		params.order = params.order? params.order : 'desc'
        [continueRegressionInstanceList: ContinueRegression.list(params), continueRegressionInstanceTotal: ContinueRegression.count()]
    }

    def create() {
        [continueRegressionInstance: new ContinueRegression(params)]
    }

    def save() {
        def continueRegressionInstance = new ContinueRegression(params)
        if (!continueRegressionInstance.save(flush: true)) {
            render(view: "create", model: [continueRegressionInstance: continueRegressionInstance])
            return
        }
		
		flash.message = message(code: 'default.created.message', args: [message(code: 'continueRegression.label', default: 'ContinueRegression'), continueRegressionInstance.id])
		redirect(action: "show", id: continueRegressionInstance.id)
		
    }

    def show(Long id) {
        def continueRegressionInstance = ContinueRegression.get(id)
        if (!continueRegressionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'continueRegression.label', default: 'ContinueRegression'), id])
            redirect(action: "list")
            return
        }
		
		def crList = []
		
		RegressionCase.list().each { regressionCase ->
			/**
			 * will only include those CR Regression Case executed in same week.
			 * */
			if (regressionCase.convertPriorityToNumber() < 2 && regressionCase.getWeekOfYear() == continueRegressionInstance.week) crList.add(regressionCase)
		}

		continueRegressionInstance.regressionCases = crList.flatten().unique()
		
		withFormat {
			html {
				[continueRegressionInstance: continueRegressionInstance]
			}
			xml { render continueRegressionInstance as XML }
		}
    }

    def edit(Long id) {
        def continueRegressionInstance = ContinueRegression.get(id)
        if (!continueRegressionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'continueRegression.label', default: 'ContinueRegression'), id])
            redirect(action: "list")
            return
        }

        [continueRegressionInstance: continueRegressionInstance]
    }

    def update(Long id, Long version) {
        def continueRegressionInstance = ContinueRegression.get(id)
        if (!continueRegressionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'continueRegression.label', default: 'ContinueRegression'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (continueRegressionInstance.version > version) {
                continueRegressionInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'continueRegression.label', default: 'ContinueRegression')] as Object[],
                          "Another user has updated this ContinueRegression while you were editing")
                render(view: "edit", model: [continueRegressionInstance: continueRegressionInstance])
                return
            }
        }

        continueRegressionInstance.properties = params

		def crList = []
		
		RegressionCase.list().each { regressionCase ->
			/**
			 * will only include those CR Regression Case executed in same week.
			 * */
			if (regressionCase.convertPriorityToNumber() < 2 && regressionCase.getWeekOfYear() == continueRegressionInstance.week) crList.add(regressionCase)
		}

		continueRegressionInstance.regressionCases = crList.flatten().unique()
		
        if (!continueRegressionInstance.save(flush: true)) {
            render(view: "edit", model: [continueRegressionInstance: continueRegressionInstance])
            return
        }
		
		/**
		 * every time, it updated, will also update Regression Record.
		 * */
		RegressionRecordController rrc = new RegressionRecordController()
		
		rrc.params.regressionID = continueRegressionInstance.id
		rrc.params.totalNumber = continueRegressionInstance.allNumber
		rrc.params.passedNumber = continueRegressionInstance.getPassedCaseNumber()
		rrc.params.failedNumber = continueRegressionInstance.failureNumber
		rrc.params.executedNumber = continueRegressionInstance.executedNumber 
		rrc.params.executionDuration = continueRegressionInstance.allExecutionMinutes
		
		def execLoadMap = [:]
		int valuedDuration = 0
		continueRegressionInstance.regressionCases.each {includeCase ->
			execLoadMap.put(includeCase.targetLoad, new Object())
			valuedDuration = includeCase.duration + valuedDuration
		}
		rrc.params.valuedDuration = valuedDuration
		
		rrc.params.recordTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())
		rrc.params.executedLoadNumber = execLoadMap.size()
		
		rrc.save()
		
		flash.message = message(code: 'default.updated.message', args: [message(code: 'continueRegression.label', default: 'ContinueRegression'), continueRegressionInstance.id])
		redirect(action: "show", id: continueRegressionInstance.id)
    }

    def delete(Long id) {
        def continueRegressionInstance = ContinueRegression.get(id)
        if (!continueRegressionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'continueRegression.label', default: 'ContinueRegression'), id])
            redirect(action: "list")
            return
        }

        try {
            continueRegressionInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'continueRegression.label', default: 'ContinueRegression'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'continueRegression.label', default: 'ContinueRegression'), id])
            redirect(action: "show", id: id)
        }
    }
}
