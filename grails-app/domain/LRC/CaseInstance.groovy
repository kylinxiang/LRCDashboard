package LRC

class CaseInstance {
	String caseName
	String featrueName
	String domainName
	String executionStatus
	String nextExecutionNumber
	String targetDB
	String duration
	String startTime

    static constraints = {
		caseName(blank:false, unique:true)
		featrueName(blank:true)
		nextExecutionNumber(blank:false)
		domainName(inList:["N/A","CIENET-CP","CIENET-OAM", "CIENET-TRS", "CIENET-CPRI", "NSN-CP", "NSN-OAM","NSN-TRS", "NSN-CPRI", "NSN-QT"], blank:false, nullable: false)
		executionStatus (inList:["PASS","FAIL","RUNNING","ABORT","NOTRUN","UNSTABLE"], blank:false, nullable:false)
    }
	
}
