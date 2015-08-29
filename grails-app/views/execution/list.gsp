
<%@ page import="LRC.Execution" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'execution.label', default: 'Execution')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-execution" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="regg" action="stat">Regression Charts</g:link></li>
			</ul>
		</div>
		<div id="list-execution" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
						<g:sortableColumn style="text-align:center;width: 10%" property="executionDate" title="${message(code: 'execution.executionDate.label', default: 'Execution Date')}" />
					
						<g:sortableColumn style="text-align:center;width: 10%" property="nsnCPCaseNumberTA" title="${message(code: 'execution.nsnCPCaseNumberTA.label', default: 'Nsn CP ')}" />
						
						<g:sortableColumn style="text-align:center;width: 10%" property="nsnCMCaseNumberTA" title="${message(code: 'execution.nsnCMCaseNumberTA.label', default: 'Nsn CM ')}" />
						
						<g:sortableColumn style="text-align:center;width: 10%" property="cieNetCMCaseNumberTA" title="${message(code: 'execution.cieNetCMCaseNumberTA.label', default: 'CieNet CM ')}" />

						<g:sortableColumn style="text-align:center;width: 10%" property="cieNetCPCaseNumberTA" title="${message(code: 'execution.cieNetCPCaseNumberTA.label', default: 'CieNet CP ')}" />

						<g:sortableColumn style="text-align:center;width: 10%" property="nsnCPCaseNumberTAPass" title="${message(code: 'execution.nsnCPCaseNumberTAPass.label', default: 'Nsn CP PASS')}" />

						<g:sortableColumn style="text-align:center;width: 10%" property="nsnCMCaseNumberTAPass" title="${message(code: 'execution.nsnCMCaseNumberTAPass.label', default: 'Nsn CM PASS')}" />

						<g:sortableColumn style="text-align:center;width: 10%" property="cieNetCPCaseNumberTAPass" title="${message(code: 'execution.cieNetCPCaseNumberTAPass.label', default: 'CieNet CP PASS')}" />

						<g:sortableColumn style="text-align:center;width: 10%" property="cieNetCMCaseNumberTAPass" title="${message(code: 'execution.cieNetCMCaseNumberTAPass.label', default: 'CieNet CM PASS')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${executionInstanceList}" status="i" var="executionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td style="text-align: center; vertical-align: middle"><g:link action="show" id="${executionInstance.id}">${fieldValue(bean: executionInstance, field: "executionDate")}</g:link></td>
					
						<td style="text-align: center; vertical-align: middle">${fieldValue(bean: executionInstance, field: "nsnCPCaseNumberTA")}</td>
					
						<td style="text-align: center; vertical-align: middle">${fieldValue(bean: executionInstance, field: "nsnCMCaseNumberTA")}</td>
					
						<td style="text-align: center; vertical-align: middle">${fieldValue(bean: executionInstance, field: "cieNetCMCaseNumberTA")}</td>
					
						<td style="text-align: center; vertical-align: middle">${fieldValue(bean: executionInstance, field: "cieNetCPCaseNumberTA")}</td>
						
						<td style="text-align: center; vertical-align: middle">${fieldValue(bean: executionInstance, field: "nsnCPCaseNumberTAPass")}</td>
						
						<td style="text-align: center; vertical-align: middle">${fieldValue(bean: executionInstance, field: "nsnCMCaseNumberTAPass")}</td>
						
						<td style="text-align: center; vertical-align: middle">${fieldValue(bean: executionInstance, field: "cieNetCPCaseNumberTAPass")}</td>
						
						<td style="text-align: center; vertical-align: middle">${fieldValue(bean: executionInstance, field: "cieNetCMCaseNumberTAPass")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${executionInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
