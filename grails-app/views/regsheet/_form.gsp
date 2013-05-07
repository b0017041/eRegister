<%@ page import="uk.ac.shu.webarch.eregister.Regsheet" %>



<div class="fieldcontain ${hasErrors(bean: regsheetInstance, field: 'classDate', 'error')} ">
	<label for="classDate">
		<g:message code="regsheet.classDate.label" default="Class Date" />
		
	</label>
	<g:textField name="classDate" value="${regsheetInstance?.classDate}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: regsheetInstance, field: 'className', 'error')} required">
	<label for="className">
		<g:message code="regsheet.className.label" default="Class Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="className" name="className.id" from="${uk.ac.shu.webarch.eregister.RegClass.list()}" optionKey="id" required="" value="${regsheetInstance?.className?.id}" class="many-to-one" optionValue="className"/>
</div>

<div class="fieldcontain ${hasErrors(bean: regsheetInstance, field: 'classes', 'error')} ">
	<label for="classes">
		<g:message code="regsheet.classes.label" default="Classes" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${regsheetInstance?.classes?}" var="c">
    <li><g:link controller="regentry" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="regentry" action="create" params="['regsheet.id': regsheetInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'regentry.label', default: 'Regentry')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: regsheetInstance, field: 'sheetNo', 'error')} ">
	<label for="sheetNo">
		<g:message code="regsheet.sheetNo.label" default="Sheet No" />
		
	</label>
	<g:textField name="sheetNo" value="${regsheetInstance?.sheetNo}"/>
</div>

