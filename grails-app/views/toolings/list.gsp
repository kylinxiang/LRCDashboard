
<%@ page import="LRC.Toolings" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'toolings.label', default: 'Toolings')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-toolings" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-toolings" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
						<g:sortableColumn property="featureBranch" title="${message(code: 'toolings.featureBranch.label', default: 'Feature Branch')}" />
						<g:sortableColumn property="releaseLabel" title="${message(code: 'toolings.releaseLabel.label', default: 'Release Label')}" />					
						<g:sortableColumn property="middleWare" title="${message(code: 'toolings.middleWare.label', default: 'CF Version')}" />
						<g:sortableColumn property="cntCPVersion" title="${message(code: 'toolings.cntCPVersion.label', default: 'CP Version')}" />
						<g:sortableColumn property="cntSVVersion" title="${message(code: 'toolings.cntSVVersion.label', default: 'SV Version')}" />
						<g:sortableColumn property="isAbolish" title="${message(code: 'toolings.isAbolish.label', default: 'isAbolish')}" />
					</tr>
				</thead>
				<tbody>
				<g:each in="${toolingsInstanceList}" status="i" var="toolingsInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td class="<% 
							if(toolingsInstance.isAbolish) {
								out.print('ABOLISH')
							} else {
								out.print('ALIVE')
							}
						%>">
							<g:link action="show" id="${toolingsInstance.id}">${fieldValue(bean: toolingsInstance, field: "featureBranch")}</g:link>
						</td>
						
						<td class="<% 
							if(toolingsInstance.isAbolish()) {
								out.print('ABOLISH')
							} else {
								out.print('ALIVE')
							}
						%>">${fieldValue(bean: toolingsInstance, field: "releaseLabel")}</td>
						
						<td class="<%
							if(toolingsInstance.isAbolish) {
								out.print('ABOLISH')
							} else {
								out.print('ALIVE')
							}
						 %>">${fieldValue(bean: toolingsInstance, field: "middleWare")}</td>
						
						<td class="<% 
							if(toolingsInstance.isAbolish) {
								out.print('ABOLISH')
							} else {
								out.print('ALIVE')
							}
						%>">${fieldValue(bean: toolingsInstance, field: "cntCPVersion")}</td>
						
						<td class="<%
							if(toolingsInstance.isAbolish) {
								out.print('ABOLISH')
							} else {
								out.print('ALIVE')
							}
						 %>">${fieldValue(bean: toolingsInstance, field: "cntSVVersion")}</td>
						
						<td class="<%
							if(toolingsInstance.isAbolish) {
								out.print('ABOLISH')
							} else {
								out.print('ALIVE')
							}
						 %>"><g:formatBoolean boolean="${toolingsInstance.isAbolish}" /></td> 
						 
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${toolingsInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
