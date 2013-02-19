package uk.ac.shu.webarch.eregister

class Regsheet {

	String sheetNo
	String classDate
	RegClass className
	
	static mappedBy = [classes: 'sheetNo']
	static hasMany = [classes:Regentry]


    static constraints = {
    }
}
