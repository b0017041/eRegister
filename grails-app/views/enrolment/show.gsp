
<%@ page import="uk.ac.shu.webarch.eregister.Enrolment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'enrolment.label', default: 'Enrolment')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-enrolment" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-enrolment" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list enrolment">
			
				<g:if test="${enrolmentInstance?.className}">
				<li class="fieldcontain">
					<span id="className-label" class="property-label"><g:message code="enrolment.className.label" default="Class Name" /></span>
					
						<span class="property-value" aria-labelledby="className-label"><g:link controller="regClass" action="show" id="${enrolmentInstance?.className?.id}">${enrolmentInstance?.className?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${enrolmentInstance?.contactDetails}">
				<li class="fieldcontain">
					<span id="contactDetails-label" class="property-label"><g:message code="enrolment.contactDetails.label" default="Contact Details" /></span>
					
						<span class="property-value" aria-labelledby="contactDetails-label"><g:fieldValue bean="${enrolmentInstance}" field="contactDetails"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${enrolmentInstance?.enrolmentNo}">
				<li class="fieldcontain">
					<span id="enrolmentNo-label" class="property-label"><g:message code="enrolment.enrolmentNo.label" default="Enrolment No" /></span>
					
						<span class="property-value" aria-labelledby="enrolmentNo-label"><g:fieldValue bean="${enrolmentInstance}" field="enrolmentNo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${enrolmentInstance?.studentID}">
				<li class="fieldcontain">
					<span id="studentID-label" class="property-label"><g:message code="enrolment.studentID.label" default="Student ID" /></span>
					
						<span class="property-value" aria-labelledby="studentID-label"><g:link controller="student" action="show" id="${enrolmentInstance?.studentID?.id}">${enrolmentInstance?.studentID?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${enrolmentInstance?.id}" />
					<g:link class="edit" action="edit" id="${enrolmentInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
