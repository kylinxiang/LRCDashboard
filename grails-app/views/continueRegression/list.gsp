
<%@ page import="LRC.ContinueRegression" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'continueRegression.label', default: 'ContinueRegression')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-continueRegression" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-continueRegression" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="week" title="${message(code: 'continueRegression.week.label', default: 'Week')}" />
					
						<g:sortableColumn property="targetReleaeBranch" title="${message(code: 'continueRegression.targetReleaeBranch.label', default: 'Branch')}" />
					
						<g:sortableColumn property="executionStartTime" title="${message(code: 'continueRegression.executionStartTime.label', default: 'Start Time')}" />
					
						<g:sortableColumn property="allNumber" title="${message(code: 'continueRegression.allNumber.label', default: 'Planned')}" />
						
						<g:sortableColumn property="executedNumber" title="${message(code: 'continueRegression.executedNumber.label', default: 'Executed')}" />
						
						<g:sortableColumn property="allExecutionMinutes" title="${message(code: 'continueRegression.allExecutionMinutes.label', default: 'All Duration')}" />
						
						<g:sortableColumn property="allNumber" title="Valued Duration" />
						
						<g:sortableColumn property="allNumber" title="Exec Ratio" />
						
						<g:sortableColumn property="allNumber" title="Pass Ratio" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${continueRegressionInstanceList}" status="i" var="continueRegressionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${continueRegressionInstance.id}">${fieldValue(bean: continueRegressionInstance, field: "week")}</g:link></td>
					
						<td>${fieldValue(bean: continueRegressionInstance, field: "targetReleaeBranch")}</td>
					
						<td>${fieldValue(bean: continueRegressionInstance, field: "executionStartTime")}</td>
					
						<td>${fieldValue(bean: continueRegressionInstance, field: "allNumber")}</td>
						
						<td>${fieldValue(bean: continueRegressionInstance, field: "executedNumber")}</td>
						
						<td>${fieldValue(bean: continueRegressionInstance, field: "allExecutionMinutes")} Mins</td>
						
						<td>${continueRegressionInstance?.estimateValuedDuration()} Mins</td>
						
						<td>${continueRegressionInstance?.getExecutionRatio()}%</td>
						
						<td>${continueRegressionInstance?.getPassRatio()}%</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${continueRegressionInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
