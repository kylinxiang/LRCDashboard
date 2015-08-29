
<%@ page import="LRC.RegressionCase" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'regressionCase.label', default: 'RegressionCase')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-regressionCase" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-regressionCase" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="caseName" title="${message(code: 'regressionCase.caseName.label', default: 'Case Name')}" />
					
						<g:sortableColumn property="belongTeam" title="${message(code: 'regressionCase.belongTeam.label', default: 'Belong Team')}" />
						
						<g:sortableColumn property="targetLoad" title="${message(code: 'regressionCase.targetLoad.label', default: 'Target Load')}" />
					
						<g:sortableColumn property="status" title="${message(code: 'regressionCase.status.label', default: 'Status')}" />
					
						<g:sortableColumn property="failureReason" title="${message(code: 'regressionCase.failureReason.label', default: 'Failure Reason')}" />
					
						<g:sortableColumn property="comment" title="${message(code: 'regressionCase.comment.label', default: 'Comment')}" />
					
						<g:sortableColumn property="duration" title="${message(code: 'regressionCase.duration.label', default: 'Duration')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${regressionCaseInstanceList}" status="i" var="regressionCaseInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${regressionCaseInstance.id}">${fieldValue(bean: regressionCaseInstance, field: "caseName")}</g:link></td>
					
						<td>${fieldValue(bean: regressionCaseInstance, field: "belongTeam")}</td>
						
						<td>${fieldValue(bean: regressionCaseInstance, field: "targetLoad")}</td>
					
						<td>${fieldValue(bean: regressionCaseInstance, field: "status")}</td>
					
						<td>${fieldValue(bean: regressionCaseInstance, field: "failureReason")}</td>
					
						<td>${fieldValue(bean: regressionCaseInstance, field: "comment")}</td>
					
						<td>${fieldValue(bean: regressionCaseInstance, field: "duration")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${regressionCaseInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
