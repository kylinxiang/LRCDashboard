package LRC

class QTPronto {
	String queryDay
	String totalList
	String openList
	String statusList
	int open
	int total
	
	static constraints = {
		queryDay(nullable:false)
		totalList(nullable:true)
		openList(nullable:true)
		statusList(nullable:true)
		open(nullable:true)
		total(nullable:true)
	}
}
