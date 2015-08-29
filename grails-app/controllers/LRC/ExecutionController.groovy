package LRC

import grails.converters.JSON
import org.springframework.dao.DataIntegrityViolationException

class ExecutionController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [executionInstanceList: Execution.list(params), executionInstanceTotal: Execution.count()]
    }

    def create() {
        [executionInstance: new Execution(params)]
    }

    def save() {
        def executionInstance = new Execution(params)
        if (!executionInstance.save(flush: true)) {
            render(view: "create", model: [executionInstance: executionInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'execution.label', default: 'Execution'), executionInstance.id])
        redirect(action: "show", id: executionInstance.id)
    }

    def show() {
        def executionInstance = Execution.get(params.id)
        if (!executionInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'execution.label', default: 'Execution'), params.id])
            redirect(action: "list")
            return
        }

        [executionInstance: executionInstance]
    }

    def edit() {
        def executionInstance = Execution.get(params.id)
        if (!executionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'execution.label', default: 'Execution'), params.id])
            redirect(action: "list")
            return
        }

        [executionInstance: executionInstance]
    }

    def update() {
        def executionInstance = Execution.get(params.id)
        if (!executionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'execution.label', default: 'Execution'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (executionInstance.version > version) {
                executionInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'execution.label', default: 'Execution')] as Object[],
                          "Another user has updated this Execution while you were editing")
                render(view: "edit", model: [executionInstance: executionInstance])
                return
            }
        }

        executionInstance.properties = params

        if (!executionInstance.save(flush: true)) {
            render(view: "edit", model: [executionInstance: executionInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'execution.label', default: 'Execution'), executionInstance.id])
        redirect(action: "show", id: executionInstance.id)
    }

    def delete() {
        def executionInstance = Execution.get(params.id)
        if (!executionInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'execution.label', default: 'Execution'), params.id])
            redirect(action: "list")
            return
        }

        try {
            executionInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'execution.label', default: 'Execution'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'execution.label', default: 'Execution'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
	def stat(){
		
	}
	def data() {
		params.max = Math.min(params.max ? params.int('max') : 60, 100)
		params.sort = params.sort? params.sort : 'id'
		params.order = params.order? params.order : 'desc'
		def executionList = Execution.list(params)
		def execRatio = ['DCM-CP':[],'DCM-CM':[],'All-IV':[]]
		def passRatio = ['DCM-CP':[],'DCM-CM':[],'All-IV':[]]
		
		executionList.reverse().each{execution->
			Calendar calendar = Calendar.getInstance()
			//2012-11-28 12:23:40
			calendar.setTime(Date.parse('yyyy-MM-dd HH:mm:ss',execution.executionDate))
			def timePoint = calendar.getTimeInMillis()

			execRatio['DCM-CP']<<[timePoint,new Double((Integer.parseInt(execution.nsnCPCaseNumberTA)+
				Integer.parseInt(execution.cieNetCPCaseNumberTA))/(
				Integer.parseInt(execution.nsnCPCaseNumberAll)+
				Integer.parseInt(execution.cieNetCPCaseNumberAll))*100).round(1)]
			
			execRatio['DCM-CM']<<[timePoint,new Double((Integer.parseInt(execution.nsnCMCaseNumberTA)+
				Integer.parseInt(execution.cieNetCMCaseNumberTA))/(
				Integer.parseInt(execution.nsnCMCaseNumberAll)+
				Integer.parseInt(execution.cieNetCMCaseNumberAll))*100).round(1)]
						
			execRatio['All-IV']<<[timePoint,new Double((Integer.parseInt(execution.nsnCPCaseNumberTA)+Integer.parseInt(execution.nsnCMCaseNumberTA)+
				Integer.parseInt(execution.cieNetCPCaseNumberTA)+Integer.parseInt(execution.cieNetCMCaseNumberTA))/(
				Integer.parseInt(execution.nsnCPCaseNumberAll)+Integer.parseInt(execution.nsnCMCaseNumberAll)+
				Integer.parseInt(execution.cieNetCPCaseNumberAll)+Integer.parseInt(execution.cieNetCMCaseNumberAll))*100).round(1)]
			
			passRatio['DCM-CP']<<[timePoint,new Double((Integer.parseInt(execution.nsnCPCaseNumberTAPass)+
				Integer.parseInt(execution.cieNetCPCaseNumberTAPass))/(
				Integer.parseInt(execution.nsnCPCaseNumberTA)+
				Integer.parseInt(execution.cieNetCPCaseNumberTA))*100).round(1)]
			
			passRatio['DCM-CM']<<[timePoint,new Double((Integer.parseInt(execution.nsnCMCaseNumberTAPass)+
				Integer.parseInt(execution.cieNetCMCaseNumberTAPass))/(
				Integer.parseInt(execution.nsnCMCaseNumberTA)+
				Integer.parseInt(execution.cieNetCMCaseNumberTA))*100).round(1)]
			
						
			passRatio['All-IV']<<[timePoint,new Double((Integer.parseInt(execution.nsnCPCaseNumberTAPass)+Integer.parseInt(execution.nsnCMCaseNumberTAPass)+
				Integer.parseInt(execution.cieNetCPCaseNumberTAPass)+Integer.parseInt(execution.cieNetCMCaseNumberTAPass))/(
				Integer.parseInt(execution.nsnCPCaseNumberTA)+Integer.parseInt(execution.nsnCMCaseNumberTA)+
				Integer.parseInt(execution.cieNetCPCaseNumberTA)+Integer.parseInt(execution.cieNetCMCaseNumberTA))*100).round(1)]
		}
		def result = ['execratio':execRatio,'passratio':passRatio]
		render result as JSON
	}
}
