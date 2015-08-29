package LRC

//import java.util.List;

class ContinueRegression {
	
	String executionStartTime
	String executionFinishedTime
	String targetReleaeBranch
	
	String crLevel
	String crStatus
	
	String comments

	int week
	int allNumber
	int executedNumber
	int failureNumber
	int allExecutionMinutes
	
	def regressionCases = []
	def regressionRecord = []
	
	@Override
	public String toString() {
		return executionStartTime;
	}

    static constraints = {
		
		week(range:1..53)
		targetReleaeBranch(blank:false)
		executionStartTime(blank:true)
		executionFinishedTime(blank:true)
		
		comments(blank:true, maxSize:1000)

		allNumber(min:0, blank:false)
		executedNumber(min:0, blank:false)
		failureNumber(min:0, blank:false)
		allExecutionMinutes(min:0, blank:false)
				
		crLevel(inList:[
			"Level-0: T.B.D",
			"Level-9: Continuous Regression Case Executed with Partial Failure",
			"Level-10: All Continuous Regression Case Executed and PASS"], blank:false, nullable:false)
		
		crStatus(inList:[
			"PLAN",
			"RUNNING",
			"PASS",
			"ABORT",
			"RESTRICTED"],blank:false, nullable:false)
    }
	
	int estimateValuedDuration() {
		if (allExecutionMinutes == 0) return allExecutionMinutes
		int duration = 0
		regressionCases.each { crCase ->
			duration = duration + crCase.duration
		}
		return duration
	}
	
	int getExecutionRatio() {
		return allNumber == 0? allNumber == 0: executedNumber * 100/allNumber
	}
	
	int getPassRatio() {
		return allNumber == 0? allNumber == 0: (allNumber - failureNumber) * 100/allNumber
	}
	
	int getPassedCaseNumber() {
		return allNumber - failureNumber
	}
	
}
