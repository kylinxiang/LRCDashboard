package LRC

class Audience {
	
	String mailAddress
	boolean isbcc

    static constraints = {
		mailAddress(blank:false, unique:true)
    }
}
