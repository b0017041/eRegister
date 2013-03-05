package uk.ac.shu.webarch.eregister

class Student {
	
	String studentName
	String studentID
	String learningCentreNo
	String courseNumber

        
	Set classes
        Set attendances

	
	static mappedBy = [attendances:'studentID', classes: 'studentID']
	static hasMany = [attendances:Regentry, classes:Enrolment]


    	static constraints = {

	studentID unique: true

    	}
}
