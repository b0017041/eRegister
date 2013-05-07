<%@ page import="uk.ac.shu.webarch.eregister.Regentry" %>



<div class="fieldcontain ${hasErrors(bean: regentryInstance, field: 'sheetNo', 'error')} required">
	<label for="sheetNo">
		<g:message code="regentry.sheetNo.label" default="Sheet No" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="sheetNo" name="sheetNo.id" from="${uk.ac.shu.webarch.eregister.Regsheet.list()}" optionKey="id" required="" value="${regentryInstance?.sheetNo?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: regentryInstance, field: 'studentID', 'error')} required">
	<label for="studentID">
		<g:message code="regentry.studentID.label" default="Student ID" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="studentID" name="studentID.id" from="${uk.ac.shu.webarch.eregister.Student.list()}" optionKey="id" required="" value="${regentryInstance?.studentID?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: regentryInstance, field: 'ts', 'error')} required">
	<label for="ts">
		<g:message code="regentry.ts.label" default="Ts" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="ts" precision="day"  value="${regentryInstance?.ts}"  />
</div>

