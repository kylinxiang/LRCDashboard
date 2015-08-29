package LRC

class Toolings {
	String featureBranch
	
	String releaseLabel
	
	String middleWare
	
	String cntCPVersion
	String cntSVVersion
	
	boolean isAbolish
	
	String mwDownloadURL
	String tm500Version
	String artizaVersion
	String eATTVersion
	String DSPExplorerVersion
	String BTSLogVersion
	String MMTVersion
	String memDumpVersion

    static constraints = {
		featureBranch(blank:false)
		
		releaseLabel(blank: true, nullable:true)
		
		middleWare(blank:false)
		
		cntCPVersion(blank:true, nullable:true)
		cntSVVersion(blank:true, nullable:true)
		
		isAbolish(nullable:false)
		
		mwDownloadURL(nullable:true)
		tm500Version(nullable:true)
		artizaVersion(nullable:true)
		eATTVersion(nullable:true)
		DSPExplorerVersion(nullable:true)
		BTSLogVersion(nullable:true)
		MMTVersion(nullable:true)
		memDumpVersion(nullable:true)
    }
	
	def isAbolish() {
		return isAbolish
	}
	
	def get_mw_downloadURL() {
		def baseURL = "http://microrec3gci.china.nsn-net.net:8080/job/PMC_MW_EXTRACT/ws"
		return baseURL + this.middleWare
	}
}
