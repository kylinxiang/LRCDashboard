package LRC

import grails.converters.*
import groovy.json.JsonSlurper
import groovy.json.JsonOutput


class InterfaceController {

    def index() {
		def fbList = FeatureBuild.list()
		print fbList
		fbList.sort{
			a,b->
			b.id <=> a.id
		}
		def latestedFB = null
		for(fb in fbList){
			if(fb.qtLevel != "T.B.D") {
				latestedFB = fb
				break
			}
		}
		
		def sum = 0
		def amount = 0
		fbList.each{ fbbuild->
			if (fbbuild.startPkgBuildTime != null) {
				if (fbbuild.startPkgBuildTime.format("yyyy-MM") == new Date().format("yyyy-MM")) {
					["level-0","level-1","level-2","level-3","level-4","level-5","level-6","level-7"].each{ level->
						if (fbbuild.qtLevel.toLowerCase().contains(level)){
							sum = sum + Integer.parseInt(level.replace("level-",""))
							amount = amount + 1
						}
					}
				}
			}
		}

		def averql = 0  
		if (amount != 0){
			averql = new Double(sum/amount).round(1)
		}
		
		def today = new Date().format("yyyy-MM-dd")
		print QTPronto.findByQueryDay(today)
		def openpr = revertList(QTPronto.findByQueryDay(today)?.getOpenList())
		def open = 0
		openpr.each{
			k,v->
			open = open + v
		}
		def cnnList = revertList(QTPronto.findByQueryDay(today)?.getStatusList())
		def allpronto = 0
		cnnList.each{k,v->
			allpronto = v + allpronto
		}
		
		def cnnratio = new Double(cnnList[1][1]/allpronto).round(2)
		def rftList = []
		latestedFB.correctedprontos.each{ 
			rftList << it.prontoID
		}
		
		Execution latestExecution = Execution.list()[-1]
		
		int allInstance = Integer.valueOf(latestExecution.cieNetCMCaseNumberAll) + 
						  Integer.valueOf(latestExecution.cieNetCPCaseNumberAll) + 
						  Integer.valueOf(latestExecution.nsnCMCaseNumberAll) + 
						  Integer.valueOf(latestExecution.nsnCPCaseNumberAll)
						  
		int allExecuted = Integer.valueOf(latestExecution.getCieNetCMCaseNumberTA()) + 
						  Integer.valueOf(latestExecution.getCieNetCPCaseNumberTA()) + 
						  Integer.valueOf(latestExecution.getNsnCMCaseNumberTA()) + 
						  Integer.valueOf(latestExecution.getNsnCPCaseNumberTA())
						
		int allPass = Integer.valueOf(latestExecution.cieNetCMCaseNumberTAPass) + 
					  Integer.valueOf(latestExecution.cieNetCPCaseNumberTAPass) + 
					  Integer.valueOf(latestExecution.nsnCMCaseNumberTAPass) + 
					  Integer.valueOf(latestExecution.nsnCPCaseNumberTAPass)
		
		double rtRatio = new Double(allExecuted/allInstance).round(2) 
		double rtPassRatio = new Double(allPass/allInstance).round(2)

		def verAver = ProntoStat.findByQueryDay(today)?.getVerAverTimeWhole()
		
		def rftString =	''
		
		rftList.each{
			rftString = rftString+'<string>'+it+'</string>'
		}
		
		def xml = '<?xml version="1.0" encoding="UTF-8"?>'+
					'<map>'+
					'<entry key="team">microRECIV</entry>'+
					    '<entry key="RTRatio">'+
					        '<entry key="value">'+rtRatio+'</entry>'+
					        '<entry key="link">http://url/to/detail/page</entry>'+
					    '</entry>'+
					        '<entry key="RTPassRatio">'+
					        '<entry key="value">'+rtPassRatio+'</entry>'+
					        '<entry key="link">http://url/to/detail/page</entry>'+
					    '</entry>'+
					    '<entry key="AverageQL">'+
					        '<entry key="value">'+averql+'</entry>'+
					        '<entry key="link">http://url/to/detail/page</entry>'+
					    '</entry>'+
					        '<entry key="QTStatus">'+
					        '<entry key="name">'+latestedFB.packageName+'</entry>'+
					        '<entry key="status">'+latestedFB.qtProgress+'</entry>'+
					        '<entry key="qtlevel">'+latestedFB.qtLevel+'</entry>'+
					        '<entry key="link">http://url/to/detail/page </entry>'+
					    '</entry>'+
					    '<entry key="RFT">'+
							rftString+
					    '</entry>'+
					    '<entry key="OpenPR">'+
					        '<entry key="value">'+open+'</entry>'+
					        '<entry key="link">http://url/to/detail/page</entry>'+
					    '</entry>'+
					    '<entry key="Monsho">'+
					        '<entry key="value">'+0+'</entry>'+
					        '<entry key="link">http://url/to/detail/page</entry>'+
					    '</entry>'+
					    '<entry key="CNNRatio">'+
					        '<entry key="value">'+cnnratio+'</entry>'+
					        '<entry key="link">http://url/to/detail/page</entry>'+
					    '</entry>'+
					    '<entry key="MSNPro">'+
					        '<entry key="value">'+0+'</entry>'+
					        '<entry key="link">http://url/to/detail/page</entry>'+
					    '</entry>'+
						'<entry key="PTNPro">'+
					        '<entry key="value">'+0+'</entry>'+
					        '<entry key="link">http://url/to/detail/page</entry>'+
					    '</entry>'+
					    '<entry key="VerificationTime">'+
					        '<entry key="value">'+verAver+'</entry>'+
					        '<entry key="link">http://url/to/detail/page</entry>'+
					    '</entry>'+
					    '<entry key="CorrectionTime">'+
					        '<entry key="value">'+0+'</entry>'+
					        '<entry key="link">http://url/to/detail/page</entry>'+
					    '</entry>'+
					    '<entry key="snapshot">'+
					        'http://microrec3gci.china.nsn-net.net:8080/examples/jsp/images/code.gif'+
					    '</entry>'+
					'</map>'
		render xml

	}
	
	def revertList(input) {
		def result = []
		def root = new JsonSlurper().parseText(input)
		if( root instanceof Map) {
			print "string has been convered to map"
		}
		root.each{ k,v->
			result << [k,v]
		}
		return result
	}
}
