package LRC

class CorrectedPronto {
	
	String prontoID
	String componentName
	String componentBaseLine
	String prontoDescription

	@Override
	public String toString() {
		return prontoID;
	}
	
    static constraints = {
		prontoID(blank:false, unique: true)
		componentName(blank:false)
		componentBaseLine(blank:false)
		prontoDescription(blank:false)
    }
	
	static hasMany = [featurebuilds:FeatureBuild]
	static belongsTo = [FeatureBuild]
}
