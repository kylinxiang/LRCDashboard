package LRC

import java.util.Date
import java.util.SortedSet

class FeatureBuild {
	
	String packageName
	String qtLevel
	String qtProgress
	String pkgdownloadURL
	String PS_Version
	String PNS_Version
	String DSP_Version
	String OAM_Version
	String TRS_Version
	String SMC_Version
	String comments
	String branchName
	String lastL6id
	String pmcVersion
	String releaseBranch
	
	String basedLoad
	
	def correctedprontosfromlastL6=[]
	Date startPkgBuildTime
	Date releaseTime
	
	Toolings toolSet

	String toString() {
		return packageName
	}
	
	String doCapitalize(string) {
		if (string.length() == 0) return string
		return string.substring(0, 1).toUpperCase() + string.substring(1)
	}
	
	def getWeekOfYear(){
		if (releaseTime != null && releaseTime != ''){
			return CalendarUtil.getWeekOfYear(releaseTime)
		}
		return "--"
	}
	
	def getAge() {
		def lAge = "N/A"
		def lNewTime = 0
		if(releaseTime != null && startPkgBuildTime != null){
			lAge=CalendarUtil.calculateWorkHours(startPkgBuildTime, releaseTime)
		}
		return lAge
	}
	
	def get_belonged_pr_number() {
		int number_of_br = 0
		if (this.prontos != null)
			return this.prontos.size()
		return number_of_pr
	}
	
	def get_feature_build_with_branchName() {
		FeatureBuild previousPB = null
		Long current_id = getId()
		Long previous_id = current_id - 1
		while (previousPB == null && previous_id > 0 ) {
			previousPB = FeatureBuild.get(previous_id)
			if (previousPB !=null && previousPB.getPackageName().equalsIgnoreCase(FeatureBuild.get(current_id).getBasedLoad())) {
				break
			} else {
				previousPB = null
			}
			previous_id = previous_id - 1
		}
		return previousPB
	}
	
	//new
	def getlastL6() {
		lastL6id = "None"
		correctedprontosfromlastL6 = []
		
		def fbList = FeatureBuild.list()
		fbList.sort{
			a,b ->
			b.packageName <=> a.packageName
		}
		
		for (int i = fbList.lastIndexOf(this); i < fbList.size() - 1; i++) {
			boolean sameLine = false
			FeatureBuild lastL6 = fbList.get(i + 1)
			if (packageName.split("_")[4] != "00") {
				//DND1.0_ENB_1208_012_xx
				if (lastL6.packageName.split("_")[2] == packageName.split("_")[2] && lastL6.packageName.split("_")[3] == packageName.split("_")[3]) {
					sameLine = true
				}
			}
			//DND1.0_ENB_1208_xxx_00
			if (lastL6.packageName.split("_")[4] == "00" && lastL6.packageName.split("_")[2] == packageName.split("_")[2] && Integer.parseInt(lastL6.packageName.split("_")[3]) < Integer.parseInt(packageName.split("_")[3])) {
				sameLine = true
			}
			//DND1.0_ENB_xxxx_xxx_00
			if (lastL6.packageName.split("_")[4] == "00"  && Integer.parseInt(lastL6.packageName.split("_")[2]) < Integer.parseInt(packageName.split("_")[2])) {
				sameLine = true
			}
			if (sameLine) {
					if (lastL6.qtLevel.toLowerCase().contains("level-6")) {
						lastL6id = lastL6.packageName
						break
					} else {
						correctedprontosfromlastL6.add(lastL6.correctedprontos)
						println("Add "+ lastL6.packageName + " corrected prontos for " + packageName)
					}
			}
		}
		correctedprontosfromlastL6 = correctedprontosfromlastL6.flatten().unique()
	}
	
	def get_if_field_changed_compare_same_branch (String fieldName) {
		FeatureBuild previousBuild = get_feature_build_with_branchName()
		
		if (previousBuild != null) {
			String current_value =  FeatureBuild.getMethod('get' + doCapitalize(fieldName), [] as Class[]).invoke(this)
			String previous_field_value  = FeatureBuild.getMethod('get' + doCapitalize(fieldName), [] as Class[]).invoke(previousBuild)
			if ( previous_field_value != current_value) {
				return true
			}
		}
		return false
	}
	
	boolean check_if_need_trigger_mail_sending() {
		String status = FeatureBuild.get(getId()).getQtProgress()
		if (status.equalsIgnoreCase('Released') || status.equalsIgnoreCase('Release with Restriction') || status.equalsIgnoreCase('Failed') || status.equalsIgnoreCase('RollBack') || status.equalsIgnoreCase('key update')) {
			return true
		}
		return false
	}
	
	int get_qt_level_number_int() {
		String level = get_qt_level_number()
		println "QL Level is: " + level
		return Integer.parseInt(level)
	}
	
	def get_qt_level_number() {
		String level = FeatureBuild.getMethod('get' + doCapitalize("qtLevel"), [] as Class[]).invoke(this)
		if (level.equalsIgnoreCase("T.B.D"))
			return "0"
		return level.split(":")[0].split("-")[1]
	}
	
	def getPuttibattiZipName() {
		if (pkgdownloadURL != null) {
			def parseString = pkgdownloadURL.replace('\\', '/')
			return parseString.substring(parseString.lastIndexOf('/') + 1)
		} else {
			return "N/A"
		}
	}
	
	def getReleaseBranch() {
		if (branchName.equalsIgnoreCase('FB13.11'))
			return '14A'
		if (branchName.equalsIgnoreCase('FB13.05'))
			return '13B'
		if (branchName.equalsIgnoreCase('FB12.12'))
			return '13A'
		if (branchName.equalsIgnoreCase('FB12.08'))
			return '12B'
	}
	
    static constraints = {
		packageName(maxSizde:50, blank:false)
		qtLevel(inList:["Level-0: T.B.D",
						"Level-0: Package can't be installed",
						"Level-1: Package Installed Successfully",
						"Level-2: BTS Startup and Alarm Process Successfully",
						"Level-3: Cell Setup and Cell Search Successfully",
						"Level-4: Make R99 Call Successfully",
						"Level-5: Make 14M HSDPA DL call Successfully(LD2/LD11, Tx-Div/Power=OFF)", 
						"Level-6: Make 14M HSDPA DL call Successfully(LD2/LD11, Tx-Div/Power=ON)"],blank:false, nullable:false)
		qtProgress(inList:["Testing","Released","Release with Restriction","Skip","Not Tested","Discard","Failed", "StopFix", "RollBack", "key update"],blank:false)
		startPkgBuildTime(nullable:true)
		releaseTime(nullable:true)
		comments(maxSize:1000)
		pkgdownloadURL(nullable:true)
		PS_Version(nullable:true)
		PNS_Version(nullable:true)
		DSP_Version(nullable:true)
		OAM_Version(nullable:true)
		TRS_Version(nullable:true)
		SMC_Version(nullable:true)
		branchName(nullable:false)
		releaseBranch(nullable:true)
		toolSet(nullable:true)
		lastL6id(nullable:true)
		pmcVersion(nullable:true)
		correctedprontosfromlastL6(nullable:true)
		basedLoad(nullable:true)
		
    }
	static belongsTo = [Pronto]
	static hasMany = [prontos: Pronto, correctedprontos: CorrectedPronto, cbrgression: Regression, crgression: ContinueRegression]
	
	SortedSet prontos
}
