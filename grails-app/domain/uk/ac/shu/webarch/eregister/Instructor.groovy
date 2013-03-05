package uk.ac.shu.webarch.eregister

class Instructor {

	String staffNumber
	String staffName
	String contactDetails
	String faculty

	Set classes

	static mappedBy = [classes:'staffNumber']
	static hasMany = [classes:RegClass]

    static constraints = {

	staffNumber unique: true

    }
}
