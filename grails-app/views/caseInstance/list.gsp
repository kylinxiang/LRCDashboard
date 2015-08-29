
<%@ page import="LRC.CaseInstance" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'caseInstance.label', default: 'CaseInstance')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-caseInstance" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-caseInstance" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="caseName" title="${message(code: 'caseInstance.caseName.label', default: 'Case Name')}" />
					
						<g:sortableColumn property="featrueName" title="${message(code: 'caseInstance.featrueName.label', default: 'Featrue Name')}" />
					
						<g:sortableColumn property="nextExecutionNumber" title="${message(code: 'caseInstance.nextExecutionNumber.label', default: 'Next Execution Number')}" />
					
						<g:sortableColumn property="domainName" title="${message(code: 'caseInstance.domainName.label', default: 'Domain Name')}" />
					
						<g:sortableColumn property="executionStatus" title="${message(code: 'caseInstance.executionStatus.label', default: 'Execution Status')}" />
					
						<g:sortableColumn property="duration" title="${message(code: 'caseInstance.duration.label', default: 'Duration')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${caseInstanceInstanceList}" status="i" var="caseInstanceInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${caseInstanceInstance.id}">${fieldValue(bean: caseInstanceInstance, field: "caseName")}</g:link></td>
					
						<td>${fieldValue(bean: caseInstanceInstance, field: "featrueName")}</td>
					
						<td>${fieldValue(bean: caseInstanceInstance, field: "nextExecutionNumber")}</td>
					
						<td>${fieldValue(bean: caseInstanceInstance, field: "domainName")}</td>
					
						<td>${fieldValue(bean: caseInstanceInstance, field: "executionStatus")}</td>
					
						<td>${fieldValue(bean: caseInstanceInstance, field: "duration")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${caseInstanceInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
