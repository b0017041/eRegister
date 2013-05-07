
<%@ page import="uk.ac.shu.webarch.eregister.Instructor" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'instructor.label', default: 'Instructor')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-instructor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-instructor" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list instructor">
			
				<g:if test="${instructorInstance?.staffNumber}">
				<li class="fieldcontain">
					<span id="staffNumber-label" class="property-label"><g:message code="instructor.staffNumber.label" default="Staff Number" /></span>
					
						<span class="property-value" aria-labelledby="staffNumber-label"><g:fieldValue bean="${instructorInstance}" field="staffNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${instructorInstance?.classes}">
				<li class="fieldcontain">
					<span id="classes-label" class="property-label"><g:message code="instructor.classes.label" default="Classes" /></span>
					
						<g:each in="${instructorInstance.classes}" var="c">
						<span class="property-value" aria-labelledby="classes-label"><g:link controller="regClass" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${instructorInstance?.contactDetails}">
				<li class="fieldcontain">
					<span id="contactDetails-label" class="property-label"><g:message code="instructor.contactDetails.label" default="Contact Details" /></span>
					
						<span class="property-value" aria-labelledby="contactDetails-label"><g:fieldValue bean="${instructorInstance}" field="contactDetails"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${instructorInstance?.faculty}">
				<li class="fieldcontain">
					<span id="faculty-label" class="property-label"><g:message code="instructor.faculty.label" default="Faculty" /></span>
					
						<span class="property-value" aria-labelledby="faculty-label"><g:fieldValue bean="${instructorInstance}" field="faculty"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${instructorInstance?.staffName}">
				<li class="fieldcontain">
					<span id="staffName-label" class="property-label"><g:message code="instructor.staffName.label" default="Staff Name" /></span>
					
						<span class="property-value" aria-labelledby="staffName-label"><g:fieldValue bean="${instructorInstance}" field="staffName"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${instructorInstance?.id}" />
					<g:link class="edit" action="edit" id="${instructorInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
