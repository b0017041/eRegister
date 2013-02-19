package uk.ac.shu.webarch.eregister

class Instructor {

	String class_Instructor
	String staffNumber
	String contactDetails
	String faculty

	static mappedBy = [classes:'staffNumber']
	static hasMany = [classes:RegClass]

    static constraints = {
    }
}
