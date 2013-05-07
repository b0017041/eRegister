
<%@ page import="uk.ac.shu.webarch.eregister.Enrolment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'enrolment.label', default: 'Enrolment')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-enrolment" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-enrolment" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="enrolment.className.label" default="Class Name" /></th>
					
						<g:sortableColumn property="contactDetails" title="${message(code: 'enrolment.contactDetails.label', default: 'Contact Details')}" />
					
						<g:sortableColumn property="enrolmentNo" title="${message(code: 'enrolment.enrolmentNo.label', default: 'Enrolment No')}" />
					
						<th><g:message code="enrolment.studentID.label" default="Student ID" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${enrolmentInstanceList}" status="i" var="enrolmentInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${enrolmentInstance.id}">${enrolmentInstance.className.className}</g:link></td>
					
						<td>${fieldValue(bean: enrolmentInstance, field: "contactDetails")}</td>
					
						<td>${fieldValue(bean: enrolmentInstance, field: "enrolmentNo")}</td>
					
						<td>${enrolmentInstance.studentID.studentID}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${enrolmentInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
