eRegister
=========

An electronic attendance register.

How to run the application
==========================

1. If you are reading this README file then the full eRegister application should have downloaded. Open your Terminal and use the 'cd eRegister' command to place yourself in the eRegister directory.

2. Use the 'grails run-app'command and wait for the URL link to appear. 

3. Open the URL link using right-click 'Open Link'

4. This link will open the application homepage. On this you will see an Admin area containing all domain classes listed. Within these you can create, edit and delete data. 

5. You will see there is already some data inserted into the Instructor, Student, Course, Class and Registration Sheet. This data has been inserted during your initial start up of the application. Visit the grails-app/conf/BootStrap.groovy to view the data that is being inserted. 

6. Visit each domain class listed and add, delete and edit the data.

7. Now go back to the homepage again. Click the 'Register Here' link to take you to the sign in form.

8. Enter either an existing student ID (b0017041 or b1006578)or use one created by yourself. For Sheet No enter either (1 or 2) to sign in on those sheets, or use one created by yourself.

9. You will be directed to a confirmation page displaying the ID and Sheet you have been signed in on. 

10. From the confirmation page you can view how many students have attended classes. You can view this by clicking on the 'Attendence Class List'to view a table of results display student name, sheet no and the timestamp from when they sign in. 

11.To view this information in XML or JSON change the URL extension to .xml or .json. 

12. Click the browser back button to go back to the confirmation page again. Clicking the 'Class Attendees Summary' will take you to a page with dropdown form. This form will redirect nowhere.

13. You should have now explored the whole application. 


=============================================================================================

