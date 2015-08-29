
<%@ page import="LRC.Audience" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'audience.label', default: 'Audience')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-audience" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-audience" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="mailAddress" title="${message(code: 'audience.mailAddress.label', default: 'Mail Address')}" />
					
						<g:sortableColumn property="isbcc" title="${message(code: 'audience.isbcc.label', default: 'Isbcc')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${audienceInstanceList}" status="i" var="audienceInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${audienceInstance.id}">${fieldValue(bean: audienceInstance, field: "mailAddress")}</g:link></td>
					
						<td><g:formatBoolean boolean="${audienceInstance.isbcc}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${audienceInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
