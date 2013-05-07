package uk.ac.shu.webarch.eRegister
import uk.ac.shu.webarch.eregister.*

class ApplyController {

    def index() { }

	def processAttendance() {
	def result = [:]
	println params.studentID
	println params.className
	println(params)
	result.studentID = params.studentID
	result.className = params.className
	def locatedStudent = Student.findByStudentID(params.studentID)
	def locatedSheet = Regsheet.findBySheetNo(params.className)
	println("locatedStudent=${locatedStudent}")
	println("locatedSheet=${locatedSheet}")
	def newRegisterEntry = new Regentry(studentID:locatedStudent, sheetNo:locatedSheet).save()
	render(view:'confirmation', model:result)

}
     
}
