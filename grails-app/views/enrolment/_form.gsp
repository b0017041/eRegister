<%@ page import="uk.ac.shu.webarch.eregister.Enrolment" %>



<div class="fieldcontain ${hasErrors(bean: enrolmentInstance, field: 'className', 'error')} required">
	<label for="className">
		<g:message code="enrolment.className.label" default="Class Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="className" name="className.id" from="${uk.ac.shu.webarch.eregister.RegClass.list()}" optionKey="id" required="" value="${enrolmentInstance?.className?.id}" class="many-to-one" optionValue="className"/>
</div>

<div class="fieldcontain ${hasErrors(bean: enrolmentInstance, field: 'contactDetails', 'error')} ">
	<label for="contactDetails">
		<g:message code="enrolment.contactDetails.label" default="Contact Details" />
		
	</label>
	<g:textField name="contactDetails" value="${enrolmentInstance?.contactDetails}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: enrolmentInstance, field: 'enrolmentNo', 'error')} ">
	<label for="enrolmentNo">
		<g:message code="enrolment.enrolmentNo.label" default="Enrolment No" />
		
	</label>
	<g:textField name="enrolmentNo" value="${enrolmentInstance?.enrolmentNo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: enrolmentInstance, field: 'studentID', 'error')} required">
	<label for="studentID">
		<g:message code="enrolment.studentID.label" default="Student ID" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="studentID" name="studentID.id" from="${uk.ac.shu.webarch.eregister.Student.list()}" optionKey="id" required="" value="${enrolmentInstance?.studentID?.id}" class="many-to-one" optionValue="studentID"/>
</div>

