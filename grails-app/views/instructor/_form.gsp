<%@ page import="uk.ac.shu.webarch.eregister.Instructor" %>



<div class="fieldcontain ${hasErrors(bean: instructorInstance, field: 'staffNumber', 'error')} ">
	<label for="staffNumber">
		<g:message code="instructor.staffNumber.label" default="Staff Number" />
		
	</label>
	<g:textField name="staffNumber" value="${instructorInstance?.staffNumber}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: instructorInstance, field: 'classes', 'error')} ">
	<label for="classes">
		<g:message code="instructor.classes.label" default="Classes" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${instructorInstance?.classes?}" var="c">
    <li><g:link controller="regClass" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="regClass" action="create" params="['instructor.id': instructorInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'regClass.label', default: 'RegClass')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: instructorInstance, field: 'contactDetails', 'error')} ">
	<label for="contactDetails">
		<g:message code="instructor.contactDetails.label" default="Contact Details" />
		
	</label>
	<g:textField name="contactDetails" value="${instructorInstance?.contactDetails}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: instructorInstance, field: 'faculty', 'error')} ">
	<label for="faculty">
		<g:message code="instructor.faculty.label" default="Faculty" />
		
	</label>
	<g:textField name="faculty" value="${instructorInstance?.faculty}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: instructorInstance, field: 'staffName', 'error')} ">
	<label for="staffName">
		<g:message code="instructor.staffName.label" default="Staff Name" />
		
	</label>
	<g:textField name="staffName" value="${instructorInstance?.staffName}"/>
</div>

