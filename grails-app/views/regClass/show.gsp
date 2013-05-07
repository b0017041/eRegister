
<%@ page import="uk.ac.shu.webarch.eregister.RegClass" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'regClass.label', default: 'RegClass')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-regClass" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-regClass" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list regClass">
			
				<g:if test="${regClassInstance?.className}">
				<li class="fieldcontain">
					<span id="className-label" class="property-label"><g:message code="regClass.className.label" default="Class Name" /></span>
					
						<span class="property-value" aria-labelledby="className-label"><g:fieldValue bean="${regClassInstance}" field="className"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${regClassInstance?.classes}">
				<li class="fieldcontain">
					<span id="classes-label" class="property-label"><g:message code="regClass.classes.label" default="Classes" /></span>
					
						<g:each in="${regClassInstance.classes}" var="c">
						<span class="property-value" aria-labelledby="classes-label"><g:link controller="regsheet" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${regClassInstance?.courseNumber}">
				<li class="fieldcontain">
					<span id="courseNumber-label" class="property-label"><g:message code="regClass.courseNumber.label" default="Course Number" /></span>
					
						<span class="property-value" aria-labelledby="courseNumber-label"><g:link controller="course" action="show" id="${regClassInstance?.courseNumber?.id}">${regClassInstance?.courseNumber?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${regClassInstance?.enrol}">
				<li class="fieldcontain">
					<span id="enrol-label" class="property-label"><g:message code="regClass.enrol.label" default="Enrol" /></span>
					
						<g:each in="${regClassInstance.enrol}" var="e">
						<span class="property-value" aria-labelledby="enrol-label"><g:link controller="enrolment" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${regClassInstance?.staffNumber}">
				<li class="fieldcontain">
					<span id="staffNumber-label" class="property-label"><g:message code="regClass.staffNumber.label" default="Staff Number" /></span>
					
						<span class="property-value" aria-labelledby="staffNumber-label"><g:link controller="instructor" action="show" id="${regClassInstance?.staffNumber?.id}">${regClassInstance?.staffNumber?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${regClassInstance?.id}" />
					<g:link class="edit" action="edit" id="${regClassInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
