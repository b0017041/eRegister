import uk.ac.shu.webarch.eregister.*;
class BootStrap {

    def init = { servletContext ->

     println("BootStrap::init");

     /*INSTRUCTOR VALUES*/

     def ian_instructor = Instructor.findByStaffNumber('2345a') ?:  new Instructor(staffNumber: '2345a', staffName: 'Ian Ibbotson', contactDetails: '07987654327', faculty: 'ACES').save(failOnError: true);
     def matthew_instructor = Instructor.findByStaffNumber('987b') ?: new Instructor(staffNumber: '987b', staffName: 'Matthew Love', contactDetails: '07342764538', faculty: 'ACES').save(failOnError: true);

     /*COURSE VALUES*/

     def web_arch = Course.findByCourseNumber('1a') ?: new Course(courseNumber: '1a', 
								  courseName: 'Web Architecture', 
								  courseLeader: ian_instructor, 
								  faculty: 'ACES').save(failOnError: true);

     def web_design = Course.findByCourseNumber('3') ?: new Course(courseNumber: '3', 
								  courseName: 'Web Design & Development', 
								  courseLeader: ian_instructor, 
								  faculty: 'ACES').save(failOnError: true);

     def computing = Course.findByCourseNumber('2') ?: new Course(courseNumber: '2', 
								  courseName: 'Computing', 
								  courseLeader: ian_instructor, 
								  faculty: 'ACES').save(failOnError: true);
     /* If i was creating this application for real I would create faculty as variable */
     /*This data also stands as test data*/
     
     /*STUDENT VALUES*/
    
     def lucy_student = Student.findByStudentID('b0017041') ?: new Student(studentID: 'b0017041',
								         studentName: 'Lucy Benham',
									 learningCentreNo:'b0017041',
									 courseNumber: web_arch).save();

      def jack_student = Student.findByStudentID('b1006578') ?: new Student(studentID: 'b1006578',
								         studentName: 'Jack Fairhurst',
									 learningCentreNo:'b1006578',
									 courseNumber: computing).save();

     /*CLASS VALUES*/

      def monday_class = RegClass.findByClassName('Monday 14.00') ?: new RegClass(className: 'Monday 14.00',
								         staffNumber: matthew_instructor,
									 courseNumber: computing).save(); 

    def tuesday_class = RegClass.findByClassName('Tuesday 16.00') ?: new RegClass(className: 'Tuesday 16.00',
								         staffNumber: ian_instructor,
									 courseNumber: web_design).save(); 

     /*REGSHEET*/
     def row_one = Regsheet.findBySheetNo('1') ?: new Regsheet(sheetNo: '1',
								classDate: '23/04/2013',
								className: monday_class).save();

    }
    def destroy = {
    }
}
