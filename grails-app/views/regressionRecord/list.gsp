
<%@ page import="LRC.RegressionRecord" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'regressionRecord.label', default: 'RegressionRecord')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-regressionRecord" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-regressionRecord" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="executedLoadNumber" title="${message(code: 'regressionRecord.executedLoadNumber.label', default: 'Executed Load Number')}" />
					
						<g:sortableColumn property="executedNumber" title="${message(code: 'regressionRecord.executedNumber.label', default: 'Executed Number')}" />
					
						<g:sortableColumn property="executionDuration" title="${message(code: 'regressionRecord.executionDuration.label', default: 'Execution Duration')}" />
					
						<g:sortableColumn property="failedNumber" title="${message(code: 'regressionRecord.failedNumber.label', default: 'Failed Number')}" />
					
						<g:sortableColumn property="passedNumber" title="${message(code: 'regressionRecord.passedNumber.label', default: 'Passed Number')}" />
					
						<g:sortableColumn property="recordTime" title="${message(code: 'regressionRecord.recordTime.label', default: 'Record Time')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${regressionRecordInstanceList}" status="i" var="regressionRecordInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${regressionRecordInstance.id}">${fieldValue(bean: regressionRecordInstance, field: "executedLoadNumber")}</g:link></td>
					
						<td>${fieldValue(bean: regressionRecordInstance, field: "executedNumber")}</td>
					
						<td>${fieldValue(bean: regressionRecordInstance, field: "executionDuration")}</td>
					
						<td>${fieldValue(bean: regressionRecordInstance, field: "failedNumber")}</td>
					
						<td>${fieldValue(bean: regressionRecordInstance, field: "passedNumber")}</td>
					
						<td>${fieldValue(bean: regressionRecordInstance, field: "recordTime")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${regressionRecordInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
