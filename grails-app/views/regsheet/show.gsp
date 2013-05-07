
<%@ page import="uk.ac.shu.webarch.eregister.Regsheet" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'regsheet.label', default: 'Regsheet')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-regsheet" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-regsheet" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list regsheet">
			
				<g:if test="${regsheetInstance?.classDate}">
				<li class="fieldcontain">
					<span id="classDate-label" class="property-label"><g:message code="regsheet.classDate.label" default="Class Date" /></span>
					
						<span class="property-value" aria-labelledby="classDate-label"><g:fieldValue bean="${regsheetInstance}" field="classDate"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${regsheetInstance?.className}">
				<li class="fieldcontain">
					<span id="className-label" class="property-label"><g:message code="regsheet.className.label" default="Class Name" /></span>
					
						<span class="property-value" aria-labelledby="className-label"><g:link controller="regClass" action="show" id="${regsheetInstance?.className?.id}">${regsheetInstance?.className?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${regsheetInstance?.classes}">
				<li class="fieldcontain">
					<span id="classes-label" class="property-label"><g:message code="regsheet.classes.label" default="Classes" /></span>
					
						<g:each in="${regsheetInstance.classes}" var="c">
						<span class="property-value" aria-labelledby="classes-label"><g:link controller="regentry" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${regsheetInstance?.sheetNo}">
				<li class="fieldcontain">
					<span id="sheetNo-label" class="property-label"><g:message code="regsheet.sheetNo.label" default="Sheet No" /></span>
					
						<span class="property-value" aria-labelledby="sheetNo-label"><g:fieldValue bean="${regsheetInstance}" field="sheetNo"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${regsheetInstance?.id}" />
					<g:link class="edit" action="edit" id="${regsheetInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
