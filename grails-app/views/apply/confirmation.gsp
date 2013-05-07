<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>SHU | eRegister</title>
		
	</head>
	<body>
          <div id="margin" style="padding: 20px;">
		<h3 style="margin-bottom: 20px;">Your attendence has been confirmed.</h3>
		<p style="margin-bottom: 10px;">${studentID} has confirmed their attendence for class ${className}.</p>
                <p><a href="http://localhost:8080/eRegister/classes" title="Class List">Attendence Class List</a></p>
                <p><a href="http://localhost:8080/eRegister/classes/listAttendeesSummary" title="Class List">Class Attendees Summary</a></p>
	  </div>
	</body>
</html>
