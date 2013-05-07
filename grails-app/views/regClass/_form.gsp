<%@ page import="uk.ac.shu.webarch.eregister.RegClass" %>



<div class="fieldcontain ${hasErrors(bean: regClassInstance, field: 'className', 'error')} ">
	<label for="className">
		<g:message code="regClass.className.label" default="Class Name" />
		
	</label>
	<g:textField name="className" value="${regClassInstance?.className}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: regClassInstance, field: 'classes', 'error')} ">
	<label for="classes">
		<g:message code="regClass.classes.label" default="Classes" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${regClassInstance?.classes?}" var="c">
    <li><g:link controller="regsheet" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="regsheet" action="create" params="['regClass.id': regClassInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'regsheet.label', default: 'Regsheet')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: regClassInstance, field: 'courseNumber', 'error')} required">
	<label for="courseNumber">
		<g:message code="regClass.courseNumber.label" default="Course Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="courseNumber" name="courseNumber.id" from="${uk.ac.shu.webarch.eregister.Course.list()}" optionKey="id" required="" value="${regClassInstance?.courseNumber?.id}" class="many-to-one" optionValue="courseName"/>
</div>

<div class="fieldcontain ${hasErrors(bean: regClassInstance, field: 'enrol', 'error')} ">
	<label for="enrol">
		<g:message code="regClass.enrol.label" default="Enrol" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${regClassInstance?.enrol?}" var="e">
    <li><g:link controller="enrolment" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="enrolment" action="create" params="['regClass.id': regClassInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'enrolment.label', default: 'Enrolment')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: regClassInstance, field: 'staffNumber', 'error')} required">
	<label for="staffNumber">
		<g:message code="regClass.staffNumber.label" default="Staff Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="staffNumber" name="staffNumber.id" from="${uk.ac.shu.webarch.eregister.Instructor.list()}" optionKey="id" required="" value="${regClassInstance?.staffNumber?.id}" class="many-to-one" optionValue="staffName"/>
</div>

