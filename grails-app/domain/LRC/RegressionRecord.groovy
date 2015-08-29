package LRC

class RegressionRecord {
	String recordTime
	
	long regressionID

	int totalNumber
	int passedNumber
	int failedNumber
	int executedNumber

	int executionDuration
	int valuedDuration
	int executedLoadNumber
		
	@Override
	public String toString() {
		return recordTime
	}

    static constraints = {
		
    }
}
