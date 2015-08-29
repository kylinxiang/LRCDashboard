package LRC

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.*
import java.text.SimpleDateFormat

class FeatureBuildController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }
	
	def all() {
		params.sort = params.sort? params.sort : 'id'
		params.order = params.order? params.order : 'desc'
		withFormat {
			html {
				[featureBuildInstanceList: FeatureBuild.list(params), featureBuildInstanceTotal: FeatureBuild.count()]
			}
			xml { render FeatureBuild.list(params) as XML }
		}
	}

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
		params.sort = params.sort? params.sort : 'id'
		params.order = params.order? params.order : 'desc'
		withFormat {
			html {
				[featureBuildInstanceList: FeatureBuild.list(params), featureBuildInstanceTotal: FeatureBuild.count()]
			}
			xml { render FeatureBuild.list(params) as XML }
		}
    }
	
	def filter() {
		params.max = Math.min(params.max ? params.int('max') : 10, 20)
		params.sort = params.sort? params.sort : 'id'
		params.order = params.order? params.order : 'desc'
		
		def filterValue = params.get('filterValue')
		def featureBuildInstanceList = FeatureBuild.list(params)
		
		println 'filter value is: ' + filterValue
		
		def filterList = []
		featureBuildInstanceList.each { eachInstance ->
			if (eachInstance.getReleaseBranch().toString().equalsIgnoreCase(filterValue)) {
				if (filterList.size() < 10) filterList.add(eachInstance)
			}
		}
		
		featureBuildInstanceList.each { eachInstance ->
			if (eachInstance.getWeekOfYear().toString().equalsIgnoreCase(filterValue)) {
				if (filterList.size() < 10) filterList.add(eachInstance)
			}
		}
		
		println 'filter number is: ' + filterList.size()
		
		[fbil:filterList]
	}

    def create() {
		params.put("startPkgBuildTime", new Date())
        [featureBuildInstance: new FeatureBuild(params)]
    }

    def save() {
		def selectToolings = null
		
		if (params.get("startPkgBuildTime") == null || params.get("startPkgBuildTime") == '') {
			params.put("startPkgBuildTime", new Date())
		}
		
		def featureBuildInstance = new FeatureBuild(params)
		def fbIDList = []
		
		FeatureBuild.list().each {featureBuild ->
			if (featureBuild.getBranchName().equalsIgnoreCase(featureBuildInstance.getBranchName())) {
				fbIDList.add(featureBuild.id)
			}
		}
		
		FeatureBuild.list().each {fb->
			if (fb.id == fbIDList.max()) {
				featureBuildInstance.setComments(fb.getComments())
			}
		}
		
        if (!featureBuildInstance.save(flush: true)) {
            render(view: "create", model: [featureBuildInstance: featureBuildInstance])
            return
        }
		
		if (featureBuildInstance.getPmcVersion() == null) {
			Toolings.list().each {eachToolingSet ->
				def thatBranch = eachToolingSet.getFeatureBranch()
				def thisBranch = featureBuildInstance.getBranchName()
				if (thisBranch.equalsIgnoreCase(thatBranch) && thatBranch!=null) {
					selectToolings = eachToolingSet
				}
			}
			if (selectToolings != null) {
				featureBuildInstance.setToolSet(selectToolings)
				featureBuildInstance.setPmcVersion(selectToolings.getMiddleWare())
			}
		}

		flash.message = message(code: 'default.created.message', args: [message(code: 'featureBuild.label', default: 'FeatureBuild'), featureBuildInstance.id])
		redirect(action: "show", id: featureBuildInstance.id)
    }

    def show() {
		def selectToolings = null
        def featureBuildInstance = FeatureBuild.get(params.id)
		
        if (!featureBuildInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'featureBuild.label', default: 'FeatureBuild'), params.id])
            redirect(action: "list")
            return
        }
		/*
		 * if current feature build instance does not have tooling set info, grab from pool
		 **/
		if (featureBuildInstance.getToolSet() == null) {
			Toolings.list().each {eachToolingSet ->
				def thatBranch = eachToolingSet.getFeatureBranch()
				if (featureBuildInstance.getBranchName().equalsIgnoreCase(thatBranch) && thatBranch!=null) {
					selectToolings = eachToolingSet
				}
			}
			if (selectToolings != null) {
				featureBuildInstance.setToolSet(selectToolings)
			}
		}
		
		featureBuildInstance.getlastL6()
		withFormat {
			html {
				[featureBuildInstance: featureBuildInstance]
			}
			xml { render featureBuildInstance as XML }
		}
    }

    def edit() {
        def featureBuildInstance = FeatureBuild.get(params.id)
        if (!featureBuildInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'featureBuild.label', default: 'FeatureBuild'), params.id])
            redirect(action: "list")
            return
        }
		
        [featureBuildInstance: featureBuildInstance]
    }

    def update() {
        def featureBuildInstance = FeatureBuild.get(params.id)
        if (!featureBuildInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'featureBuild.label', default: 'FeatureBuild'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (featureBuildInstance.version > version) {
                featureBuildInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'featureBuild.label', default: 'FeatureBuild')] as Object[],
                          "Another user has updated this FeatureBuild while you were editing")
                render(view: "edit", model: [featureBuildInstance: featureBuildInstance])
                return
            }
        }
		
        featureBuildInstance.properties = params
		
		if (params.get("releaseTime") == null || params.get("releaseTime") == " ") {
			featureBuildInstance.properties.putAt("releaseTime", new Date())
		}
		
        if (!featureBuildInstance.save(flush: true)) {
            render(view: "edit", model: [featureBuildInstance: featureBuildInstance])
            return
        }
		
		if (featureBuildInstance.check_if_need_trigger_mail_sending()) {
			println(params.get("mailSwitch"))
			if (params.get("mailSwitch").equals("yes")) {
				featureBuildInstance.getlastL6()
				send_notification_mail(params, featureBuildInstance)
			}
		}
		/**
		 *
		 * will create Regression Instance once QT release load with QL >= 5.
		 *
		 * Jenkins will only do update action
		 *
		 * */
		boolean createCBRInstanceFlag = true
		Regression.list().each { reg ->
			if (reg.getTargetLoadName().equalsIgnoreCase(featureBuildInstance.getPackageName())) createCBRInstanceFlag = false
		}
		
		if (featureBuildInstance.get_qt_level_number_int() >= 5 && createCBRInstanceFlag) {
			RegressionController regCtrler = new RegressionController()
			if (RegressionCase.list().size() > 0) {
				int criticalNumber = 0
				int allcbrNumber = 0
				RegressionCase.list().each { regCase ->
					if (regCase.convertPriorityToNumber() >= 2) allcbrNumber = allcbrNumber + 1
					if (regCase.isCriticalCase()) criticalNumber = criticalNumber + 1
				}
				regCtrler.params.criticalNumber = criticalNumber
				regCtrler.params.allNumber = allcbrNumber
			} else {
				regCtrler.params.criticalNumber = 0
				regCtrler.params.allNumber = 0
			}

			regCtrler.params.executionStartTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())
			regCtrler.params.executionFinishedTime = 'NOT VALID'
			regCtrler.params.targetLoadName = featureBuildInstance.getPackageName()
			regCtrler.params.targetReleaeBranch = featureBuildInstance.getReleaseBranch()
			regCtrler.params.criticalPassNumber = 0
			regCtrler.params.allPassNumber = 0
			regCtrler.params.allExecutionMinutes = 0
			regCtrler.params.cbrLevel = "Level-0: T.B.D"
			regCtrler.params.cbrStatus = "INITIAL"
			
			regCtrler.save()
			
		} else {
			flash.message = message(code: 'default.updated.message', args: [message(code: 'featureBuild.label', default: 'FeatureBuild'), featureBuildInstance.id])
			redirect(action: "list")
		}
    }
	
	def stat() {
		//params.fbName
		def branchList = []
		FeatureBuild.list().each{
			if (it.branchName) {
				branchList.add(it.branchName)
			}
		}
		println(branchList.unique())
		[branchList: branchList.unique().sort{a,b-> b<=>a}]
	}
	def stat2(){
		print 'xx'
	}
	def fbstat2() {
		def result = [:]
		def branchList = []
		FeatureBuild.list().each{
			if (it.branchName) {
				if (it.branchName.equalsIgnoreCase("FB12.08")|| it.branchName.equalsIgnoreCase("FB12.12")||it.branchName.equalsIgnoreCase("FB13.05")) {
					branchList.add(it.branchName)
				}
			}
		}
		branchList.unique().sort{
			a,b-> a<=>b
		}
		branchList.each{branch->
			result[branch] = getData(branch)
		}

		render result as JSON
	}
	
	def getData2(data,interval){
		def calendar = []
		def result = ['All':['level':[],'time':[]]]

		if (interval == 'weekly'){
			Calendar start = Calendar.getInstance()
			start.setTime(Date.parse('yyyy-MM-dd', '2012-5-21'))
			def startPoint = start.getTimeInMillis()
			Calendar end = Calendar.getInstance()
			end.setTime(new Date())
			def endPoint = end.getTimeInMillis()
			
			def i = 0
			while(startPoint < endPoint) {
				startPoint = startPoint + 7 * 24 * 3600 * 1000 * i
				calendar<<[startPoint,0,0,0]
				i++
			}
			calendar<<[endPoint,0,0,0]
			print calendar
		} else if (interval == 'monthly') {
			Calendar start = Calendar.getInstance()
			start.setTime(Date.parse('yyyy-MM-dd', '2012-5-1'))
			startPoint = start.getTimeInMillis()
			Calendar end = Calendar.getInstance()
			end.setTime(new Date())
			endPoint = end.getTimeInMillis()
			
			while (startPoint < endPoint) {
				start.add(Calendar.MONTH, 1)
				startPoint = start.getTimeInMillis()
				calendar<<[startPoint,0,0,0]
			}
			calendar<<[endPoint,0,0,0]
		}
		def i = 0
		data.each{fb,value->
			value['level'].each{level->
				def k = 0
				calendar.each{
					if (calendar[k][0] < level[0] && k <= calendar.length()-1 && calendar[k+1][0] > level[0]) {
						calendar[k][1]++
						calendar[k][2] = calendar[k][2] + level[1]
						calendar[k][3] = calendar[k][3] + value['time'][i][1]
					}
				k++
				}
			i++
			}
		}

		calendar.each{value->
			result['All']['level']<<[value[0],value[2]/value[1]]
			result['All']['time']<<[value[0],value[3]/value[1]]
		}
		print '#########' + result
		return result;
	}
	def getData(branch){
		def fbList = FeatureBuild.findAllByBranchName(branch)
		
		def timeList = []
		def levelList = []
		def contentList = [:]
		fbList.each {fbbuild->
			if (fbbuild.qtProgress in ["Testing","Skip","Not Tested","Discard","StopFix"] == false) {
				def costTime = 0
				def timePoint = 0
				def level = -1
				Calendar cal = Calendar.getInstance() 
				cal.setTime(fbbuild.startPkgBuildTime)
				timePoint = cal.getTimeInMillis()// + 8 * 3600 * 1000

				["level-0","level-1","level-2","level-3","level-4","level-5","level-6","level-7"].each{ ql->
					if (fbbuild.qtLevel.toLowerCase().contains(ql)){
						level = Integer.parseInt(ql.replace("level-",""))
					} 
				}
				if (level == -1){
					log.error("Quality Level can't be found..")
				}

				if (!fbbuild.getAge().equals("N/A")){
					costTime = fbbuild.getAge()
				}
				
				timeList<<[timePoint,costTime]
				levelList<<[timePoint,level]
				contentList[timePoint] = ['Name: '+fbbuild.packageName,'PS: '+fbbuild.PS_Version,'DSP: '+fbbuild.DSP_Version,"MW: "+fbbuild.toolSet?.middleWare]
			}
		}
		return ['time':timeList,'level':levelList,'content':contentList]
	}
	
	def fbstat() {
		println(params.id)

		def fbList = FeatureBuild.findAllByBranchName(params.id)
		def xList = []
		def dList = []
		def qList = []
		def cList = []
		def i = 1
		fbList.each {
			xList.add(it.packageName)//.substring(11, 22)
			i++
		}
		fbList.each {
			if (it.qtLevel.toLowerCase().contains("t.b.d")){
				qList.add(-1)
			}else if (it.qtLevel.toLowerCase().contains("level-0")){
				qList.add(0)
			}else if (it.qtLevel.toLowerCase().contains("level-1")){
				qList.add(1)
			}else if (it.qtLevel.toLowerCase().contains("level-2")){
				qList.add(2)
			}else if (it.qtLevel.toLowerCase().contains("level-3")){
				qList.add(3)
			}else if (it.qtLevel.toLowerCase().contains("level-4")){
				qList.add(4)
			}else if (it.qtLevel.toLowerCase().contains("level-5")){
				qList.add(5)
			}else if (it.qtLevel.toLowerCase().contains("level-6")){
				qList.add(6)
			}else if (it.qtLevel.toLowerCase().contains("level-7")){
				qList.add(7)
			}
		}
		fbList.each {
			if (it.getAge().equals("N/A")){
				dList.add(0)
			} else {
				dList.add(it.getAge())
			}
		}
		fbList.each {
			cList.add([it.PS_Version,it.DSP_Version,"MW:"+it.toolSet?.middleWare])
		}
		def jsonData = [t:params.id,x:xList,q:qList,d:dList,c:cList]
		println(jsonData)
		render jsonData as JSON
	}
	
	def _guess_13a_cd_version_according_to_pkgName(String pkgName) {
		if (pkgName.split('_')[3].toString().equalsIgnoreCase('074')) {
			return '13A CD 1.1'
		}
		if (pkgName.split('_')[3].toString().equalsIgnoreCase('073')) {
			return '13A PT'
		}
		return '13A CD 1.3'
	}
	
	def _guess_13b_cd_version_according_to_pkgName(String pkgName) {
		if (pkgName.split('_')[3].toString().equalsIgnoreCase('070')) {
			return '13B CD 1.1'
		}
		
		if (pkgName.split('_')[3].toString().equalsIgnoreCase('071')) {
			return '13B CD 1.2'
		}
		
		if (pkgName.split('_')[3].toString().equalsIgnoreCase('072')) {
			return '13B CD 1.3'
		}
		
		if (pkgName.split('_')[3].toString().equalsIgnoreCase('073')) {
			return '13B CD 1.4'
		}
		
		if (pkgName.split('_')[3].toString().equalsIgnoreCase('074')) {
			return '13B CD 1.5'
		}
		
		if (pkgName.split('_')[3].toString().equalsIgnoreCase('075')) {
			return '13B CD 1.6'
		}
		
		if (pkgName.split('_')[3].toString().toInteger() >= 140 && pkgName.split('_')[3].toString().toInteger() < 150 ) {
			return '13B CD 2.0'
		}
		
		if (pkgName.split('_')[3].toString().toInteger() >= 150 && pkgName.split('_')[3].toString().toInteger() < 160) {
			return '13B CD 2.1'
		}
		
		if (pkgName.split('_')[3].toString().toInteger() >= 160 && pkgName.split('_')[3].toString().toInteger() < 170) {
			return '13B CD 2.2'
		}
		
		if (pkgName.split('_')[3].toString().toInteger() >= 170 && pkgName.split('_')[3].toString().toInteger() < 180) {
			return '13B CD 2.3'
		}
		
		if (pkgName.split('_')[3].toString().toInteger() >= 180 && pkgName.split('_')[3].toString().toInteger() < 190) {
			return '13B CD 2.4'
		}
		
		if (pkgName.split('_')[3].toString().toInteger() >= 190 && pkgName.split('_')[3].toString().toInteger() < 200) {
			return '13B CD 2.5'
		}
		
		return '13B P7'
	}
	
	def _guess_14a_cd_version_according_to_pkgName(String pkgName) {
		
		if (pkgName.split('_')[3].toString().toInteger() >= 120 && pkgName.split('_')[3].toString().toInteger() < 130) {
			return 'RLD8 CD 2.1'
		}
		
		if (pkgName.split('_')[3].toString().toInteger() >= 130 && pkgName.split('_')[3].toString().toInteger() < 140) {
			return 'RLD8 CD 3.0'
		}
		
		return 'RLD8'
	}
	
	def _guess_14b_cd_version_according_to_pkgName(String pkgName) {
		
		return 'RLD9(14B)'
	}
	
	def _guess_cd_version_according_to_pkgName(String pkgName, String relBranch) {
		if (relBranch.equalsIgnoreCase('13A')) {
			return _guess_13a_cd_version_according_to_pkgName(pkgName)
		}
		if (relBranch.equalsIgnoreCase('13B')) {
			return _guess_13b_cd_version_according_to_pkgName(pkgName)
		}
		if (relBranch.equalsIgnoreCase('14A')) {
			return _guess_14a_cd_version_according_to_pkgName(pkgName)
		}
		if (relBranch.equalsIgnoreCase('14B')) {
			return _guess_14b_cd_version_according_to_pkgName(pkgName)
		}
	}
	
	def _guess_releaseBranch_withFBranch(String branchName) {
		if (branchName.equalsIgnoreCase('FB13.05'))
			return '13B'
		if (branchName.equalsIgnoreCase('FB12.12'))
			return '13A'
		if (branchName.equalsIgnoreCase('FB12.08'))
			return '12B'
		if (branchName.equalsIgnoreCase('FB13.11'))
			return '14A'
		if (branchName.equalsIgnoreCase('FB14.06'))
			return '14B'
	}
	
	def _gen_mail_subject(params) {
		def default_mail_subject = "microREC 3G QT-I Report >> "
		def pkgName = params.get('packageName')
		def releaseBranch = _guess_releaseBranch_withFBranch(params.get('branchName'))
		def level = params.get('qtLevel')
		def levelDesc = null
		if (level.equalsIgnoreCase("T.B.D")) {
			level = '0'
			levelDesc = ""
		} else {
			levelDesc = level.split(":")[1]
			level = level.split(":")[0].split("-")[1]
		}
		
		def progressDesc = params.get('qtProgress')
		def progress = null
		if (progressDesc.equalsIgnoreCase('Released') || progressDesc.equalsIgnoreCase('Release with Restriction')) {
			progress = " **" + params.get('qtProgress').toUpperCase() + "** (Level:" + level + ")"
		} else {
			progress = " !!!" + params.get('qtProgress').toUpperCase() + "!!!"
		}
		
		return default_mail_subject + pkgName + '(' + _guess_cd_version_according_to_pkgName(pkgName, releaseBranch) + ')' + progress
	}
	
	def send_notification_mail(def params, def featureBuildInstance) {
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
				html view: "mailNotification", model:[featureBuildInstance: featureBuildInstance]
			}
			println 'mail notification sent'
			flash.put("mailSent","Confirmation email sent.")
		} catch (Exception e) {
			println 'mail notification not sent with exception ' + e.message
			__send_alarm_mail_to_admin(e.message)
			flash.put("mailSent","Confirmation email NOT sent due to:\\n" + e.message)
		}
	}
	
	def __send_alarm_mail_to_admin(String alarm) {
		def DEFAULT_SUBJECT = 'FAILED TO SEND MAIL DUE TO INVALID MAIL ADDRESS'
		def DEFAULT_TO_ = 'xi-raul.zhang@nsn.com'
		def DEFAULT_CC = 'jeffrey.shi@nsn.com'
		def DEFAULT_TEXT = 'hi\r\nPlease remove invalid address and try again\r\n\n\n\n'
		
		DEFAULT_TEXT = DEFAULT_TEXT + '\n' + alarm
		
		try {
			sendMail {
				subject DEFAULT_SUBJECT
				from "microREC_WCDMA_QT@noreply.com"
				replyTo "I_EXT_MBB_WCDMA_RA_BTS_DCM_QT@internal.nsn.com"
				to DEFAULT_TO_
				cc DEFAULT_CC
				text DEFAULT_TEXT
			}
			println 'alert mail notification sent to admin'
		} catch (Exception e) {
			println 'alert mail notification not sent to admin with exception>> ' + e.message
		}
	}

    def delete() {
        def featureBuildInstance = FeatureBuild.get(params.id)
        if (!featureBuildInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'featureBuild.label', default: 'FeatureBuild'), params.id])
            redirect(action: "list")
            return
        }

        try {
            featureBuildInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'featureBuild.label', default: 'FeatureBuild'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'featureBuild.label', default: 'FeatureBuild'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
