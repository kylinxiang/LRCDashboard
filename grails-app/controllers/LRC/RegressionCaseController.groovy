package LRC

import java.text.SimpleDateFormat
import org.springframework.dao.DataIntegrityViolationException

class RegressionCaseController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 20, 100)
        [regressionCaseInstanceList: RegressionCase.list(params), regressionCaseInstanceTotal: RegressionCase.count()]
    }

    def create() {
        [regressionCaseInstance: new RegressionCase(params)]
    }

    def save() {
		long caseID = 0
		RegressionCase.list().each { regressionCase ->
			if(regressionCase.getCaseName().equalsIgnoreCase(params.caseName)) caseID = regressionCase.id
		}
		
		params.put("lastRecordTime", new Date())
		
		if (caseID == 0) {
			def regressionCaseInstance = new RegressionCase(params)
			if (!regressionCaseInstance.save(flush: true)) {
				render(view: "create", model: [regressionCaseInstance: regressionCaseInstance])
				return
			}
			
			if (regressionCaseInstance.convertPriorityToNumber() >= 2) {
				updateRegressionController(regressionCaseInstance, true)
			} else if (regressionCaseInstance.convertPriorityToNumber() < 2) {
				updateContinueRegressionController(regressionCaseInstance, true)
			} else {
				flash.message = message(code: 'default.created.message', args: [message(code: 'regressionCase.label', default: 'RegressionCase'), regressionCaseInstance.id])
				redirect(action: "show", id: regressionCaseInstance.id)
			}
			
		} else {
			//it is old FUCK, update those changed part.
			update(caseID, null)
		}
    }
	
	private createEmptyContinueRegressionInstance() {
		ContinueRegressionController crController = new ContinueRegressionController()
		int initialTotalNumber = 0
		RegressionCase.list().each { regCase ->
			if (regCase.convertPriorityToNumber() < 2) initialTotalNumber = initialTotalNumber + 1
		}
		
		Date dateBorn = new Date()
		crController.params.executionStartTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())
		crController.params.executionFinishedTime = 'N/A'
		crController.params.targetReleaeBranch = '13B'
		crController.params.crLevel = "Level-0: T.B.D"
		crController.params.crStatus = "PLAN"
		crController.params.allNumber = initialTotalNumber
		crController.params.failureNumber = initialTotalNumber
		crController.params.executedNumber = 0
		crController.params.allExecutionMinutes = 0
		crController.params.week = CalendarUtil.getWeekOfYear(dateBorn)
		crController.params.comments = "--"
		return crController
	}
	
	private updateContinueRegressionController(RegressionCase regressionCaseInstance, boolean isUpdateTotalNumber) {
		boolean updateFlag = true
		ContinueRegressionController crController = null
		ContinueRegression continueRegression = null
		if (ContinueRegression.list().size() <= 0) {
			crController = createEmptyContinueRegressionInstance()
			updateFlag = false
		} else {
			ContinueRegression.list().each { eachContinueRegression ->
				if (regressionCaseInstance.getWeekOfYear() == eachContinueRegression.week) {
					crController = new ContinueRegressionController()
					crController = inheritBasicContinueRegressionInfo(crController, eachContinueRegression)
					continueRegression = eachContinueRegression
				}
			}
			
			if (crController == null) {
				crController = createEmptyContinueRegressionInstance()
			}
		}
		
		if (updateFlag) {
			
			if (isUpdateTotalNumber) crController.params.allNumber = continueRegression.getAllNumber() + 1
			if (continueRegression.getExecutedNumber() < continueRegression.getAllNumber()) crController.params.executedNumber = continueRegression.getExecutedNumber() + 1
			
			if (regressionCaseInstance.isExecutionPass() && continueRegression.getFailureNumber() >= 1) crController.params.failureNumber = continueRegression.getFailureNumber() - 1
			if (!regressionCaseInstance.isExecutionPass()) crController.params.failureNumber = continueRegression.getFailureNumber() + 1
			
			crController.params.allExecutionMinutes = continueRegression.getAllExecutionMinutes() + regressionCaseInstance.duration
			
			println "will update Continue Regression Controller"
			crController.update(continueRegression.id, null)
		} else {
			println "will save Continue Regression Controller"
			crController.save()
		}
	}
	
	private inheritBasicContinueRegressionInfo(ContinueRegressionController crCtrler, ContinueRegression eachReg) {
		
		crCtrler.params.executionStartTime = eachReg.getExecutionStartTime()
		crCtrler.params.executionFinishedTime = eachReg.getExecutionFinishedTime()
		
		crCtrler.params.targetReleaeBranch = eachReg.getTargetReleaeBranch() 
		
		crCtrler.params.crLevel = eachReg.getCrLevel()
		crCtrler.params.crStatus = eachReg.getCrStatus()
		
		crCtrler.params.week = eachReg.getWeek()
		
		crCtrler.params.allNumber = eachReg.getAllNumber()
		crCtrler.params.failureNumber = eachReg.getFailureNumber()
		
		return crCtrler
	}

	private updateRegressionController(RegressionCase regressionCaseInstance, boolean isUpdateTotalNumber) {
		if (Regression.list().size() > 0) {
			Regression.list().each {eachReg ->
				if (eachReg.getTargetLoadName().equalsIgnoreCase(params.targetLoad) && eachReg.isCBRStatusUpdateNecessary()) {
					println 'will update Regression (CBR) result'
					RegressionController regCtrler = new RegressionController()
					regCtrler = inheritBasicRegressionInfo(regCtrler, eachReg)
					if (isUpdateTotalNumber) {
						if (regressionCaseInstance.isCriticalCase()) {
							regCtrler.params.criticalNumber = eachReg.criticalNumber + 1
						} else {
							regCtrler.params.criticalNumber = eachReg.criticalNumber
						}
						regCtrler.params.allNumber = eachReg.allNumber + 1
					} else {
						regCtrler.params.criticalNumber = eachReg.criticalNumber
						regCtrler.params.allNumber = eachReg.allNumber
					}
					if (regressionCaseInstance.isExecutionPass()) {
						if(regressionCaseInstance.isCriticalCase()) {
							if ((eachReg.criticalPassNumber < regCtrler.params.criticalNumber)) {
								regCtrler.params.allPassNumber = eachReg.allPassNumber + 1
								regCtrler.params.criticalPassNumber = eachReg.criticalPassNumber + 1
								regCtrler.params.valuedATDuration = eachReg.valuedATDuration + regressionCaseInstance.duration
							} else {
								regCtrler.params.allPassNumber = eachReg.allPassNumber
								regCtrler.params.criticalPassNumber = eachReg.criticalPassNumber
								regCtrler.params.valuedATDuration = eachReg.valuedATDuration
							}
							regCtrler.params.valuedCBRDuration = eachReg.valuedCBRDuration
							
						} else {
							if ((eachReg.allPassNumber < regCtrler.params.allNumber)) {
								regCtrler.params.allPassNumber = eachReg.allPassNumber + 1
								regCtrler.params.valuedCBRDuration = eachReg.valuedCBRDuration + regressionCaseInstance.duration
							} else {
								regCtrler.params.allPassNumber = eachReg.allPassNumber
								regCtrler.params.valuedCBRDuration = eachReg.valuedCBRDuration
							}
							regCtrler.params.criticalPassNumber = eachReg.criticalPassNumber
							regCtrler.params.valuedATDuration = eachReg.valuedATDuration
						}
					} else {
						regCtrler.params.allPassNumber = eachReg.allPassNumber
					}
					
					regCtrler.params.allExecutionMinutes = eachReg.allExecutionMinutes + regressionCaseInstance.duration
					
					if (regCtrler.params.allPassNumber == regCtrler.params.allNumber) {
						regCtrler.params.cbrLevel = "Level-8: All CBR Regression Case Executed and PASS"
						regCtrler.params.cbrStatus = "RELEASED"
					} else {
						regCtrler.params.cbrLevel = "Level-0: T.B.D"
						regCtrler.params.cbrStatus = "TESTED"
					}
					regCtrler.update(eachReg.id, null)
				}
			}
		}
	}

	private RegressionController inheritBasicRegressionInfo(RegressionController regCtrler, Regression eachReg) {
		regCtrler.params.executionStartTime = eachReg.executionStartTime
		regCtrler.params.executionFinishedTime = eachReg.executionFinishedTime
		regCtrler.params.targetLoadName = eachReg.targetLoadName
		regCtrler.params.targetReleaeBranch = eachReg.targetReleaeBranch
		return regCtrler
	}

    def show(Long id) {
        def regressionCaseInstance = RegressionCase.get(id)
        if (!regressionCaseInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'regressionCase.label', default: 'RegressionCase'), id])
            redirect(action: "list")
            return
        }

        [regressionCaseInstance: regressionCaseInstance]
    }

    def edit(Long id) {
        def regressionCaseInstance = RegressionCase.get(id)
        if (!regressionCaseInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'regressionCase.label', default: 'RegressionCase'), id])
            redirect(action: "list")
            return
        }

        [regressionCaseInstance: regressionCaseInstance]
    }

    def update(Long id, Long version) {
        def regressionCaseInstance = RegressionCase.get(id)
        if (!regressionCaseInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'regressionCase.label', default: 'RegressionCase'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (regressionCaseInstance.version > version) {
                regressionCaseInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'regressionCase.label', default: 'RegressionCase')] as Object[],
                          "Another user has updated this RegressionCase while you were editing")
                render(view: "edit", model: [regressionCaseInstance: regressionCaseInstance])
                return
            }
        }

        regressionCaseInstance.properties = params

        if (!regressionCaseInstance.save(flush: true)) {
            render(view: "edit", model: [regressionCaseInstance: regressionCaseInstance])
            return
        }
		
		if (Regression.list().size() > 0 && regressionCaseInstance.convertPriorityToNumber() >= 2) {
			updateRegressionController(regressionCaseInstance, false)
		} else if (ContinueRegression.list().size() > 0 && regressionCaseInstance.convertPriorityToNumber() < 2) {
			updateContinueRegressionController(regressionCaseInstance, false)
		} else {
			flash.message = message(code: 'default.created.message', args: [message(code: 'regressionCase.label', default: 'RegressionCase'), regressionCaseInstance.id])
			redirect(action: "show", id: regressionCaseInstance.id)
		}
    }

    def delete(Long id) {
        def regressionCaseInstance = RegressionCase.get(id)
        if (!regressionCaseInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'regressionCase.label', default: 'RegressionCase'), id])
            redirect(action: "list")
            return
        }

        try {
            regressionCaseInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'regressionCase.label', default: 'RegressionCase'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'regressionCase.label', default: 'RegressionCase'), id])
            redirect(action: "show", id: id)
        }
    }
}
