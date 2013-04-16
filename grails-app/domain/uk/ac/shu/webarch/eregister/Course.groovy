package uk.ac.shu.webarch.eregister

class Course {

	String courseName
	String courseNumber
	Instructor courseLeader
	String faculty

	Set classes
	Set courses
	
	static mappedBy = [classes:'courseNumber', courses:'courseNumber']
	static hasMany = [classes:RegClass, courses:Student]

    	static constraints = {

	courseNumber unique: true

    	}
}
