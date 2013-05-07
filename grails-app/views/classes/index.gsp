<html>
	<head>
		<meta name="layout" content="main"/>
		<title>SHU | eRegister</title>
	</head>
  <body>
    <h3 style="padding: 20px;">Attendence Class List</h3>
    <p style="margin: 0px 0px 10px 20px;"><a href="http://localhost:8080/eRegister/apply">Back to register</a>
    <table>
      <thead>
        <tr>
          <td><strong>Student ID</strong></td>
          <td><strong>Date</strong></td>
	  <td><strong>Sheet Number</strong></td>
        </tr>
       </thead>
       <tbody>
         <g:each in="${classList}" var="c">
           
             <tr>
               <td>${c.studentName}</td>
               <td><g:formatDate type="datetime" style="MEDIUM" date="${c.RegTime}" /></td>
	       <td>${c.sheet.sheetNo}</td>
             </tr>
           
         </g:each>
        </tbody>
     </table>
  </body>
</html>

