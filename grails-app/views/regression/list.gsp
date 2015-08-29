
<%@ page import="LRC.Regression" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'regression.label', default: 'Regression')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-regression" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="ciRp" action="chart">CBR CHART</g:link></li>
			</ul>
		</div>
		<div id="list-regression" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
						<g:sortableColumn property="executionStartTime" title="${message(code: 'regression.executionStartTime.label', default: 'Execution Start Time')}" />
						<g:sortableColumn property="targetLoadName" title="${message(code: 'regression.targetLoadName.label', default: 'Target Load Name')}" />
						<g:sortableColumn property="cbrStatus" title="${message(code: 'regression.cbrStatus.label', default: 'CBR Status')}" />
						<g:sortableColumn property="comments" title="AT Pass Ratio" />
						<g:sortableColumn property="comments" title="All CBR Pass Ratio" />
						<g:sortableColumn property="comments" title="All Duration" />
						<g:sortableColumn property="comments" title="Valued Duration" />
					</tr>
				</thead>
				<tbody>
				<g:each in="${regressionInstanceList}" status="i" var="regressionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td><g:link action="show" id="${regressionInstance.id}">${fieldValue(bean: regressionInstance, field: "executionStartTime")}</g:link></td>
						<td>${fieldValue(bean: regressionInstance, field: "targetLoadName")}</td>
						<td>${fieldValue(bean: regressionInstance, field: "cbrStatus")}</td>
						<td>${regressionInstance?.getCriticalPassRatio()}%</td>
						<td>${regressionInstance?.getPassRatio()}%</td>
						<td>${fieldValue(bean: regressionInstance, field: "allExecutionMinutes")} Mins</td>
						<td>${regressionInstance?.estimateValuedDuration()} Mins</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${regressionInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
