package uk.ac.shu.webarch.eregister

class RegClass {

	String className
	Instructor staffNumber
	Course courseNumber

	Set classes
	Set enrol

	static mappedBy = [classes:'className', enrol: 'className']
	static hasMany = [classes:Regsheet, enrol:Enrolment]

	

    	static constraints = {
    	}
}
