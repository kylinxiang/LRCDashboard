package LRC

class Regression {
	String executionStartTime
	String executionFinishedTime
	String targetLoadName
	String targetReleaeBranch
	
	String comments
	
	String cbrLevel
	String cbrStatus
	
	int criticalNumber
	int criticalPassNumber
	int allNumber
	int allPassNumber
	
	int allExecutionMinutes
	int valuedATDuration
	int valuedCBRDuration
	
	def regressionCases=[]
	
	String toString() {
		return executionFinishedTime	
	}
	
    static constraints = {
		targetLoadName(blank:false, maxSize:50)
		targetReleaeBranch(blank:false)
		executionStartTime(blank:true)
		executionFinishedTime(blank:true)
		
		comments(blank:true, maxSize:1000)
		
		criticalNumber(min:0, blank:false)
		criticalPassNumber(min:0, blank:false)
		allNumber(min:0, blank:false)
		allPassNumber(min:0, blank:false)
		
		allExecutionMinutes(min:0, blank:false)
		valuedATDuration(min:0, nullable:true)
		valuedCBRDuration(min:0, nullable:true)
		
		cbrLevel(inList:[
			"Level-0: T.B.D",
			"Level-7: Critical CBR Regression Case Executed And PASS",
			"Level-8: All CBR Regression Case Executed and PASS"], blank:false, nullable:false)
		
		cbrStatus(inList:[
			"INITIAL",
			"TESTED",
			"FAILED",
			"RESTRICTED",
			"RELEASED"],blank:false, nullable:false)
		
    }
	
	int estimateWastedDuration() {
		return allExecutionMinutes - estimateValuedDuration()
	}
	
	int estimateValuedDuration() {
		if (allExecutionMinutes == 0) return allExecutionMinutes
		return valuedATDuration + valuedCBRDuration
	}
	
	boolean isCBRStatusUpdateNecessary(){
		if (cbrStatus.equalsIgnoreCase('RESTRICTED') || cbrStatus.equalsIgnoreCase('RELEASED')) return false
		return true
	}
	
	int getCBRPassCaseNumber () {
		return allPassNumber - criticalPassNumber
	}
	
	int getCBRCaseNumber () {
		return allNumber - criticalNumber
	}
	
	int getCriticalPassRatio() {
		return criticalNumber == 0 ? criticalNumber: criticalPassNumber * 100 / criticalNumber 
	}
	
	int getPassRatio() {
		return allNumber == 0 ? allNumber: allPassNumber * 100 / allNumber
	}
	
	int calculateCBRLevel() {
		int level = 6
		if (criticalPassNumber == criticalNumber && criticalPassNumber > 0){
			if (allPassNumber == allNumber)
				return 8
			return 7
		}
		return 6
	}
	
	static hasMany = [featureBuilds:FeatureBuild]
	static belongsTo = [FeatureBuild]
}
