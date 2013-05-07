package uk.ac.shu.webarch.eregister

import grails.converters.*

class ClassesController {

    def index() { 

      def result=[:]
         result.classList = [] 
	 Regentry.findAll().each { cls ->
          result.classList.add([studentName:cls.studentID.studentName, RegTime:cls.ts, sheet:cls.sheetNo])}
      withFormat {
        html result
        xml { render result as XML }
        json { render result as JSON }
      }

  }
def listAttendeesSummary() {
	def result = [:]
	println params.className
	println(params)
	result.className = params.className
/*My intention here was to display all members enrolled onto the selected class to be displayed in a table, those who had attended to be stamped with a timestamp and those who hadn't had none. I planned to use a countBy function to count the number of rows returned.*/

  }


}
