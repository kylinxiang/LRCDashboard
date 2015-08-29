
<%@ page import="LRC.Pronto" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pronto.label', default: 'Pronto')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-pronto" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="stat">Statics</g:link></li>
				<li><g:link class="create" action="stat2">Statics2</g:link></li>
			</ul>
		</div>
		<div id="list-pronto" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="prontoID" title="${message(code: 'pronto.prontoID.label', default: 'pronto ID')}" />
					
						<g:sortableColumn property="foundArea" title="${message(code: 'pronto.foundArea.label', default: 'Found Area')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'pronto.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="owner" title="${message(code: 'pronto.owner.label', default: 'Owner')}" />
					
						<g:sortableColumn property="status" title="${message(code: 'pronto.status.label', default: 'Status')}" />
					
						<g:sortableColumn property="priority" title="${message(code: 'pronto.priority.label', default: 'Priority')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${prontoInstanceList}" status="i" var="prontoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${prontoInstance.id}">${fieldValue(bean: prontoInstance, field: "prontoID")}</g:link></td>
					
						<td>${fieldValue(bean: prontoInstance, field: "foundArea")}</td>
					
						<td>${fieldValue(bean: prontoInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: prontoInstance, field: "owner")}</td>
					
						<td>${fieldValue(bean: prontoInstance, field: "status")}</td>
					
						<td>${fieldValue(bean: prontoInstance, field: "priority")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${prontoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
