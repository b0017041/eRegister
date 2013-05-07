<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>SHU | eRegister</title>
		
	</head>
	<body>
	  <div id="move" style="padding: 20px;">
	     <h3 style="margin-bottom: 20px;">Attendence Percentage</h3>
	        <p style="margin-bottom: 10px;">Select Class to find out percentage Attendence</p>
		<p>Select Class: <g:select id="className" name="className.id" from="${uk.ac.shu.webarch.eregister.RegClass.list()}" optionKey="id" required="" value="${regClassInstance?.className?.id}" class="many-to-one" optionValue="className"/>
		<div id="moveDown" style="margin-top: 10px;"><p><g:submitButton name="register" value="Register" /></p></div>
	  </div>
	</body>
</html>
