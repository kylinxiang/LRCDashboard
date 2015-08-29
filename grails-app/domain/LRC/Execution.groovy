package LRC

class Execution {
	String executionDate
	String targetLoadName
	
	String nsnCPCaseNumberTA
	String nsnCMCaseNumberTA
	String cieNetCPCaseNumberTA
	String cieNetCMCaseNumberTA
	
	String nsnCPCaseNumberTAPass
	String nsnCMCaseNumberTAPass
	String cieNetCPCaseNumberTAPass
	String cieNetCMCaseNumberTAPass
	
	String nsnCPCaseNumberAll
	String nsnCMCaseNumberAll
	String cieNetCPCaseNumberAll
	String cieNetCMCaseNumberAll
	
	String toString() {
		return executionDate
	}
	
    static constraints = {
		executionDate			(blank:false)
		targetLoadName			(blank:true)
		nsnCPCaseNumberTA		(blank:false)
		nsnCMCaseNumberTA		(blank:false)
		cieNetCMCaseNumberTA	(blank:false)
		cieNetCPCaseNumberTA	(blank:false)
		nsnCPCaseNumberTAPass   (blank:false)
		nsnCMCaseNumberTAPass   (blank:false)
		cieNetCPCaseNumberTAPass(blank:false)
		cieNetCMCaseNumberTAPass(blank:false)
		nsnCPCaseNumberAll      (blank:false)
		nsnCMCaseNumberAll      (blank:false)
		cieNetCPCaseNumberAll   (blank:false)
		cieNetCMCaseNumberAll   (blank:false)
		
    }
	
//	static hasMany = [caseInstances: CaseInstance]
//	static belongsTo = [CaseInstance]
//	
//	SortedSet caseInstances
}
