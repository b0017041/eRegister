
<%@ page import="uk.ac.shu.webarch.eregister.Student" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'student.label', default: 'Student')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-student" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-student" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list student">
			
				<g:if test="${studentInstance?.studentID}">
				<li class="fieldcontain">
					<span id="studentID-label" class="property-label"><g:message code="student.studentID.label" default="Student ID" /></span>
					
						<span class="property-value" aria-labelledby="studentID-label"><g:fieldValue bean="${studentInstance}" field="studentID"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${studentInstance?.attendances}">
				<li class="fieldcontain">
					<span id="attendances-label" class="property-label"><g:message code="student.attendances.label" default="Attendances" /></span>
					
						<g:each in="${studentInstance.attendances}" var="a">
						<span class="property-value" aria-labelledby="attendances-label"><g:link controller="regentry" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${studentInstance?.classes}">
				<li class="fieldcontain">
					<span id="classes-label" class="property-label"><g:message code="student.classes.label" default="Classes" /></span>
					
						<g:each in="${studentInstance.classes}" var="c">
						<span class="property-value" aria-labelledby="classes-label"><g:link controller="enrolment" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${studentInstance?.courseNumber}">
				<li class="fieldcontain">
					<span id="courseNumber-label" class="property-label"><g:message code="student.courseNumber.label" default="Course Number" /></span>
					
						<span class="property-value" aria-labelledby="courseNumber-label"><g:link controller="course" action="show" id="${studentInstance?.courseNumber?.id}">${studentInstance?.courseNumber?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${studentInstance?.learningCentreNo}">
				<li class="fieldcontain">
					<span id="learningCentreNo-label" class="property-label"><g:message code="student.learningCentreNo.label" default="Learning Centre No" /></span>
					
						<span class="property-value" aria-labelledby="learningCentreNo-label"><g:fieldValue bean="${studentInstance}" field="learningCentreNo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${studentInstance?.studentName}">
				<li class="fieldcontain">
					<span id="studentName-label" class="property-label"><g:message code="student.studentName.label" default="Student Name" /></span>
					
						<span class="property-value" aria-labelledby="studentName-label"><g:fieldValue bean="${studentInstance}" field="studentName"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${studentInstance?.id}" />
					<g:link class="edit" action="edit" id="${studentInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
