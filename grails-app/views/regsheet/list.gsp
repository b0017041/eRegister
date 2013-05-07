
<%@ page import="uk.ac.shu.webarch.eregister.Regsheet" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'regsheet.label', default: 'Regsheet')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-regsheet" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-regsheet" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="classDate" title="${message(code: 'regsheet.classDate.label', default: 'Class Date')}" />
					
						<th><g:message code="regsheet.className.label" default="Class Name" /></th>
					
						<g:sortableColumn property="sheetNo" title="${message(code: 'regsheet.sheetNo.label', default: 'Sheet No')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${regsheetInstanceList}" status="i" var="regsheetInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${regsheetInstance.id}">${fieldValue(bean: regsheetInstance, field: "classDate")}</g:link></td>
					
						<td>${regsheetInstance.className.className}</td>
					
						<td>${fieldValue(bean: regsheetInstance, field: "sheetNo")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${regsheetInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
