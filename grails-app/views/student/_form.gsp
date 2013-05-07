<%@ page import="uk.ac.shu.webarch.eregister.Student" %>



<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'studentID', 'error')} ">
	<label for="studentID">
		<g:message code="student.studentID.label" default="Student ID" />
		
	</label>
	<g:textField name="studentID" value="${studentInstance?.studentID}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'attendances', 'error')} ">
	<label for="attendances">
		<g:message code="student.attendances.label" default="Attendances" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${studentInstance?.attendances?}" var="a">
    <li><g:link controller="regentry" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="regentry" action="create" params="['student.id': studentInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'regentry.label', default: 'Regentry')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'classes', 'error')} ">
	<label for="classes">
		<g:message code="student.classes.label" default="Classes" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${studentInstance?.classes?}" var="c">
    <li><g:link controller="enrolment" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="enrolment" action="create" params="['student.id': studentInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'enrolment.label', default: 'Enrolment')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'courseNumber', 'error')} required">
	<label for="courseNumber">
		<g:message code="student.courseNumber.label" default="Course Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="courseNumber" name="courseNumber.id" from="${uk.ac.shu.webarch.eregister.Course.list()}" optionKey="id" required="" value="${studentInstance?.courseNumber?.id}" class="many-to-one" optionValue="courseName"/>
</div>

<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'learningCentreNo', 'error')} ">
	<label for="learningCentreNo">
		<g:message code="student.learningCentreNo.label" default="Learning Centre No" />
		
	</label>
	<g:textField name="learningCentreNo" value="${studentInstance?.learningCentreNo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'studentName', 'error')} ">
	<label for="studentName">
		<g:message code="student.studentName.label" default="Student Name" />
		
	</label>
	<g:textField name="studentName" value="${studentInstance?.studentName}"/>
</div>

