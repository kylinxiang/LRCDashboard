package LRC

import java.util.Date;

class Pronto implements Comparable {
	
	String prontoID
	String foundArea
	String description
	String owner
	String status
	String priority
	Date newTime
	Date closeTime
	String followUp
	String analyseReason
	String correctiveAction
	String daManager
	String groupInCharge
	String lineManager
	String comments
	String impactLevel
	String impactStatus
	Boolean isInherit = false

    static constraints = {
		prontoID(blank:false)
		foundArea(blank:false, inList:["CP","OAM","TRS","CPRI","QT", "CBR", "CR"])
		description(maxSize:500, blank:false)
		owner(inList:["Shi Jeffrey","Wang Pengcheng", "Yang Steven", "Zhang Xi"], blank:false)
		status(inList:["New","Investigating","First Correction Complete","First Correction Ready For Testing","Correction Not Needed","Closed"],blank:false)
		priority(inList:["NA","A1","A2","B1","B2","B3","B4"],blank:false)
		newTime(nullable:true)
		closeTime(nullable:true)
		followUp(blank:false, inList:["Haiqin"])
		analyseReason(nullable:true)
		daManager(nullable:true)
		groupInCharge(blank:false, inList:["PS","OAM","TRS", "3GDSP", "PMC"])
		lineManager(nullable:true)
		comments(maxSize:500)
		impactLevel(blank:false, inList:["Level-1",
										 "Level-2",
										 "Level-3",
										 "Level-4",
										 "Level-5",
										 "Level-6",
										 "Level-7",
										 "Level-8",
										 "Level-9",
										 "Level-10",])
		impactStatus(blank:false, inList:["Failed", "Block", "Release with Restriction"])
    }
	
	@Override
	public String toString() {
		return prontoID + ":" + description
	}
	
	@Override
	public int compareTo(def other) {
		return getId() <=> other?.getId()
	}
	
	static hasMany = [featurebuilds:FeatureBuild]
	
}
