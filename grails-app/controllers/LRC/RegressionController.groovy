package LRC

import grails.converters.JSON
import grails.converters.XML
import org.springframework.dao.DataIntegrityViolationException

class RegressionController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }
	
	def data() {
		params.max = Math.min(params.max ? params.int('max') : 60, 100)
		params.sort = params.sort? params.sort : 'id'
		params.order = params.order? params.order : 'desc'
		
		def cbRegressionList = Regression.list()
		def execDuration = ['DURATION(hour)':[], 'LEVEL(7-8)':[]]
		def execStat = ['TOTAL DURATION':[], 'VALUED AT DURATION':[],'VALUED CBR DURATION':[], 'WASTED DURATION':[]]
		
		cbRegressionList.reverse().each {execution ->
			Calendar calendar = Calendar.getInstance()
			calendar.setTime(Date.parse('yyyy-MM-dd HH:mm:ss',execution.executionStartTime))
			def timePoint = calendar.getTimeInMillis()
			
			def execHour = execution.allExecutionMinutes / 60
			execDuration['DURATION(hour)']<<[timePoint, new Double(execHour).round(1)]
			execDuration['LEVEL(7-8)']<<[timePoint, execution.calculateCBRLevel()]
			
			def allDuration = execution.allExecutionMinutes
			def atDuration = execution.estimateValuedATDuration()
			def cbrDuration = execution.estimateValuedOtherCBRDuration()
			def wastedDuration = execution.estimateWastedDuration()
			
			execStat['TOTAL DURATION']<<[timePoint, allDuration]
			execStat['VALUED AT DURATION']<<[timePoint, atDuration]
			execStat['VALUED CBR DURATION']<<[timePoint, cbrDuration]
			execStat['WASTED DURATION']<<[timePoint, wastedDuration]
			
		}
		def result = ['execratio':execDuration, 'passratio':execStat]
		render result as JSON
	}
	
	def chart() {}
	
	def all() {
		params.sort = params.sort? params.sort : 'id'
		params.order = params.order? params.order : 'desc'
		withFormat {
			html {
				[regressionInstanceList: Regression.list(params), regressionInstanceTotal: Regression.count()]
			}
			xml { render Regression.list(params) as XML }
		}
	}

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
		params.sort = params.sort? params.sort : 'id'
		params.order = params.order? params.order : 'desc'
		withFormat {
			html {
				[regressionInstanceList: Regression.list(params), regressionInstanceTotal: Regression.count()]
			}
			xml { render Regression.list(params) as XML }
		}
    }

    def create() {
        [regressionInstance: new Regression(params)]
    }

    def save() {
        def regressionInstance = new Regression(params)
        if (!regressionInstance.save(flush: true)) {
            render(view: "create", model: [regressionInstance: regressionInstance])
            return
        }
        flash.message = message(code: 'default.created.message', args: [message(code: 'regression.label', default: 'Regression'), regressionInstance.id])
        redirect(action: "show", id: regressionInstance.id)
    }
	
    def show(Long id) {
        def regressionInstance = Regression.get(id)
        if (!regressionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'regression.label', default: 'Regression'), id])
            redirect(action: "list")
            return
        }
		
		def temList = []
		RegressionCase.list().each {eachCase ->
			if (eachCase.targetLoad.equalsIgnoreCase(regressionInstance.targetLoadName) && eachCase.convertPriorityToNumber() >= 2) temList.add(eachCase)
		}
		regressionInstance.regressionCases = temList.flatten().unique()
		withFormat {
			html {
				[regressionInstance: regressionInstance]
			}
			xml { render regressionInstance as XML }
		}
    }

    def edit(Long id) {
        def regressionInstance = Regression.get(id)
        if (!regressionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'regression.label', default: 'Regression'), id])
            redirect(action: "list")
            return
        }
        [regressionInstance: regressionInstance]
    }
	
	def _gen_mail_subject(params) {
		def default_mail_subject = "microREC 3G CBR Report >> "
		def pkgName = params.get('targetLoadName')
		def releaseBranch = params.get('targetReleaeBranch')
		def level = params.get('cbrLevel')
		def status = params.get('cbrStatus')
		
		return default_mail_subject + pkgName + " (" + releaseBranch + ") " + level + " ## " + status + " ##" 
	}
	
	def send_out_cbr_mail_notification(def params, def regressionInstance) {
                def audiencesCC = []
                def audiencesBCC = []
//		List audiencesCC = new ArrayList<String>()
//		List audiencesBCC = new ArrayList<String>()
		
		def defaultAudiencesCC=['xi-raul.zhang@nsn.com']
		
		Audience.list().each { eachAudience->
			if (eachAudience.isbcc) {
				audiencesBCC.add(eachAudience.getMailAddress())
			} else {
				audiencesCC.add(eachAudience.getMailAddress())
			}
		}
		
		if (audiencesBCC.size() <= 0) {
			audiencesBCC = defaultAudiencesCC
		}
		
		if (audiencesCC.size() <= 0) {
			audiencesCC = defaultAudiencesCC
		}
		
		def subjectString = _gen_mail_subject(params)
		
		try {
			sendMail {
				subject subjectString
				from "microREC_WCDMA_QT@noreply.com"
				replyTo "I_EXT_MBB_WCDMA_RA_BTS_DCM_QT@internal.nsn.com"
				cc audiencesCC.toArray()
				bcc audiencesBCC.toArray()
				html view: "mailNotification", model:[regressionInstance: regressionInstance]
			}
			println "notification mail sent"
			flash.put("mailSent","Confirmation email sent.")
		} catch (Exception e) {
			flash.put("mailSent","Confirmation email NOT sent due to:\\n" + e.message)
		}
		
	}

    def update(Long id, Long version) {
        def regressionInstance = Regression.get(id)
        if (!regressionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'regression.label', default: 'Regression'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (regressionInstance.version > version) {
                regressionInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'regression.label', default: 'Regression')] as Object[],
                          "Another user has updated this Regression while you were editing")
                render(view: "edit", model: [regressionInstance: regressionInstance])
                return
            }
        }
		
        regressionInstance.properties = params
		
		def temList = []
		RegressionCase.list().each {eachCase ->
			if (eachCase.targetLoad.equalsIgnoreCase(regressionInstance.targetLoadName) && eachCase.convertPriorityToNumber() >= 2) temList.add(eachCase)
		}
		
		regressionInstance.regressionCases = temList.flatten().unique()

        if (!regressionInstance.save(flush: true)) {
            render(view: "edit", model: [regressionInstance: regressionInstance])
            return
        }
		
		if (regressionInstance.cbrStatus.equalsIgnoreCase('RESTRICTED') || regressionInstance.cbrStatus.equalsIgnoreCase('RELEASED')) send_out_cbr_mail_notification(params, regressionInstance)

        flash.message = message(code: 'default.updated.message', args: [message(code: 'regression.label', default: 'Regression'), regressionInstance.id])
        redirect(action: "show", id: regressionInstance.id)
    }

    def delete(Long id) {
        def regressionInstance = Regression.get(id)
        if (!regressionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'regression.label', default: 'Regression'), id])
            redirect(action: "list")
            return
        }

        try {
            regressionInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'regression.label', default: 'Regression'), id])
            redirect(action: "list")
        } catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'regression.label', default: 'Regression'), id])
            redirect(action: "show", id: id)
        }
    }
}
