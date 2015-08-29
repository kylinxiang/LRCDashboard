
<%@ page import="LRC.CorrectedPronto" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'correctedPronto.label', default: 'CorrectedPronto')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-correctedPronto" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-correctedPronto" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="prontoID" title="${message(code: 'correctedPronto.prontoID.label', default: 'Pronto ID')}" />
					
						<g:sortableColumn property="componentName" title="${message(code: 'correctedPronto.componentName.label', default: 'Component Name')}" />
					
						<g:sortableColumn property="componentBaseLine" title="${message(code: 'correctedPronto.componentBaseLine.label', default: 'Component Base Line')}" />
					
						<g:sortableColumn property="prontoDescription" title="${message(code: 'correctedPronto.prontoDescription.label', default: 'Pronto Description')}" />
						
						<g:sortableColumn property="FeatureBuild" title="Feature Build Name" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${correctedProntoInstanceList}" status="i" var="correctedProntoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${correctedProntoInstance.id}">${fieldValue(bean: correctedProntoInstance, field: "prontoID")}</g:link></td>
					
						<td>${fieldValue(bean: correctedProntoInstance, field: "componentName")}</td>
					
						<td>${fieldValue(bean: correctedProntoInstance, field: "componentBaseLine")}</td>
					
						<td>${fieldValue(bean: correctedProntoInstance, field: "prontoDescription")}</td>
						
                        <td>
							<g:each in="${correctedProntoInstance.featurebuilds}" var="d">
                                  <g:link controller="correctedPronto" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link><br/>
                          	</g:each>
						</td>						
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${correctedProntoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
