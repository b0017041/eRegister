<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>SHU | eRegister</title>
		
	</head>
	<body>
	   <div id="margin" style="padding: 20px;">		
		<h3 style="margin-left: 20px;">Sign In Registration</h3>
                   
                  <div id="marginForm" style="margin: 20px;">
                    <p style="margin-bottom: 10px;">Enter your Student ID and your Class to sign in to your class.</p>
		    <g:form name="registration" id="registration" action="processAttendance" method="GET">
		    <p>Student ID:</p> <g:textField name="studentID" id="studentID" value="${studentID}" />
		    <div id="moveDown" style="margin-top: 10px;"><p>Sheet No:</p><g:textField name="className" id="className" value="${className}" /></div>
		    <div id="moveDown" style="margin-top: 10px;"><p><g:submitButton name="register" value="Register" /></p></div>
		    </g:form>
                  </div>
	   </div>
	</body>
</html>


