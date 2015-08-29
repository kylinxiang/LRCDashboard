package LRC

class ProntoStat {
	String queryDay
	String allCreatedByIV
	String allCreatedBySW
	String allOpenBySW
	String todayCreatedByIV
	String todayCreatedByLevel
	int todayCreatedWhole
	
	String cnnRateByIV
	String productiveByIV
   
	String corrAverTimeBySW 
	String corrAverTimeByLevel
	
	String verAverTimeByIV 
	String verAverTimeByLevel
	Double verAverTimeWhole
	
	static constraints = {
		queryDay(nullable:false)
		allCreatedByIV(nullable:true)
		allOpenBySW(nullable:true)
		todayCreatedByIV(nullable:true)
		todayCreatedByLevel(nullable:true)
		todayCreatedWhole(nullable:true)
		
		cnnRateByIV(nullable:true)
		productiveByIV(nullable:true)
	   
		corrAverTimeBySW(nullable:true)
		corrAverTimeByLevel(nullable:true)
		
		verAverTimeByIV(nullable:true)
		verAverTimeByLevel(nullable:true)
		verAverTimeWhole(nullable:true)
	}
	static mapping = {
		allOpenBySW type:'text'
		}
}
