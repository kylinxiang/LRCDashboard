package LRC

class RegressionCase {
	
	String caseName
	String belongTeam
	String status
	String failureReason
	String comment
	int duration
	String priority
	String targetLoad
	Date lastRecordTime
	
	@Override
	public String toString() {
		return caseName
	}
	
    static constraints = {
		caseName(unique:true, blank:false)
		belongTeam(blank:false)
		status(blank:false, inList:["UNKNOWN","PASS","FAIL","SUSPEND", "UNSTABLE", "NOTRUN", "ABORT","NOTRUN"])
		failureReason(blank:true, inList:['--', 'HW PROBLEM', 'SW PROBLEM', 'CI PROBLEM', 'TA PROBLEM', 'IV PROBLEM'])
		comment(blank:true, maxSize:140)
		duration(blank:true)
		targetLoad(blank:true)
		lastRecordTime(nullable:true)
		priority(inList:[
			'ORDINARY',
			'MONSHO', 
			'ESSENTIAL',
			'CRITICAL'], blank:false)
    }
	
	def getWeekOfYear() {
		if (lastRecordTime != null && lastRecordTime != ''){
			return CalendarUtil.getWeekOfYear(lastRecordTime)
		}
		return null
	}
	
	def getDayofWeek() {
		if (lastRecordTime != null && lastRecordTime != ''){
			return CalendarUtil.getDayofWeek(lastRecordTime)
		}
		return null
	}
	
	String getReadableCalendarDay() {
		return CalendarUtil.getReadableCalendarDay(getDayofWeek())
	}
	
	int convertPriorityToNumber() {
		if (priority.equalsIgnoreCase("ORDINARY")) return 0
		if (priority.equalsIgnoreCase("MONSHO")) return 1
		if (priority.equalsIgnoreCase("ESSENTIAL")) return 2
		if (priority.equalsIgnoreCase("CRITICAL")) return 3
	}
	
	boolean isBelongToCRStage() {
		return !isBelongToCBRStage()
	}
	
	boolean isBelongToCBRStage() {
		return priority.equalsIgnoreCase('CRITICAL') || priority.equalsIgnoreCase('ESSENTIAL')
	}
	
	boolean isCriticalCase() {
		return priority.equalsIgnoreCase('CRITICAL')
	}

	boolean isExecutionPass() {
		return status.equalsIgnoreCase('PASS')
	}
}
