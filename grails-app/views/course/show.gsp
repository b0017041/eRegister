
<%@ page import="uk.ac.shu.webarch.eregister.Course" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'course.label', default: 'Course')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-course" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-course" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list course">
			
				<g:if test="${courseInstance?.courseNumber}">
				<li class="fieldcontain">
					<span id="courseNumber-label" class="property-label"><g:message code="course.courseNumber.label" default="Course Number" /></span>
					
						<span class="property-value" aria-labelledby="courseNumber-label"><g:fieldValue bean="${courseInstance}" field="courseNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${courseInstance?.classes}">
				<li class="fieldcontain">
					<span id="classes-label" class="property-label"><g:message code="course.classes.label" default="Classes" /></span>
					
						<g:each in="${courseInstance.classes}" var="c">
						<span class="property-value" aria-labelledby="classes-label"><g:link controller="regClass" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${courseInstance?.courseLeader}">
				<li class="fieldcontain">
					<span id="courseLeader-label" class="property-label"><g:message code="course.courseLeader.label" default="Course Leader" /></span>
					
						<span class="property-value" aria-labelledby="courseLeader-label"><g:link controller="instructor" action="show" id="${courseInstance?.courseLeader?.id}">${courseInstance?.courseLeader?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${courseInstance?.courseName}">
				<li class="fieldcontain">
					<span id="courseName-label" class="property-label"><g:message code="course.courseName.label" default="Course Name" /></span>
					
						<span class="property-value" aria-labelledby="courseName-label"><g:fieldValue bean="${courseInstance}" field="courseName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${courseInstance?.courses}">
				<li class="fieldcontain">
					<span id="courses-label" class="property-label"><g:message code="course.courses.label" default="Courses" /></span>
					
						<g:each in="${courseInstance.courses}" var="c">
						<span class="property-value" aria-labelledby="courses-label"><g:link controller="student" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${courseInstance?.faculty}">
				<li class="fieldcontain">
					<span id="faculty-label" class="property-label"><g:message code="course.faculty.label" default="Faculty" /></span>
					
						<span class="property-value" aria-labelledby="faculty-label"><g:fieldValue bean="${courseInstance}" field="faculty"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${courseInstance?.id}" />
					<g:link class="edit" action="edit" id="${courseInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
